package com.dasw.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dasw.dao.PurchaseMapper;
import com.dasw.entity.OrderDetail;
import com.dasw.entity.Page;
import com.dasw.entity.Purchase;
import com.dasw.entity.PurchaseDetail;
import com.dasw.service.PurchaseService;

@Service(value = "purchaseService")
@Transactional
public class PurchaseServiceImpl  implements PurchaseService{
	
	@Autowired
	private PurchaseMapper purchaseMapper;
	
	public int deleteByPrimaryKey(Integer supplierId) {
		return purchaseMapper.deleteByPrimaryKey(supplierId);
	}

	public int insert(Purchase record) {
		return purchaseMapper.insert(record);
	}

	public int insertSelective(Purchase record) {
		return purchaseMapper.insertSelective(record);
	}

	public Purchase selectByPrimaryKey(Integer supplierId) {
		return purchaseMapper.selectByPrimaryKey(supplierId);
	}

	public int updateByPrimaryKeySelective(Purchase record) {
		return purchaseMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Purchase record) {
		return purchaseMapper.updateByPrimaryKey(record);
	}

	public List<PurchaseDetail> findAll() {
		return purchaseMapper.findAll();
	}

	public List<PurchaseDetail> findLimit(PurchaseDetail purchaseDetail) {
		return purchaseMapper.findLimit(purchaseDetail);
	}

	public PurchaseDetail findById(Integer purchaseId) {
		
		return purchaseMapper.findById(purchaseId);
	}

	public Page<PurchaseDetail> selectPurchaseByPage(
			PurchaseDetail purchaseDetail, Integer pageIndex) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Page<PurchaseDetail> page = new Page<PurchaseDetail>();
		
		//封装当前页数
		page.setPageIndex(pageIndex);
		
		//每页显示的数据
		int pageSize = 20;
		page.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = purchaseMapper.selectPurchasePageCount(purchaseDetail);
		page.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);//向上取整
		page.setTotalPage(num.intValue());
		
		map.put("start", (pageIndex-1)*pageSize);
		map.put("size", page.getPageSize());
		map.put("stockProductId", purchaseDetail.getStockProductId());
		map.put("produceName", purchaseDetail.getProduceName());
		map.put("supplierName", purchaseDetail.getSupplierName());
		map.put("purchaseDate", purchaseDetail.getPurchaseDate());
		
		
		
		
		//封装每页显示的数据
		List<PurchaseDetail> sList= purchaseMapper.selectPurchaseByPage(map);
		page.setList(sList);
		
		return page;
	}

}
