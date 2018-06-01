package com.dasw.dao;



import java.util.HashMap;
import java.util.List;


import com.dasw.entity.Supplier;

public interface SupplierMapper {

	public List<Supplier> findAll();
		
    int deleteByPrimaryKey(Integer supplierId);

    int insert(Supplier record);

    int insertSelective(Supplier record);


    Supplier selectByPrimaryKey(Integer supplierId);

    int selectSupplierPageCount(Supplier supplier);
    
    List<Supplier> selectSupplierByPage(HashMap<String,Object> map);

    Supplier findSupplierByName(String supplierName);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);
}