package com.dasw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dasw.dao.SellMapper;
import com.dasw.entity.Sell;
import com.dasw.entity.SellDetail;
import com.dasw.service.SellService;

@Service(value = "sellService")
@Transactional
public class SellServiceImpl  implements SellService{
	
	@Autowired
	private SellMapper sellMapper;

	public int deleteByPrimaryKey(Integer orderId) {
		return sellMapper.deleteByPrimaryKey(orderId);
	}

	public int insert(Sell record) {
		return sellMapper.insert(record);
	}

	public int insertSelective(Sell record) {
		return sellMapper.insertSelective(record);
	}

	public Sell selectByPrimaryKey(Integer orderId) {
		return sellMapper.selectByPrimaryKey(orderId);
	}

	public int updateByPrimaryKeySelective(Sell record) {
		return sellMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Sell record) {
		return sellMapper.updateByPrimaryKey(record);
	}

	public List<SellDetail> findProduceByOrder(Integer orderId) {
		return sellMapper.findProduceByOrder(orderId);
	}

}
