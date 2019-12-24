package com.bluewhale.mapper;

import java.util.List;

import com.bluewhale.pojo.QueryVo;
import com.bluewhale.pojo.User;

public interface UserDao {
	
	// 添加用户
	public void addUser(User user);
	
	// 修改用户信息
	public void updateUserInfo(User user);
	
	// 通过id查找用户
	public User getUserById(Integer id);
	
	// 通过email查找用户
	public User getUserByEmail(String email);
	
	// 获取用户总数
	public Integer getUserTotal();
	
	// 获取用户分页列表
	public List<User> getUserList(QueryVo<User> qv);
}
