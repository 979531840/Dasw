package com.dasw.dao;




import java.util.List;

import org.springframework.stereotype.Repository;

import com.dasw.entity.Sell;
import com.dasw.entity.SellDetail;

@Repository(value="sellMapper")
public interface SellMapper {

    int deleteByPrimaryKey(Integer orderId);

    int insert(Sell record);

    int insertSelective(Sell record);


    Sell selectByPrimaryKey(Integer orderId);


    int updateByPrimaryKeySelective(Sell record);

    int updateByPrimaryKey(Sell record);
    
    List<SellDetail> findProduceByOrder(Integer orderId);
}