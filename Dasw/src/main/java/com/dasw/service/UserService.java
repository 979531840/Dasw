package com.dasw.service;

import java.util.List;
import com.dasw.entity.Page;
import com.dasw.entity.User;

public interface UserService {
	public int deleteByPrimaryKey(Integer userId);

	public int insert(User record);

	public int insertSelective(User record);
	
	public User login(User user) throws Exception;//登陆

    /**
     * 此方法对应于数据库中的表 ,user
     * 查询所有数据库记录
     */
	public List<User> findAll();
    
	public User selectByPrimaryKey(Integer userId);


	public int updateByPrimaryKeySelective(User record);

	public int updateByPrimaryKey(User record);
	
	
	
	//分页查询和条件模糊查询
    public Page<User> selectUserByPage(String uname,String userUserName,Integer pageIndex);
	/** 
	 * 取得用户信息，通过登录用户ID查询 
	 * @param userId 
	 * @return 
	 */  
	public long getUsersCount(User user); 

}
