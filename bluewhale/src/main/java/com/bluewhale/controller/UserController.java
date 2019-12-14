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
		return "fbpassword/fbpassword";
	}
	
	// 获得找回密码用户名及密码
	@RequestMapping(value = "/getPaaword")
	@ResponseBody
	public Map<String, Object> getPassword(String email,String verifyCode){
		Map<String, Object> map = new HashMap<>();
		System.out.println("gp-email:" + session.getAttribute(email));
		System.out.println("verifyCode:" + verifyCode);
		/*if (session.getAttribute(email) == null) {
			map.put("status", "ERROR");
			map.put("msg", "验证码失效或已过期！");
			return map;
		}*/
		String vCode = String.valueOf(session.getAttribute(email));
		System.out.println("==:" + (vCode == verifyCode));
		System.out.println("equals:" + vCode.equals(verifyCode));
		if (vCode.equals(verifyCode)) {
			User user = userService.getUserByEmail(email);
			MailUtil.send(email, "找回密码", "用户名：" + user.getUsername() + "\n密码：" + user.getPassword());
			map.put("status", "SUCCESS");
			map.put("msg", "用户名和密码已发到您的注册邮箱，请注意查收！");
		}else {
			map.put("status", "ERROR");
			map.put("msg", "验证码失效或已过期！");
		}
		return map;
	}
	
	// 获得找回密码验证码
	@RequestMapping(value = "/getPasswordKey")
	@ResponseBody
	public Map<String, Object> getPasswordKey(String email) {
		Map<String, Object> map = new HashMap<>();
		User user = userService.getUserByEmail(email);
		if (user == null) {
			map.put("status", "ERROR");
			map.put("msg", "该邮箱不存在");
		}else {
			int random = (int)((Math.random()*9+1)*100000);
			session.setAttribute(email, random);
			System.out.println("gpk-email:" + session.getAttribute(email));
			session.setMaxInactiveInterval(60);
			MailUtil.send(email, "验证码", random + " 此验证码嘛一分钟内有效");
			map.put("status", "SUCCESS");
			map.put("msg", "验证码已发到您的注册邮箱，一分钟有效！");
		}
		return map;
	}
	
	// 注册添加用户
	@RequestMapping(value = "addUser")
	@ResponseBody
	public Map<String, Object> addUser(User user){
		Map<String, Object> map = new HashMap<>();
		map = userService.addUser(user);
		System.out.println(user);
		return map;
	} 
	
	// 修改用户信息
	@RequestMapping(value = "/updateUserInfo")
	public Map<String, Object> updateUserInfo(User user){
		Map<String, Object> map = new HashMap<>();
		userService.updateUserInfo(user);
		return map;
	}
	
}
