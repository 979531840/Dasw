package com.dasw.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.dasw.dao.OrderMapper;
import com.dasw.entity.Order;
import com.dasw.entity.OrderDetail;
import com.dasw.entity.Page;
import com.dasw.entity.User;
import com.dasw.service.OrderService;

@Service(value = "orderService")
@Transactional
public class OrderServiceImpl  implements OrderService{
	
	@Autowired
	private OrderMapper orderMapper;

	public List<OrderDetail> findAll() {
	
		return orderMapper.findAll();
	}

	

	public List<OrderDetail> findLimit(OrderDetail orderDetail) {
		System.out.print("11111111111111111"+orderDetail.getCustomerName()+"1111111111111111");
		return orderMapper.findLimit(orderDetail);
	}

	
	
	
	
	
	
	
	public int deleteByPrimaryKey(Integer orderId) {
		return orderMapper.deleteByPrimaryKey(orderId);
	}

	public int insert(Order record) {
		return orderMapper.insert(record);
	}

	public int insertSelective(Order record) {
		return orderMapper.insertSelective(record);
	}

	public Order selectByPrimaryKey(Integer orderId) {
		return orderMapper.selectByPrimaryKey(orderId);
	}

	public int updateByPrimaryKeySelective(Order record) {
		return orderMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Order record) {
		return orderMapper.updateByPrimaryKey(record);
	}



	public OrderDetail findById(Integer orderId) {
		return orderMapper.findById(orderId);
	}



	public Integer findMax() {
		
		return orderMapper.findMax();
	}



	public Page<OrderDetail> selectOrderByPage(OrderDetail orderDetail,Integer pageIndex) {
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Page<OrderDetail> page = new Page<OrderDetail>();
		
		//封装当前页数
		page.setPageIndex(pageIndex);
		
		//每页显示的数据
		int pageSize = 20;
		page.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = orderMapper.selectOrderPageCount(orderDetail);
		page.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);//向上取整
		page.setTotalPage(num.intValue());
		
		map.put("start", (pageIndex-1)*pageSize);
		map.put("size", page.getPageSize());
		map.put("orderId", orderDetail.getOrderId());
		map.put("customerName", orderDetail.getCustomerName());
		map.put("userName", orderDetail.getUserName());
		map.put("orderDate", orderDetail.getOrderDate());
		map.put("orderFlag", orderDetail.getOrderFlag());
		
		
		
		//封装每页显示的数据
		List<OrderDetail> sList= orderMapper.selectOrderByPage(map);
		page.setList(sList);
		
		return page;
	}










}
