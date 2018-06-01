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

import com.dasw.entity.Customer;
import com.dasw.entity.Financial;
import com.dasw.entity.Order;
import com.dasw.entity.OrderDetail;
import com.dasw.entity.Page;
import com.dasw.entity.Produce;
import com.dasw.entity.Sell;
import com.dasw.entity.SellDetail;
import com.dasw.entity.SellList;
import com.dasw.entity.SendDetail;

import com.dasw.service.CustomerService;
import com.dasw.service.FinancialService;
import com.dasw.service.OrderService;
import com.dasw.service.ProduceService;
import com.dasw.service.SellService;
import com.dasw.service.SendService;

@Controller
@RequestMapping(value="/order")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	
	@Autowired
	private SellService sellService;
	
	@Autowired
	private ProduceService produceService;
	
	@Autowired
	private SendService sendService;
	
	@Autowired
	private FinancialService financialService;
	
	@Autowired
	private CustomerService customerService;
	
	
	@InitBinder    
	public void initBinder(WebDataBinder binder) {    
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");    
	        dateFormat.setLenient(false);    
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));    
	}  
	
	/*@RequestMapping(value = "/orderList")
	public ModelAndView orderList(){
		List<OrderDetail> orderList = orderService.findAll();
		ModelAndView mv = new ModelAndView();
		mv.addObject("orderList", orderList);
		mv.setViewName("orderList");
		return mv;
	}*/
	
	@RequestMapping(value = "/orderList")
	public ModelAndView orderList(OrderDetail orderDetail,HttpServletRequest request,@RequestParam(value="pageIndex",defaultValue="1",required=false) Integer pageIndex){
		        HttpSession session=request.getSession();
		        /*//接收请求查询参数
				String orderId=request.getParameter("orderId");
				String customerName=request.getParameter("customerName");
				String userName=request.getParameter("userName");
				String orderDate=request.getParameter("orderDate");*/
		        
		        Integer  orderId=orderDetail.getOrderId();
		        String customerName=orderDetail.getCustomerName();
		        String userName=orderDetail.getUserName();
		        Date orderDate=orderDetail.getOrderDate();
		        Integer orderFlag=orderDetail.getOrderFlag();
				//向页面传值
				
					session.setAttribute("orderId", orderId);
				
				
					session.setAttribute("customerName", customerName);
				
				
					session.setAttribute("userName", userName);
				
				
					session.setAttribute("orderDate", orderDate);
				
					session.setAttribute("orderFlag", orderFlag);
				
				/*String oorderId=(String)session.getAttribute("orderId");
				String ocustomerName=(String)session.getAttribute("customerName");
				String ouserName=(String)session.getAttribute("userName");
				String oorderDate=(String)session.getAttribute("orderDate");*/
				
				
				Page<OrderDetail> pageu = orderService.selectOrderByPage(orderDetail,pageIndex);
				
				ModelAndView mv = new ModelAndView();
				mv.addObject("pagemsg", pageu);
				mv.setViewName("orderList");
				return mv;
	}
	
	
	/*@RequestMapping(value = "/orderLimit")
	public ModelAndView orderLimit(OrderDetail orderDetail){
		List<OrderDetail> orderList = orderService.findLimit(orderDetail);
		ModelAndView mv = new ModelAndView();
		mv.addObject("orderList", orderList);
		mv.setViewName("orderList");
		return mv;
	}*/
	
	@RequestMapping(value = "/orderDetail")
	public ModelAndView orderDetail(@RequestParam(value = "orderId") Integer orderId){
		OrderDetail orderDetail = orderService.findById(orderId);
		List<SellDetail> sellList = sellService.findProduceByOrder(orderId);
		
		SendDetail sendDetail = new SendDetail();
		sendDetail.setOrderId(orderId);
		List<SendDetail> sendList = sendService.findLimit(sendDetail);
		
		List<Financial> financialList = financialService.findByQuery(orderId.toString(),"","","","");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("orderDetail", orderDetail);
		mv.addObject("sellList", sellList);
		mv.addObject("sendList", sendList);
		mv.addObject("financialList", financialList);
		mv.setViewName("orderDetail");
		return mv;
	}
	
	@RequestMapping(value = "/produceEditLoad")
	public ModelAndView produceEditLoad(@RequestParam(value = "orderId") Integer orderId){
		OrderDetail orderDetail = orderService.findById(orderId);
		List<SellDetail> sellList = sellService.findProduceByOrder(orderId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("orderDetail", orderDetail);
		mv.addObject("sellList", sellList);
		mv.setViewName("orderEdit");
		return mv;
	}
	
	@RequestMapping(value = "/orderProduceEdit")
	public String orderProduceEdit(Order order, SellList sellList){
		
		List<SellDetail> sellDetailList = sellService.findProduceByOrder(order.getOrderId());
		
		for(SellDetail sellDetail : sellDetailList){
			Produce produce = produceService.findByID(sellDetail.getproduceId());
			
			produce.setProduceNumber(produce.getProduceNumber()+sellDetail.getproduceNumber());
			
			produceService.update(produce);
		}
		
		sellService.deleteByPrimaryKey(order.getOrderId());
		
		Double orderTotalprice = 0.0;
		
		if(sellList.getSell() != null){
			
			for(Sell sell : sellList.getSell()){
				
				if(sell.getproduceId() == null) continue;
				Produce produce = produceService.findByID(sell.getproduceId());
				
				
				if(produce.getProduceNumber()<sell.getproduceNumber()) return "redirect:/order/orderList";
					
			}
			
			for(Sell sell : sellList.getSell()){
				
				if(sell.getproduceId() == null) continue;
				Produce produce = produceService.findByID(sell.getproduceId());
				produce.setProduceNumber(produce.getProduceNumber()-sell.getproduceNumber());
				sell.setproducePay(sell.getproduceNumber()*sell.getproduceDiscount()*produceService.findByID(sell.getproduceId()).getProduceOriginalprice());
				sell.setOrderId(order.getOrderId());
				produceService.update(produce);
				sellService.insertSelective(sell);
				orderTotalprice=sell.getproducePay()+orderTotalprice;
				
			}
		}
		order.setOrderTotalprice(orderTotalprice);
		orderService.updateByPrimaryKeySelective(order);
		return "redirect:/order/orderDetail?orderId="+order.getOrderId();
	}
	
	@RequestMapping(value = "/addLoad")
	public ModelAndView addLoad(@RequestParam(value = "userId") Integer userId, @RequestParam(value = "customerId") Integer customerId){
		ModelAndView mv = new ModelAndView();
		mv.addObject("customerId", customerId);
		mv.addObject("userId", userId);
		mv.setViewName("orderAdd");
		return mv;
	}
	
	@RequestMapping(value = "/orderAdd")
	public String orderAdd(Order order, SellList sellList){
		Double orderTotalprice = 0.0;
		order.setOrderTotalprice(0.0);
		order.setOrderStatus(1);
		orderService.insertSelective(order);
		order.setOrderId(orderService.findMax());
		
		System.out.println(sellList.getSell()+"null");
		
		if(sellList.getSell() != null){
			
			for(Sell sell : sellList.getSell()){
				if(sell.getproduceId() == null) continue;
				Produce produce = produceService.findByID(sell.getproduceId());
				
				//数量不够处理未写
				if(produce.getProduceNumber()<sell.getproduceNumber()) return "redirect:/order/orderList";
				
			}
			
			for(Sell sell : sellList.getSell()){
				if(sell.getproduceId() == null) continue;
				Produce produce = produceService.findByID(sell.getproduceId());
				produce.setProduceNumber(produce.getProduceNumber()-sell.getproduceNumber());
				sell.setproducePay(sell.getproduceNumber()*sell.getproduceDiscount()*produceService.findByID(sell.getproduceId()).getProduceOriginalprice());
				sell.setOrderId(order.getOrderId());
				produceService.update(produce);
				sellService.insertSelective(sell);
				orderTotalprice=sell.getproducePay()+orderTotalprice;
			}
		}
		order.setOrderTotalprice(orderTotalprice);
		orderService.updateByPrimaryKeySelective(order);
		return "redirect:/order/orderDetail?orderId="+order.getOrderId();
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "orderId") Integer orderId){
		List<SellDetail> sellList = sellService.findProduceByOrder(orderId);
		
		for(SellDetail sellDetail : sellList){
			Produce produce = produceService.findByID(sellDetail.getproduceId());
			
			produce.setProduceNumber(produce.getProduceNumber()+sellDetail.getproduceNumber());
			
			produceService.update(produce);
		}
		
		sellService.deleteByPrimaryKey(orderId);
		orderService.deleteByPrimaryKey(orderId);
		return "redirect:/order/orderList";
	}
	
	@RequestMapping(value = "/findCustomerLoad")
	public ModelAndView findCustomerLoad(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("orderFindCustomer");
		return mv;
	}
	
	@RequestMapping(value = "/findCustomer")
	public String findCustomer(@RequestParam(value = "userId") Integer userId, @RequestParam(value = "customerName") String customerName){
		String s = null;
		try{s = new String(customerName.getBytes("iso-8859-1"),"utf-8");} catch(Exception e) {}
		Customer customer = customerService.findCustomerByName(s);		
		if(customer == null) return "redirect:/order/findCustomerLoad"; 
		return "redirect:/order/addLoad?userId="+userId+"&customerId="+customer.getCustomerId();
	}
	
}

