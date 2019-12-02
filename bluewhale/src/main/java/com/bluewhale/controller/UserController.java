package com.bluewhale.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bluewhale.pojo.User;
import com.bluewhale.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	// 用户注册，添加用户
	@RequestMapping(value = "/addUser")
	public String addUser(User user) {
		userService.addUser(user);
		return "";
	}
	
	// 修改用户信息
	@RequestMapping(value = "/updateUserInfo")
	public Map<String, Object> updateUserInfo(User user){
		Map<String, Object> map = new HashMap<>();
		userService.updateUserInfo(user);
		return map;
	}
	
	// 找回密码
	@RequestMapping(value = "/findBackPassword")
	public String findBackPassword() {
		
		
		return "";
	}
}
