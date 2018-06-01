package com.dasw.dao;

import java.util.HashMap;
import java.util.List;

import com.dasw.entity.Customer;




public interface CustomerMapper {

	
	/**
     * 此方法对应于数据库中的表 ,user
     * 查询所有数据库记录
     */
    List<Customer> findAll();

    int deleteByPrimaryKey(Integer customerId);

    int insert(Customer record);

    int insertSelective(Customer record);

    
    int selectCustomerPageCount(Customer customer);
    
    List<Customer> selectCustomerByPage(HashMap<String,Object> map);

    Customer selectByPrimaryKey(Integer customerId);

    Customer findCustomerByName(String customerName);
    
    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
}