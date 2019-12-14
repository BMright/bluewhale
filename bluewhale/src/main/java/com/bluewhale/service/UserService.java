package com.bluewhale.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluewhale.mapper.UserDao;
import com.bluewhale.pojo.User;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private LoginService loginService;
	
	// 添加用户
	public Map<String, Object> addUser(User user) {
		Map<String, Object> map = new HashMap<>();
		User selectedUser = loginService.selectUserByUsername(user.getUsername());
		if (selectedUser == null) {
			user.setRoot(1);
			userDao.addUser(user);
			map.put("status", "SUCCESS");
			map.put("msg", "注册成功");
		}
		else {
			map.put("status", "ERROR");
			map.put("msg", "该用户名已被注册");
		}
		return map;
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
