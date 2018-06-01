package com.dasw.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dasw.dao.SendMapper;
import com.dasw.entity.OrderDetail;
import com.dasw.entity.Page;
import com.dasw.entity.Send;
import com.dasw.entity.SendDetail;
import com.dasw.entity.SendKey;
import com.dasw.service.SendService;

@Service(value = "sendService")
@Transactional
public class SendServiceImpl implements SendService{

	@Autowired
	private SendMapper sendMapper;
	
	public int deleteByPrimaryKey(SendKey key) {
		return sendMapper.deleteByPrimaryKey(key);
	}

	public int insert(Send record) {
		return sendMapper.insert(record);
	}

	public int insertSelective(Send record) {
		return sendMapper.insertSelective(record);
	}

	public Send selectByPrimaryKey(SendKey key) {
		return sendMapper.selectByPrimaryKey(key);
	}

	public int updateByPrimaryKeySelective(Send record) {
		return sendMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Send record) {
		return sendMapper.updateByPrimaryKey(record);
	}

	public List<SendDetail> findAll() {
		return sendMapper.findAll();
	}

	public List<SendDetail> findLimit(SendDetail sendDetail) {
		return sendMapper.findLimit(sendDetail);
	}

	public SendDetail findById(Integer sendId) {
		return sendMapper.findById(sendId);
	}

	public Page<SendDetail> selectSendByPage(SendDetail sendDetail,
			Integer pageIndex) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Page<SendDetail> page = new Page<SendDetail>();
		
		//封装当前页数
		page.setPageIndex(pageIndex);
		
		//每页显示的数据
		int pageSize = 20;
		page.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = sendMapper.selectSendPageCount(sendDetail);
		page.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);//向上取整
		page.setTotalPage(num.intValue());
		
		map.put("start", (pageIndex-1)*pageSize);
		map.put("size", page.getPageSize());
		map.put("orderId", sendDetail.getOrderId());
		map.put("customerName", sendDetail.getCustomerName());
		map.put("sendDate", sendDetail.getCustomerName());
		map.put("sendWay", sendDetail.getSendWay());
		map.put("sendCourierid", sendDetail.getSendCourierid());
		
		
		
		//封装每页显示的数据
		List<SendDetail> sList= sendMapper.selectSendByPage(map);
		page.setList(sList);
		
		return page;
	}

}
