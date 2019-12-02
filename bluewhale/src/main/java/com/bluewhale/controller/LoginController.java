package com.bluewhale.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluewhale.pojo.User;
import com.bluewhale.service.LoginService;

@Controller
@RequestMapping(value = "/")
public class LoginController extends BaseController{
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value = "/toLogin")
	public String toLogin() {
		HttpSession session = request.getSession();
		String isLogin = (String) session.getAttribute("loginStatus");
		if (isLogin != null && isLogin.equals("true")) {
			forward("/user");
		}
		return "login";
	}
	
	@RequestMapping(value = "/getIsLogin")
	@ResponseBody
	public Map<String, Object> toHome(HttpServletRequest request,User user,Model model) {
		Map<String, Object> map = new HashMap<>();
		String username = user.getUsername();
		String password = user.getPassword();
		User user2 = loginService.selectUserByUsername(username);
		System.out.println(user2);
		HttpSession session = request.getSession();
		
		if (user2 == null){
			map.put("status", "ERROR");
			map.put("info", "用户名不存在！");
			session.setAttribute("loginStatus", "false");
			return map;
		}else if (!user2.getPassword().equals(password)){
			map.put("status", "ERROR");
			map.put("info", "用户名或密码错误！");
			session.setAttribute("loginStatus", "false");
			return map;
		}
		
		session.setAttribute("loginStatus", "true");
		session.setAttribute("user", user2);
		map.put("status", "SUCCESS");
		map.put("root", user2.getRoot());
		map.put("username", username);
		map.put("password", password);
		return map;
	}
	
	@RequestMapping(value = "/home")
	public String home() {
		return "testHome";
	}
	
	@RequestMapping(value = "/testMap")
	public String testMap(){
		
		return "test";
	}
	
	@RequestMapping(value = "/toTest")
	public String test() {
		return "test";
	}
	
}
