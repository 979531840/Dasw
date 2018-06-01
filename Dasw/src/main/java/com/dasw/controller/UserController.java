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
import com.dasw.entity.User;
import com.dasw.service.UserService;



@Controller
@RequestMapping(value="/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	
	/**
	 * 登陆
	 * 
	 */
	@RequestMapping(value = "/login")
	public ModelAndView login(User user,HttpServletRequest request,HttpSession session){
		
		ModelAndView mv = new ModelAndView();	
		User u = new User();	

		try {
				u = userService.login(user);
		} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
				
		if(u!=null){
				//存session
				session.setAttribute("currentUser", u);
				session.setAttribute("currentUserId", u.getUserId());
				mv.setViewName("index");
				return mv;   //后面要改成主页的
		}else{
				request.setAttribute("user", user);
				request.setAttribute("errorMsg", "用户名或密码错误！");
				
				mv.setViewName("login");
				return mv;
		}
			
		
	}
	/*@RequestMapping(value = "/userList")
	public ModelAndView userList(){
		List<User> userList = userService.findAll();
		ModelAndView mv = new ModelAndView();
		mv.addObject("userList", userList);
		mv.setViewName("userList");
		
		return mv;
	}*/
	/**
	 * 跳转到主页main
	 */
	@RequestMapping(value = "/main")
	public ModelAndView main(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		return mv;
	}
	/**
     * 用户信息列表
     * @return
     * 如果采用JSON传值，那么需要注释掉下方方法中的代码
     * List<User> userList = userService.findAll();
     * mv.addObject("userList", userList);
     * 直接返回一个空视图名称
     * 页面异步加载数据，请查看下方注释方法
     */
	/**/
	
	/**
     * 用户信息列表   页面异步加载
     * @return
     * @ResponseBody 注解的作用是将目标类型数据转换成json格式
     * 另外页面需要加入jquery js
     */
	/*@RequestMapping(value = "/list")
	public @ResponseBody List<User> list(){
		List<User> userList = userService.findAll();
		return userList;
	}
	*/
	
	/**
     * 跳转到添加信息视图
     * @return
     */
	@RequestMapping(value = "/addLoad")
	public ModelAndView addLoad(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addUser");
		return mv;
	}
	/**
     * 添加信息
     * @param user
     * @return
     */
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public String add(User user){
		userService.insert(user);
		return "redirect:/user/userList";
	}
	/**
     * 修改信息获取，跳转到修改信息视图
     * @param id
     * @return
     */
	@RequestMapping(value = "/editLoad")
	public ModelAndView editLoad(@RequestParam(value = "id") Integer id){
		User user = userService.selectByPrimaryKey(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", user);
		mv.setViewName("editUser");
		return mv;
	}
	/**
     * 修改信息
     * @param user
     * @return
     */
	@RequestMapping(value = "/edit",method = RequestMethod.POST)
	public String edit(User user){
		userService.updateByPrimaryKeySelective(user);
		return "redirect:/user/userList";
	}
	/**
     * 删除用户
     * @param id
     * @return
     */
	@RequestMapping(value = "/delete")
	public String  delete(@RequestParam(value = "id") Integer id){
		userService.deleteByPrimaryKey(id);
		
		return "redirect:/user/userList";
	}
	
	
	/**
	 * 用户的分页查询以及条件查询
	 * @param request
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping(value = "/userList")
	public ModelAndView userList(HttpServletRequest request,@RequestParam(value="pageIndex",defaultValue="1",required=false) Integer pageIndex){
		        HttpSession session=request.getSession();
		        //接收请求查询参数
				String userName=request.getParameter("userName");
				String userUsername=request.getParameter("userUsername");

				//向页面传值
				if(userName!=null){
					session.setAttribute("userName", userName);
				}
				if(userUsername!=null){
					session.setAttribute("userUsername", userUsername);
				}
				
				
				String uname=(String)session.getAttribute("userName");
				String userUserName=(String)session.getAttribute("userUsername");
				
				
				Page<User> pageu = userService.selectUserByPage(uname,userUserName,pageIndex);
				
				ModelAndView mv = new ModelAndView();
				mv.addObject("pagemsg", pageu);
				mv.setViewName("userList");
				return mv;
	}
	
	
	
	
}
