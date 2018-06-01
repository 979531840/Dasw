package com.dasw.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dasw.entity.Customer;
import com.dasw.entity.Page;

import com.dasw.service.CustomerService;


@Controller
@RequestMapping(value="/customer")
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	/**
	 * 客户的分页查询以及条件查询
	 * @param request
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping(value = "/customerList")
	public ModelAndView customerList(HttpServletRequest request,@RequestParam(value="pageIndex",defaultValue="1",required=false) Integer pageIndex){
		        HttpSession session=request.getSession();
		        
		        //接收请求查询参数
				String customerName=request.getParameter("customerName");
				String customerCompanyName=request.getParameter("customerCompanyName");

				//向页面传值
				if(customerName!=null){
					session.setAttribute("customerName", customerName);
				}
				if(customerCompanyName!=null){
					session.setAttribute("customerCompanyName", customerCompanyName);
				}
				
				
				String cname=(String)session.getAttribute("customerName");
				String companyName=(String)session.getAttribute("customerCompanyName");
				
				
				Page<Customer> pageu = customerService.selectCustomerByPage(cname,companyName,pageIndex);
				
				ModelAndView mv = new ModelAndView();
				mv.addObject("pagemsg", pageu);
				mv.setViewName("customerList");
				return mv;
	}
	
	
	/**
     * 跳转到添加信息视图
     * @return
     */
	@RequestMapping(value = "/addLoad")
	public ModelAndView addLoad(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addCustomer");
		return mv;
	}
	/**
     * 添加信息
     * @param user
     * @return
     */
	@RequestMapping(value = "/add")
	public String add(Customer customer){
		customerService.insert(customer);
		return "redirect:/customer/customerList";
	}
	/**
     * 修改信息获取，跳转到修改信息视图
     * @param id
     * @return
     */
	@RequestMapping(value = "/editLoad")
	public ModelAndView editLoad(@RequestParam(value = "id") Integer id){
		Customer customer = customerService.selectByPrimaryKey(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("customer", customer);
		mv.setViewName("editCustomer");
		return mv;
	}
	/**
     * 修改信息
     * @param user
     * @return
     */
	@RequestMapping(value = "/edit")
	public String edit(Customer customer){
		customerService.updateByPrimaryKey(customer);
		return "redirect:/customer/customerList";
	}
	/*@RequestMapping(value = "/edit")
	public ModelAndView edit(Customer customer){
		customerService.updateByPrimaryKeySelective(customer);
		return new ModelAndView("redirect:/customer/customerList");
	}*/
	/**
     * 删除用户
     * @param id
     * @return
     */
	@RequestMapping(value = "/delete")
	public String  delete(@RequestParam(value = "id") Integer id){
		customerService.deleteByPrimaryKey(id);
		
		return "redirect:/customer/customerList";
	}
}
