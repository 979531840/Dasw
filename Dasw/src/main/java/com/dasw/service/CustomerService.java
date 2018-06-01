package com.dasw.service;

import java.util.List;

import com.dasw.entity.Customer;
import com.dasw.entity.Page;


public interface CustomerService {
	/**
     * 此方法对应于数据库中的表 ,user
     * 查询所有数据库记录
     */
	public List<Customer> findAll();

	public int deleteByPrimaryKey(Integer customerId);

	public  int insert(Customer record);

	public int insertSelective(Customer record);


	public Customer selectByPrimaryKey(Integer customerId);

	public Page<Customer> selectCustomerByPage(String cname,String companyName,Integer pageIndex);

	public  int updateByPrimaryKeySelective(Customer record);

	public int updateByPrimaryKey(Customer record);
	
	public Customer findCustomerByName(String customerName);
}
