package com.dasw.dao;



import java.util.HashMap;
import java.util.List;


import org.springframework.stereotype.Repository;

import com.dasw.entity.Send;
import com.dasw.entity.SendDetail;
import com.dasw.entity.SendKey;
@Repository(value="sendMapper")
public interface SendMapper {


	int deleteByPrimaryKey(SendKey key);

    int insert(Send record);

    int insertSelective(Send record);

    Send selectByPrimaryKey(SendKey key);

    int updateByPrimaryKeySelective(Send record);

    int updateByPrimaryKey(Send record);
	
    
    List<SendDetail> findAll();
    
    List<SendDetail> findLimit(SendDetail sendDetail);
    
    SendDetail findById(Integer sendId);

	int selectSendPageCount(SendDetail sendDetail);

	List<SendDetail> selectSendByPage(HashMap<String, Object> map);
}