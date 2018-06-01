package com.dasw.controller;

import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



import org.apache.log4j.chainsaw.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;

import com.dasw.entity.Customer;
import com.dasw.entity.Page;
import com.dasw.entity.Produce;
import com.dasw.entity.Purchase;
import com.dasw.entity.PurchaseDetail;
import com.dasw.entity.Supplier;
import com.dasw.service.ProduceService;
import com.dasw.service.PurchaseService;
import com.dasw.service.SupplierService;

@Controller
@RequestMapping(value="/purchase")
public class PurchaseController {
	
	@Autowired
	private PurchaseService purchaseService;
	
	@Autowired
	private ProduceService produceService;
	
	@InitBinder    
	public void initBinder(WebDataBinder binder) {    
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");    
	        dateFormat.setLenient(false);    
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));    
	}
	
	/*@RequestMapping(value = "/purchaseList")
	public ModelAndView purchaseList(){
		List<PurchaseDetail> purchaseList = purchaseService.findAll();
		ModelAndView mv = new ModelAndView();
		mv.addObject("purchaseList",purchaseList);
		mv.setViewName("purchaseList");
		return mv;
	}
	
	@RequestMapping(value = "/purchaseLimit")
	public ModelAndView purchaseLimit(PurchaseDetail purchaseDetail){
		List<PurchaseDetail> purchaseList = purchaseService.findLimit(purchaseDetail);
		ModelAndView mv = new ModelAndView();
		mv.addObject("purchaseList",purchaseList);
		mv.setViewName("purchaseList");
		return mv;
	}*/
	
	@RequestMapping(value = "/purchaseList")
	public ModelAndView purchaseList(PurchaseDetail purchaseDetail,HttpServletRequest request,@RequestParam(value="pageIndex",defaultValue="1",required=false) Integer pageIndex){
		        HttpSession session=request.getSession();
		        
		        
		        Integer  stockProductId=purchaseDetail.getStockProductId();
		        String produceName=purchaseDetail.getProduceName();
		        String supplierName=purchaseDetail.getSupplierName();
		        Date purchaseDate=purchaseDetail.getPurchaseDate();
		        
				//向页面传值
				
				session.setAttribute("stockProductId", stockProductId);
				session.setAttribute("produceName", produceName);
			    session.setAttribute("supplierName", supplierName);
				session.setAttribute("purchaseDate", purchaseDate);
				
					
				
				
				
				Page<PurchaseDetail> pageu = purchaseService.selectPurchaseByPage(purchaseDetail,pageIndex);
				
				ModelAndView mv = new ModelAndView();
				mv.addObject("pagemsg", pageu);
				mv.setViewName("purchaseList");
				return mv;
	}
	
	@RequestMapping(value = "/editLoad")
	public ModelAndView editLoad(@RequestParam(value = "id") Integer id){
		PurchaseDetail purchaseDetail = purchaseService.findById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("purchaseDetail",purchaseDetail);
		mv.setViewName("purchaseEdit");
		return mv;
	}
	
	@RequestMapping(value = "/purchaseEdit")
	public String purchaseEdit(Purchase purchase){
		purchaseService.updateByPrimaryKeySelective(purchase);
		return "redirect:/purchase/purchaseList";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value = "id") Integer id){
		purchaseService.deleteByPrimaryKey(id);
		return "redirect:/purchase/purchaseList";
	}
	
	@RequestMapping(value = "/addLoadAgain")
	public ModelAndView addLoadAgain(@RequestParam(value = "id") Integer id){
		PurchaseDetail purchaseDetail = purchaseService.findById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("purchaseDetail",purchaseDetail);
		mv.setViewName("purchaseAddAgain");
		return mv;
	}
	
	@RequestMapping(value = "/addLoad")
	public ModelAndView addLoad(@RequestParam(value = "produceId") Integer produceId){
		ModelAndView mv = new ModelAndView();
		mv.addObject("produceId",produceId);
		mv.setViewName("purchaseAdd");
		return mv;
	}
	
	@RequestMapping(value = "/purchaseAdd")
	public String purchaeAdd(Purchase purchase){
		purchaseService.insertSelective(purchase);
		return "redirect:/purchase/purchaseList";
	}
	
	@RequestMapping(value = "/findProduceLoad")
	public ModelAndView findProduceLoad(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("purchaseFindProduce");
		return mv;
	}
	
	@RequestMapping(value = "/findProduce")
	public String findSupplier(@RequestParam(value = "produceName") String produceName){
		String s = null;
		try{s = new String(produceName.getBytes("iso-8859-1"),"utf-8");} catch(Exception e) {}
		
		 System.out.print("\n"+s+"\n");
		
		Produce produce = produceService.findProduceByName(s);		
		if(produce == null) return "redirect:/purchase/findProduceLoad"; 
		
		return "redirect:/purchase/addLoad?produceId="+produce.getProduceId();
	}
	
}
