package com.dasw.dao;

import java.util.HashMap;
import java.util.List;

import com.dasw.entity.Financial;

public interface FinancialMapper {
	
	List<Financial> findAll();
	
	List<Financial> findByQuery(HashMap<String,Object> map);
	
    int selectFinancialPageCount(HashMap<String,Object> map);
	
	List<Financial> selectFinancialByPage(HashMap<String,Object> map);
	
	

}
