package com.dasw.dao;

import java.util.HashMap;
import java.util.List;

import com.dasw.entity.Purchase;
import com.dasw.entity.PurchaseDetail;

import org.springframework.stereotype.Repository;

@Repository(value="purchaseMapper")
public interface PurchaseMapper {
    

    int deleteByPrimaryKey(Integer purchaseId);

    int insert(Purchase record);

    int insertSelective(Purchase record);

    Purchase selectByPrimaryKey(Integer purchaseId);

    int updateByPrimaryKeySelective(Purchase record);

    int updateByPrimaryKey(Purchase record);
    
    List<PurchaseDetail> findAll();
    
    List<PurchaseDetail> findLimit(PurchaseDetail purchaseDetail);
    
    PurchaseDetail findById(Integer purchaseId);

	int selectPurchasePageCount(PurchaseDetail purchaseDetail);

	List<PurchaseDetail> selectPurchaseByPage(HashMap<String, Object> map);
}