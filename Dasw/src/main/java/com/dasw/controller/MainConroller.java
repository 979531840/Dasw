package com.dasw.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.dasw.entity.User;
import com.dasw.service.UserService;

@Controller
@RequestMapping(value="/base")
public class MainConroller {
	
	@Autowired
	private UserService userService;
	/*@RequestMapping(value = "/index")
	public ModelAndView main(){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}*/
	
	@RequestMapping(value = "/index")
	public ModelAndView main(User user,HttpServletRequest request,HttpSession session){
		
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
		}
		mv.setViewName("index");
		return mv;
	}
}
