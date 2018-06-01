package com.dasw.service;

import java.util.List;

import com.dasw.entity.Order;
import com.dasw.entity.OrderDetail;
import com.dasw.entity.Page;



public interface OrderService {

	public List<OrderDetail> findAll();
	
	public int deleteByPrimaryKey(Integer orderId);

    public int insert(Order record);

    public int insertSelective(Order record);

    public Order selectByPrimaryKey(Integer orderId);

    public int updateByPrimaryKeySelective(Order record);
       
    public int updateByPrimaryKey(Order record);
    
    public List<OrderDetail> findLimit(OrderDetail orderDetail);
    
    public OrderDetail findById(Integer orderId);
    
    public Integer findMax();

	public Page<OrderDetail> selectOrderByPage(OrderDetail orderDetail,
			Integer pageIndex);

}
