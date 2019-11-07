package com.bluewhale.mapper;

import com.bluewhale.pojo.User;

public interface LoginDao {
	
	// 通过用户名查询用户
	public User selectUserByUsername(String username);
	
	
}
