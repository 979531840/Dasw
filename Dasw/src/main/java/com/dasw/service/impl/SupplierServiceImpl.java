package com.dasw.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dasw.dao.SupplierMapper;
import com.dasw.entity.Supplier;
import com.dasw.entity.Page;

import com.dasw.service.SupplierService;


@Service(value = "SupplierService")
@Transactional
public class SupplierServiceImpl implements SupplierService{

	@Autowired
	private SupplierMapper supplierMapper;

	public List<Supplier> findAll() {
		
		return supplierMapper.findAll();
	}

	public int deleteByPrimaryKey(Integer supplierId) {
		
		return supplierMapper.deleteByPrimaryKey(supplierId);
	}

	public int insert(Supplier record) {
		
		return supplierMapper.insert(record);
	}

	public int insertSelective(Supplier record) {
		
		return supplierMapper.insertSelective(record);
	}

	public Supplier selectByPrimaryKey(Integer supplierId) {
		
		return supplierMapper.selectByPrimaryKey(supplierId);
	}

	public int updateByPrimaryKeySelective(Supplier record) {
		
		return supplierMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Supplier record) {
		
		return supplierMapper.updateByPrimaryKey(record);
	}

	public Page<Supplier> selectSupplierByPage(String sname,
			String companyName, Integer pageIndex) {
		Supplier supplier=new Supplier();
		supplier.setSupplierName(sname);
		supplier.setSupplierCompany(companyName);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Page<Supplier> page = new Page<Supplier>();
		
		//封装当前页数
		page.setPageIndex(pageIndex);
		
		//每页显示的数据
		int pageSize = 20;
		page.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = supplierMapper.selectSupplierPageCount(supplier);
		page.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);//向上取整
		page.setTotalPage(num.intValue());
		
		map.put("start", (pageIndex-1)*pageSize);
		map.put("size", page.getPageSize());
		map.put("supplierName", sname);
		map.put("supplierCompany", companyName);
		
		
		//封装每页显示的数据
		List<Supplier> sList= supplierMapper.selectSupplierByPage(map);
		page.setList(sList);
		
		return page;
	}

	public Supplier findSupplierByName(String supplierName) {
		// TODO Auto-generated method stub
		return supplierMapper.findSupplierByName(supplierName);
	}



	
	
	
	

}
