package com.dasw.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dasw.dao.FinancialMapper;
import com.dasw.entity.Financial;
import com.dasw.entity.Page;
import com.dasw.service.FinancialService;


@Service(value = "financialService")
@Transactional
public class FinancialServiceImpl implements FinancialService{
	
	@Autowired
	FinancialMapper financialMapper;
	
	public List<Financial> findAll(){
		return financialMapper.findAll();
	}
	
	public List<Financial> findByQuery(String id,String name,String start,String end,String ispay){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orderId", id);
		map.put("customerName", name);
		map.put("startDate", start);
		map.put("endDate", end);
		map.put("isPay", ispay);	
		return financialMapper.findByQuery(map);
	}	
	
	
	public Page<Financial> selectPageByPage(String id,String name,String start,String end,String ispay,Integer pageIndex){
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		Page<Financial> page = new Page<Financial>();
		
		map1.put("orderId", id);
		map1.put("customerName", name);
		map1.put("startDate", start);
		map1.put("endDate", end);
		map1.put("isPay", ispay);	
		
		//封装当前页数
		page.setPageIndex(pageIndex);
		
		//每页显示的数据
		int pageSize = 20;
		page.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = financialMapper.selectFinancialPageCount(map1);
		page.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);//向上取整
		page.setTotalPage(num.intValue());
		
		map2.put("start", (pageIndex-1)*pageSize);
		map2.put("size", page.getPageSize());
		map2.put("orderId", id);
		map2.put("customerName", name);
		map2.put("startDate", start);
		map2.put("endDate", end);
		map2.put("isPay", ispay);			
			
		//封装每页显示的数据
		List<Financial> sList= financialMapper.selectFinancialByPage(map2);
		page.setList(sList);
		
		return page;
	}

}
