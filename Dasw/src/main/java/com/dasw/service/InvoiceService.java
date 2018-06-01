package com.dasw.service;

import java.util.List;

import com.dasw.entity.Invoice;
import com.dasw.entity.Page;


public interface InvoiceService {
	
	public List<Invoice> findAll();
	
	public void addInvoice(Invoice invoice);
	
	public Invoice findById(Integer id);
	
	public void editInvoice(Invoice invoice);
	
	public void deleteInvoice(Integer id);
	
	public Page<Invoice> selectPageByPage(String number,String date,String flag,Integer pageIndex);

}
