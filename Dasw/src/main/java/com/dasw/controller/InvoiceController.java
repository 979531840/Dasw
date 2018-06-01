package com.dasw.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dasw.entity.Invoice;
import com.dasw.entity.Page;
import com.dasw.service.InvoiceService;


@Controller
@RequestMapping(value="/invoice")
public class InvoiceController {
	
	@Autowired
	private InvoiceService invoiceService;	
	
	@RequestMapping(value = "/invoiceList")
	public ModelAndView invocieList(HttpServletRequest request,@RequestParam(value="pageIndex",defaultValue="1",required=false) Integer pageIndex){
				HttpSession session=request.getSession();
				//接收请求查询参数
				String invoiceNumber=request.getParameter("invoiceNumber");
				String invoiceDate=request.getParameter("invoiceDate");
				String invoiceFlag=request.getParameter("invoiceFlag");
				//向页面传值
				if(invoiceNumber!=null){
					session.setAttribute("invoiceNumber", invoiceNumber);
				}
				if(invoiceDate!=null){
					session.setAttribute("invoiceDate", invoiceDate);
				}
				if(invoiceFlag!=null){
					session.setAttribute("invoiceFlag", invoiceFlag);
				}
				
				String number=(String)session.getAttribute("invoiceNumber");
				String date=(String)session.getAttribute("invoiceDate");
				String flag=(String)session.getAttribute("invoiceFlag");
				
				Page<Invoice> pageu = invoiceService.selectPageByPage(number,date,flag,pageIndex);
				
				ModelAndView mv = new ModelAndView();
				mv.addObject("pagemsg", pageu);
				mv.setViewName("invoiceList");
				return mv;
	}
	
	@RequestMapping(value = "/addLoad")
	public ModelAndView addLoad(@RequestParam(value = "id") Integer id){
				ModelAndView mv = new ModelAndView();
				//向添加页面传入订单ID
				mv.addObject("orderId", id);
				mv.setViewName("addInvoice");
				return mv;
	}
	
	@RequestMapping(value = "/addInvoice",method = RequestMethod.POST)
	public String addInvoice(Invoice invoice){
				invoiceService.addInvoice(invoice);
				return "redirect:/invoice/invoiceList";
	}
	
	@RequestMapping(value = "/editLoad")
	public ModelAndView editLoad(@RequestParam(value = "id") Integer id){
		        Invoice invoice=invoiceService.findById(id);
				ModelAndView mv = new ModelAndView();
				mv.addObject("invoice", invoice);
				mv.setViewName("editInvoice");
				return mv;
	}
	
	@RequestMapping(value = "/editInvoice",method = RequestMethod.POST)
	public String  editInvoice(Invoice invoice){
		        invoiceService.editInvoice(invoice);
				return "redirect:/invoice/invoiceList";
	}
	
	@RequestMapping(value = "/deleteInvoice")
	public String deleteInvoice(@RequestParam(value = "id") Integer id){
		        invoiceService.deleteInvoice(id);
				return "redirect:/invoice/invoiceList";
	}

}
