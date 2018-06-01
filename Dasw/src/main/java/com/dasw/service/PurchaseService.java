package com.dasw.service;

import java.util.List;

import com.dasw.entity.Page;
import com.dasw.entity.Purchase;
import com.dasw.entity.PurchaseDetail;

public interface PurchaseService {

	public int deleteByPrimaryKey(Integer purchaseId);

    public int insert(Purchase record);

    public int insertSelective(Purchase record);

    public Purchase selectByPrimaryKey(Integer purchaseId);

    public int updateByPrimaryKeySelective(Purchase record);

    public int updateByPrimaryKey(Purchase record);
    
    public List<PurchaseDetail> findAll();
    
    public List<PurchaseDetail> findLimit(PurchaseDetail purchaseDetail);
    
    public PurchaseDetail findById(Integer purchaseId);

	public Page<PurchaseDetail> selectPurchaseByPage(
			PurchaseDetail purchaseDetail, Integer pageIndex);
    
}
