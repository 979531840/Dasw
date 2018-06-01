package com.dasw.dao;


import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;


import com.dasw.entity.User;
@Repository(value="userMapper")
public interface UserMapper {

	
	/** 
	 * 取得用户信息，通过登录用户ID查询 
	 * @param userId 
	 * @return 
	 */  
	public long getUsersCount(User user); 
	
	
    int deleteByPrimaryKey(Integer userId);
    
    
	User login(User user);//登陆

    int insert(User record);

    int insertSelective(User record);

    /**
     * 此方法对应于数据库中的表 ,user
     * 查询所有数据库记录
     */
	List<User> findAll();
    
    User selectByPrimaryKey(Integer userId);


    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    
    int selectUserPageCount(User user);
    
    List<User> selectUserByPage(HashMap<String,Object> map);
}