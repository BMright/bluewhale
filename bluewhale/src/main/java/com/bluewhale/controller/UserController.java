package com.bluewhale.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluewhale.pojo.User;
import com.bluewhale.service.UserService;
import com.bluewhale.utils.MailUtil;

@Controller
public class UserController extends BaseController{
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/selfInfo")
	public String selfInfo(){
		
		return "baseLayout/userInfo";
	}
	
	// 跳转到找回密码页面
	@RequestMapping(value = "/findBackPassword")
	public String findBackPassword() {
		
		return "";
	}
	
	// 获得找回密码验证码
	@RequestMapping(value = "/getPasswordKey")
	@ResponseBody
	public Map<String, Object> getPasswordKey(String email) {
		Map<String, Object> map = new HashMap<>();
		User user = userService.getUserByEmail(email);
		if (user == null) {
			map.put("status", "ERROR");
			map.put("message", "该邮箱不存在");
		}else {
			int random = (int)((Math.random()*9+1)*100000);
			session.setAttribute("verifyCode", random);
			session.setMaxInactiveInterval(600);
			MailUtil.send(email, "验证码", random + " 此验证码嘛一分钟内有效");
			map.put("status", "SUCCESS");
			map.put("message", "验证码已发到您的注册邮箱，一分钟有效！");
		}
		return map;
	}
	
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
	
}
