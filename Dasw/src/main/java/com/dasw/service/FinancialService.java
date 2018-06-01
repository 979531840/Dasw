package com.dasw.service;

import java.util.List;

import com.dasw.entity.Financial;
import com.dasw.entity.Page;

public interface FinancialService {
	
	public List<Financial> findAll();
	
	public List<Financial> findByQuery(String id,String name,String start,String end,String ispay);
	
	public Page<Financial> selectPageByPage(String id,String name,String start,String end,String ispay,Integer pageIndex);

}
