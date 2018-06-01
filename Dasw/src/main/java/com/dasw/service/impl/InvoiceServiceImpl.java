package com.dasw.service.impl;



import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dasw.dao.InvoiceMapper;
import com.dasw.entity.Invoice;
import com.dasw.entity.Page;
import com.dasw.service.InvoiceService;

@Service(value = "invoiceService")
@Transactional
public class InvoiceServiceImpl  implements  InvoiceService{
	
	@Autowired
	InvoiceMapper invoiceMapper;
	
	public List<Invoice> findAll(){
		return invoiceMapper.findAll();
	}
	
	public void addInvoice(Invoice invoice){
		invoiceMapper.addInvoice(invoice);
	}
	
	public Invoice findById(Integer id){
		return invoiceMapper.findById(id);
	}
	
	public void editInvoice(Invoice invoice){
		invoiceMapper.editInvoice(invoice);
	}
	
	public void deleteInvoice(Integer id){
		invoiceMapper.deleteInvoice(id);
	}
	
	public Page<Invoice> selectPageByPage(String number,String date,String flag,Integer pageIndex){
		Invoice invoice=new Invoice();
		invoice.setInvoiceNumber(number);
		invoice.setInvoiceDate(date);
		invoice.setInvoiceFlag(flag);	
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Page<Invoice> page = new Page<Invoice>();
		
		//封装当前页数
		page.setPageIndex(pageIndex);
		
		//每页显示的数据
		int pageSize = 20;
		page.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = invoiceMapper.selectInvoicePageCount(invoice);
		page.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);//向上取整
		page.setTotalPage(num.intValue());
		
		map.put("start", (pageIndex-1)*pageSize);
		map.put("size", page.getPageSize());
		map.put("invoiceNumber", number);
		map.put("invoiceDate", date);
		map.put("invoiceFlag", flag);
		
		//封装每页显示的数据
		List<Invoice> sList= invoiceMapper.selectInvoiceByPage(map);
		page.setList(sList);
		
		return page;
	}

}
