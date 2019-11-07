package com.bluewhale.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluewhale.pojo.User;
import com.bluewhale.service.LoginService;

@Controller
@RequestMapping(value = "/")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value = "toLogin")
	public String toLogin() {
		System.out.println("我执行了");
		return "login";
	}
	
	@RequestMapping(value = "/toHome")
	@ResponseBody
	public Map<String, Object> toHome(User user,Model model) {
		Map<String, Object> map = new HashMap<>();
		String username = user.getUsername();
		String password = user.getPassword();
		User user2 = loginService.selectUserByUsername(username);
		System.out.println(user2);

		if (user2 == null){
			map.put("status", "ERROR");
			map.put("info", "用户名不存在！");
			return map;
		}else if (!user2.getPassword().equals(password)){
			map.put("status", "ERROR");
			map.put("info", "用户名或密码错误！");
			return map;
		}
		map.put("status", "SUCCESS");
		map.put("username", username);
		map.put("password", password);
		return map;
	}
	
	@RequestMapping(value = "/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/toTest")
	public String test() {
		return "test";
	}
	
}
