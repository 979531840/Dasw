package com.dasw.dao;

import com.dasw.entity.Invoice;

import java.util.HashMap;
import java.util.List;

public interface InvoiceMapper {
    List<Invoice> findAll();
    
    Invoice findById(Integer id);
    
    void addInvoice(Invoice invoice);
    
    void editInvoice(Invoice invoice);
    
    void deleteInvoice(Integer id);
    
    int selectInvoicePageCount(Invoice invoice);
	
	List<Invoice> selectInvoiceByPage(HashMap<String,Object> map);
}