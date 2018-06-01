package com.dasw.service;

import java.util.List;

import com.dasw.entity.Page;
import com.dasw.entity.Send;
import com.dasw.entity.SendDetail;
import com.dasw.entity.SendKey;

public interface SendService {

    public int deleteByPrimaryKey(SendKey key);

    public int insert(Send record);

    public int insertSelective(Send record);

    public Send selectByPrimaryKey(SendKey key);

    public int updateByPrimaryKeySelective(Send record);

    public int updateByPrimaryKey(Send record);
    
    public List<SendDetail> findAll();
    
    public List<SendDetail> findLimit(SendDetail sendDetail);
    
    public SendDetail findById(Integer sendId);

	public Page<SendDetail> selectSendByPage(SendDetail sendDetail,
			Integer pageIndex);
    
}
