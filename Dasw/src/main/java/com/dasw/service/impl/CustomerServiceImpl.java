package com.dasw.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dasw.dao.CustomerMapper;

import com.dasw.entity.Customer;
import com.dasw.entity.Page;

import com.dasw.service.CustomerService;


@Service(value = "customerService")
@Transactional
public class CustomerServiceImpl  implements CustomerService{
	@Autowired
	private CustomerMapper customerMapper;

	public List<Customer> findAll() {
		
		return customerMapper.findAll();
	}

	public int deleteByPrimaryKey(Integer customerId) {
		
		return customerMapper.deleteByPrimaryKey(customerId);
	}

	public int insert(Customer record) {
		
		return customerMapper.insert(record);
	}

	public int insertSelective(Customer record) {
		
		return customerMapper.insertSelective(record);
	}

	public Customer selectByPrimaryKey(Integer customerId) {
		
		return customerMapper.selectByPrimaryKey(customerId);
	}

	public int updateByPrimaryKeySelective(Customer record) {
		return customerMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Customer record) {
		
		return customerMapper.updateByPrimaryKey(record);
	}

	public Page<Customer> selectCustomerByPage(String cname, String companyName,
			Integer pageIndex) {
		Customer customer=new Customer();
		customer.setCustomerName(cname);
		customer.setCustomerCompanyName(companyName);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Page<Customer> page = new Page<Customer>();
		
		//封装当前页数
		page.setPageIndex(pageIndex);
		
		//每页显示的数据
		int pageSize = 20;
		page.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = customerMapper.selectCustomerPageCount(customer);
		page.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);//向上取整
		page.setTotalPage(num.intValue());
		
		map.put("start", (pageIndex-1)*pageSize);
		map.put("size", page.getPageSize());
		map.put("customerName", cname);
		map.put("customerCompanyName", companyName);
		
		
		//封装每页显示的数据
		List<Customer> sList= customerMapper.selectCustomerByPage(map);
		page.setList(sList);
		
		return page;
	}

	public Customer findCustomerByName(String customerName) {
		// TODO Auto-generated method stub
		return customerMapper.findCustomerByName(customerName);
	}
	
	

	
}
