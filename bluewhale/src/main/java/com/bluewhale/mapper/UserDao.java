package com.bluewhale.mapper;

import com.bluewhale.pojo.User;

public interface UserDao {
	
	// 添加用户
	public void addUser(User user);
	
	// 修改用户信息
	public void updateUserInfo(User user);
	
	// 通过id查找用户
	public User getUserById(Integer id);
}
