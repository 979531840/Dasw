package com.dasw.service.impl;


import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.dasw.dao.UserMapper;

import com.dasw.entity.Page;

import com.dasw.entity.User;
import com.dasw.service.UserService;

@Service(value = "userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	
	
	/**
	 * 登陆
	 */
	public User login(User user) throws Exception{
		
		return userMapper.login(user);
	}

	@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
	public List<User> findAll() {
		return userMapper.findAll();
	}

	public int deleteByPrimaryKey(Integer userId) {
		
		return userMapper.deleteByPrimaryKey(userId);
	}

	public int insert(User record) {
		
		return userMapper.insert(record);
	}

	public int insertSelective(User record) {
		
		return userMapper.insertSelective(record);
	}
	
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
	public User selectByPrimaryKey(Integer userId) {
		
		return userMapper.selectByPrimaryKey(userId);
	}

	public int updateByPrimaryKeySelective(User record) {
		
		return userMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(User record) {
	
		return userMapper.updateByPrimaryKey(record);
	}

	

	public long getUsersCount(User user) {
		// TODO Auto-generated method stub
		return userMapper.getUsersCount(user);
	}

	public Page<User> selectUserByPage(String uname, String userUserName,
			Integer pageIndex) {
		User user=new User();
		user.setUserName(uname);
		user.setUserUsername(userUserName);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Page<User> page = new Page<User>();
		
		//封装当前页数
		page.setPageIndex(pageIndex);
		
		//每页显示的数据
		int pageSize = 20;
		page.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = userMapper.selectUserPageCount(user);
		page.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);//向上取整
		page.setTotalPage(num.intValue());
		
		map.put("start", (pageIndex-1)*pageSize);
		map.put("size", page.getPageSize());
		map.put("userName", uname);
		map.put("userUsername", userUserName);
		
		
		//封装每页显示的数据
		List<User> sList= userMapper.selectUserByPage(map);
		page.setList(sList);
		
		return page;
	}

	

	

	

	

	
		

}
