package com.dasw.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dasw.entity.Financial;
import com.dasw.entity.Page;
import com.dasw.service.FinancialService;


@Controller
@RequestMapping(value="/financial")
public class FinancialController {
	
	@Autowired
	private FinancialService financialService;
	
	@RequestMapping(value = "/financialList")
	public ModelAndView financialList(HttpServletRequest request,@RequestParam(value="pageIndex",defaultValue="1",required=false) Integer pageIndex){
		        HttpSession session=request.getSession();
		        //接收请求查询参数
				String orderId=request.getParameter("orderId");
				String customerName=request.getParameter("customerName");
				String orderStartDate=request.getParameter("orderStartDate");
				String orderEndDate=request.getParameter("orderEndDate");
				String isPay=request.getParameter("isPay");
				//向页面传值
				if(orderId!=null){
					session.setAttribute("orderId", orderId);
				}
				if(customerName!=null){
					session.setAttribute("customerName", customerName);
				}
				if(orderStartDate!=null){
					session.setAttribute("orderStartDate", orderStartDate);
				}
				if(orderEndDate!=null){
					session.setAttribute("orderEndDate", orderEndDate);
				}
				if(isPay!=null){
					session.setAttribute("isPay", isPay);
				}
				
				String id=(String)session.getAttribute("orderId");
				String name=(String)session.getAttribute("customerName");
				String start=(String)session.getAttribute("orderStartDate");
				String end=(String)session.getAttribute("orderEndDate");
				String ispay=(String)session.getAttribute("isPay");
				
				Page<Financial> pageu = financialService.selectPageByPage(id,name,start,end,ispay,pageIndex);
		        /*List<Financial> financialList=financialService.findByQuery(id, name, start, end, ispay);*/
				List<Financial> financials=pageu.getList();
				Iterator<Financial> iterator=financials.iterator();
				int total=pageu.getTotalCount();
				Double totalprice=0.0;
				Double pay=0.0;
				while(iterator.hasNext()){
					Financial financial=iterator.next();
					totalprice+=financial.getOrderTotalprice();
					pay+=financial.getOrderPay();
				}
				Double noPay=totalprice-pay;
				ModelAndView mv = new ModelAndView();
				mv.addObject("pagemsg", pageu);
				mv.addObject("totalprice", totalprice);
				mv.addObject("pay", pay);
				mv.addObject("noPay", noPay);
				mv.setViewName("financialStatistics");
				return mv;
	}

}
