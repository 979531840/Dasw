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
import com.dasw.entity.Produce;
import com.dasw.service.ProduceService;


@Controller
@RequestMapping(value="/produce")
public class ProduceController {
	
	@Autowired
	private ProduceService produceService;
	
	
	/**
     * 产品信息列表
     * @return
     * 如果采用JSON传值，那么需要注释掉下方方法中的代码
     * List<Produce> produceList = produceService.findAll();
     * mv.addObject("produceList", produceList);
     * 直接返回一个空视图名称
     * 页面异步加载数据，请查看下方注释方法
     */
	@RequestMapping(value = "/produceList")
	public ModelAndView produceList(HttpServletRequest request,@RequestParam(value="pageIndex",defaultValue="1",required=false) Integer pageIndex){
		        HttpSession session=request.getSession();
		        //接收请求查询参数
				String produceName=request.getParameter("produceName");
				String produceItem=request.getParameter("produceItem");
				String produceTypename=request.getParameter("produceTypename");
				//向页面传值
				if(produceName!=null){
					session.setAttribute("produceName", produceName);
				}
				if(produceItem!=null){
					session.setAttribute("produceItem", produceItem);
				}
				if(produceTypename!=null){
					session.setAttribute("produceTypename", produceTypename);
				}
				
				String name=(String)session.getAttribute("produceName");
				String item=(String)session.getAttribute("produceItem");
				String type=(String)session.getAttribute("produceTypename");
				
				Page<Produce> pageu = produceService.selectPageByPage(name,item,type,pageIndex);
				
				ModelAndView mv = new ModelAndView();
				mv.addObject("pagemsg", pageu);
				mv.setViewName("produceList");
				return mv;
	}
	
	/**
     * 产品信息列表   页面异步加载
     * @return
     * @ResponseBody 注解的作用是将目标类型数据转换成json格式
     * 另外页面需要加入jquery js
     */
	/*@RequestMapping(value = "/list")
	public @ResponseBody List<Produce> list(){
		List<Produce> produceList = produceService.findAll();
		return produceList;
	}
	*/
	
	/**
     * 跳转到添加产品视图
     * @return
     */
	@RequestMapping(value = "/addLoad")
	public ModelAndView addProduce(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addProduce");
		return mv;
	}
	
	/**
     * 添加产品信息
     * @param produce
     * @return
     */
	@RequestMapping(value = "/addProduce",method = RequestMethod.POST)
	public String add(Produce produce){
		produceService.addProduce(produce);
		return "redirect:/produce/produceList";
	}
	
	/**
     * 修改产品获取，跳转到修改产品视图
     * @param id
     * @return
     */
	@RequestMapping(value = "/editLoad")
	public ModelAndView editProduce(@RequestParam(value = "id") Integer id){
		Produce produce = produceService.findByID(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("produce", produce);
		mv.setViewName("editProduce");
		return mv;
	}
	
	/**
     * 修改产品信息
     * @param produce
     * @return
     */
	@RequestMapping(value = "/editProduce",method = RequestMethod.POST)
	public String editProduce(Produce produce){
		produceService.update(produce);
		return "redirect:/produce/produceList";
	}
	
	/**
     * 删除产品
     * @param id
     * @return
     */
	@RequestMapping(value = "/deleteProduce")
	public String  delete(@RequestParam(value = "id") Integer id){
		produceService.delete(id);
		
		return "redirect:/produce/produceList";
	}
	

}
