package com.dasw.service;

import java.util.List;

import com.dasw.entity.Sell;
import com.dasw.entity.SellDetail;


public interface SellService {
	
	public int deleteByPrimaryKey(Integer orderId);

	public int insert(Sell record);

	public int insertSelective(Sell record);


	public Sell selectByPrimaryKey(Integer orderId);


	public int updateByPrimaryKeySelective(Sell record);

	public int updateByPrimaryKey(Sell record);
	
	public List<SellDetail> findProduceByOrder(Integer orderId);

}
