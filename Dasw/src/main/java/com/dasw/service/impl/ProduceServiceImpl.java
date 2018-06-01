package com.dasw.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dasw.dao.ProduceMapper;
import com.dasw.entity.Page;
import com.dasw.entity.Produce;
import com.dasw.service.ProduceService;

@Service(value = "produceService")
@Transactional
public class ProduceServiceImpl  implements ProduceService{
	@Autowired
	private ProduceMapper produceMapper;
	
	public void addProduce(Produce produce) {
		produceMapper.addProduce(produce);
	}

	public int update(Produce produce) {
		return produceMapper.update(produce);
	}
	
	public int updateByPrimaryKey(Produce produce) {
		return produceMapper.updateByPrimaryKey(produce);
	}

	public void delete(Integer id) {
		produceMapper.delete(id);
	}
	
	
	public Produce findByID(Integer id) {
		return produceMapper.findByID(id);
	}
	
	public List<Produce> findProduceByOrder(Integer id){
		return produceMapper.findProduceByOrder(id);
	}
	
	public Produce findProduceByName(String produceName){
		return produceMapper.findProduceByName(produceName);
	}
	
	
	public List<Produce> findAll() {
		return produceMapper.findAll();
	}
	
	public List<Produce> getProduceList(String name,String item,String type) {
		Produce produce=new Produce();
		produce.setProduceName(name);
		produce.setProduceItem(item);
		produce.setProduceTypename(type);
		return produceMapper.getProduceList(produce);
	}
	
	public Page<Produce> selectPageByPage(String name,String item,String type,Integer pageIndex){
		Produce produce=new Produce();
		produce.setProduceName(name);
		produce.setProduceItem(item);
		produce.setProduceTypename(type);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Page<Produce> page = new Page<Produce>();
		
		//封装当前页数
		page.setPageIndex(pageIndex);
		
		//每页显示的数据
		int pageSize = 20;
		page.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = produceMapper.selectProducePageCount(produce);
		page.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);//向上取整
		page.setTotalPage(num.intValue());
		
		map.put("start", (pageIndex-1)*pageSize);
		map.put("size", page.getPageSize());
		map.put("produceName", name);
		map.put("produceItem", item);
		map.put("produceTypename", type);
		
		//封装每页显示的数据
		List<Produce> sList= produceMapper.selectProduceByPage(map);
		page.setList(sList);
		
		return page;
	}

}
