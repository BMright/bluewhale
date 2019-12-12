package com.bluewhale.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluewhale.mapper.UserDao;
import com.bluewhale.pojo.User;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	// 添加用户
	public void addUser(User user) {
		userDao.addUser(user);
	}
	
	// 修改用户信息
	public void updateUserInfo(User user) {
		userDao.updateUserInfo(user);
	}
	
	// 通过email查找用户
	public User getUserByEmail(String email) {
		return userDao.getUserByEmail(email);
	}
}
