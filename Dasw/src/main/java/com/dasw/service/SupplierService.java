package com.dasw.service;

import java.util.List;


import com.dasw.entity.Page;
import com.dasw.entity.Supplier;

public interface SupplierService {
	public List<Supplier> findAll();
	
    public int deleteByPrimaryKey(Integer supplierId);

    public  int insert(Supplier record);

    public int insertSelective(Supplier record);


    public  Supplier selectByPrimaryKey(Integer supplierId);
    
    //分页查询和条件模糊查询
    public Page<Supplier> selectSupplierByPage(String sname,String companyName,Integer pageIndex);



    public int updateByPrimaryKey(Supplier record);

    public Supplier findSupplierByName(String supplierName);

}
