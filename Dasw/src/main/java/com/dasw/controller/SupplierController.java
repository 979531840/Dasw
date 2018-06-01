package com.dasw.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.dasw.entity.Page;
import com.dasw.entity.Supplier;
import com.dasw.service.SupplierService;


@Controller
@RequestMapping(value="/supplier")
public class SupplierController {
	@Autowired
	private SupplierService supplierService;
	
	
	
	
	/**
	 * 客户的分页查询以及条件查询
	 * @param request
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping(value = "/supplierList")
	public ModelAndView supplierList(HttpServletRequest request,@RequestParam(value="pageIndex",defaultValue="1",required=false) Integer pageIndex){
		        HttpSession session=request.getSession();
		        //接收请求查询参数
				String supplierName=request.getParameter("supplierName");
				String supplierCompany=request.getParameter("supplierCompany");

				//向页面传值
				if(supplierName!=null){
					session.setAttribute("supplierName", supplierName);
				}
				if(supplierCompany!=null){
					session.setAttribute("supplierCompany", supplierCompany);
				}
				
				
				String sname=(String)session.getAttribute("supplierName");
				String companyName=(String)session.getAttribute("supplierCompany");
				
				
				Page<Supplier> pageu = supplierService.selectSupplierByPage(sname,companyName,pageIndex);
				
				ModelAndView mv = new ModelAndView();
				mv.addObject("pagemsg", pageu);
				mv.setViewName("supplierList");
				return mv;
	}
	
	
	/**
     * 跳转到添加信息视图
     * @return
     */
	@RequestMapping(value = "/addLoad")
	public ModelAndView addLoad(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addSupplier");
		return mv;
	}
	/**
     * 添加信息
     * @param user
     * @return
     */
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public String add(Supplier supplier){
		supplierService.insert(supplier);
		return "redirect:/supplier/supplierList";
	}
	/**
     * 修改信息获取，跳转到修改信息视图
     * @param id
     * @return
     */
	@RequestMapping(value = "/editLoad")
	public ModelAndView editLoad(@RequestParam(value = "id") Integer id){
		Supplier supplier = supplierService.selectByPrimaryKey(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("supplier", supplier);
		mv.setViewName("editSupplier");
		return mv;
	}
	/**
     * 修改信息
     * @param user
     * @return
     */
	@RequestMapping(value = "/edit",method = RequestMethod.POST)
	public String edit(Supplier supplier){
		supplierService.updateByPrimaryKey(supplier);
		return "redirect:/supplier/supplierList";
	}
	/**
     * 删除用户
     * @param id
     * @return
     */
	@RequestMapping(value = "/delete")
	public String  delete(@RequestParam(value = "id") Integer id){
		supplierService.deleteByPrimaryKey(id);
		
		return "redirect:/supplier/supplierList";
	}
}
