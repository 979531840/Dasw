package com.dasw.dao;



import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dasw.entity.Produce;

@Repository(value="produceMapper")
public interface ProduceMapper {

    int deleteByPrimaryKey(Integer produceId);

    int insert(Produce record);

    int insertSelective(Produce record);

    Produce selectByPrimaryKey(Integer produceId);


    int updateByPrimaryKeySelective(Produce record);

    int updateByPrimaryKey(Produce record);
    
    /**
     * 此方法对应于数据库中的表 ,produce
     * 新写入数据库记录
     *
     * @param produce
     */
    void addProduce(Produce produce);
    
    /**
     * 此方法对应于数据库中的表 ,produce
     * 根据主键来更新符合条件的数据库记录
     *
     * @param produce
     */
    int update(Produce produce);
    
    /**
     * 此方法对应于数据库中的表 ,produce
     * 根据主键删除数据库的记录
     *
     * @param id
     */
    void delete(Integer id);
    
    /**
     * 此方法对应于数据库中的表 ,produce
     * 根据指定主键获取一条数据库记录
     *
     * @param id
     */
    Produce findByID(Integer id);
    
    /**
     * 此方法对应于数据库中的表 ,produce
     * 查询所有数据库记录
     */
	List<Produce> findAll();
	
	/**
     * 此方法对应于数据库中的表dasw_sell
     * 查询所有对应数据库记录
     */
	List<Produce> findProduceByOrder(Integer id);
	
	/*
	 * 根据产品名称查找产品
	 */
	Produce findProduceByName(String produceName);
	
	/**
     * 此方法对应于数据库中的表 dasw_produce
     * 根据查询条件筛选所有数据库记录
     */
	List<Produce> getProduceList(Produce produce);
	
	int selectProducePageCount(Produce produce);
	
	List<Produce> selectProduceByPage(HashMap<String,Object> map);
}