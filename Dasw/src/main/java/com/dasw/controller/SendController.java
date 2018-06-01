package com.dasw.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.dasw.entity.Page;
import com.dasw.entity.Send;
import com.dasw.entity.SendDetail;
import com.dasw.entity.SendKey;
import com.dasw.service.SendService;

@Controller
@RequestMapping(value="/send")
public class SendController {

	@Autowired
	private SendService sendService;
	
	@InitBinder    
	public void initBinder(WebDataBinder binder) {    
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");    
	    dateFormat.setLenient(false);    
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));    
	}
	
//	@RequestMapping(value = "/sendList")
//	public ModelAndView sendList(){
//		List<SendDetail> sendList = sendService.findAll();
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("sendList",sendList);
//		mv.setViewName("sendList");
//		return mv;
//	}
	
	@RequestMapping(value = "/sendLimit")
	public ModelAndView sendLimit(SendDetail sendDetail){
		List<SendDetail> sendList = sendService.findLimit(sendDetail);
		System.out.println("\n"+sendDetail.getCustomerName()+"\n");
		ModelAndView mv = new ModelAndView();
		mv.addObject("sendList",sendList);
		mv.setViewName("sendList");
		return mv;
	}
	
	
	@RequestMapping(value = "/sendList")
	public ModelAndView sendList(SendDetail sendDetail,HttpServletRequest request,@RequestParam(value="pageIndex",defaultValue="1",required=false) Integer pageIndex){
		        HttpSession session=request.getSession();
		        /*//接收请求查询参数
				String orderId=request.getParameter("orderId");
				String customerName=request.getParameter("customerName");
				String userName=request.getParameter("userName");
				String orderDate=request.getParameter("orderDate");*/
		        
		        Integer  orderId=sendDetail.getOrderId();
		        String customerName=sendDetail.getCustomerName();
		        Date sendDate=sendDetail.getSendDate();
		        String sendWay=sendDetail.getSendWay();
		        String sendCourierid=sendDetail.getSendCourierid();
				//向页面传值
				
				session.setAttribute("orderId", orderId);
				session.setAttribute("customerName", customerName);
				session.setAttribute("sendDate", sendDate);
				session.setAttribute("sendWay", sendWay);
				session.setAttribute("sendCourierid", sendCourierid);

				
				Page<SendDetail> pageu = sendService.selectSendByPage(sendDetail,pageIndex);
				
				ModelAndView mv = new ModelAndView();
				mv.addObject("pagemsg", pageu);
				mv.setViewName("sendList");
				return mv;
	}
	
	@RequestMapping(value = "/addLoad")
	public ModelAndView addLoad(@RequestParam(value = "orderId") Integer orderId){
		ModelAndView mv = new ModelAndView();
		mv.addObject("orderId",orderId);
		mv.setViewName("sendAdd");
		return mv;
	}
	
	@RequestMapping(value = "sendAdd")
	public String sendAdd(Send send){
		sendService.insertSelective(send);
		return "redirect:/send/sendList";
	}
	
	@RequestMapping(value = "/editLoad")
	public ModelAndView editLoad(@RequestParam(value = "id") Integer id){
		SendDetail sendDetail = sendService.findById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("sendDetail",sendDetail);
		mv.setViewName("sendEdit");
		return mv;
	}
	
	@RequestMapping(value = "/sendEdit")
	public String sendEdit(Send send){
		sendService.updateByPrimaryKeySelective(send);
		return "redirect:/send/sendList";
	}
	
	@RequestMapping(value = "/delete")
	public String sendDelete(SendKey sendKey){
		sendService.deleteByPrimaryKey(sendKey);
		return "redirect:/send/sendList";
	}
}
