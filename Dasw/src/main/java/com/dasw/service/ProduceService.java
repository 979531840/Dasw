package com.dasw.service;

import java.util.List;

import com.dasw.entity.Page;
import com.dasw.entity.Produce;

public interface ProduceService {

	public List<Produce> findAll();

	public void addProduce(Produce produce);

	public Produce findByID(Integer id);

	public int update(Produce produce);

	public void delete(Integer id);
	
	public List<Produce> findProduceByOrder(Integer id);
	
	public Produce findProduceByName(String produceName);
	
	public int updateByPrimaryKey(Produce produce);
	
	public List<Produce> getProduceList(String name,String item,String type);
	
	public Page<Produce> selectPageByPage(String name,String item,String type,Integer pageIndex);

}
