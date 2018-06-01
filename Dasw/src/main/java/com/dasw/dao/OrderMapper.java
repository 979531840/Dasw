package com.dasw.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dasw.entity.Order;
import com.dasw.entity.OrderDetail;


@Repository(value="orderMapper")
public interface OrderMapper {

    int deleteByPrimaryKey(Integer orderId);

    int insert(Order record);

    int insertSelective(Order record);


    Order selectByPrimaryKey(Integer orderId);


    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
    
    
    List<OrderDetail> findAll();
    
    List<OrderDetail> findLimit(OrderDetail orderDetail);
    
    OrderDetail findById(Integer orderId);
    
    Integer findMax();

	int selectOrderPageCount(OrderDetail orderDetail);

	List<OrderDetail> selectOrderByPage(HashMap<String, Object> map);
}