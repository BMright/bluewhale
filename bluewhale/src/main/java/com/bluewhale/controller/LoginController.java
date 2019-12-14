package com.bluewhale.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluewhale.pojo.PageData;
import com.bluewhale.pojo.User;
import com.bluewhale.service.LoginService;
import com.bluewhale.service.UtilService;
import com.bluewhale.utils.CreateImageCode;

@Controller
public class LoginController extends BaseController{
	
	@Autowired
	private LoginService loginService;
	
	// 跳转到注册页面
	@RequestMapping(value = "/toRegist")
	public String toRegist() {
		return "regist";
	}
	
	// 跳转到登录页面
	@RequestMapping(value = "/toLogin")
	public String toLogin() {
		HttpSession session = request.getSession();
		String isLogin = (String) session.getAttribute("loginStatus");
		User user = (User) session.getAttribute("user");
		if (isLogin != null && user != null && isLogin.equals("true")) {
			forward("/user");
		}
		return "login";
	}
	
	// 判断是否登录成功
	@RequestMapping(value = "/getIsLogin")
	@ResponseBody
	public Map<String, Object> toHome(User user,String verifyCode) {
		Map<String, Object> map = new HashMap<>();
		String username = user.getUsername();
		String password = user.getPassword();
		String verify = (String) session.getAttribute("ImageCode");
		if (!verifyCode.equals(verify)) {
			map.put("status", "ERROR");
			map.put("info", "验证码错误");
			session.setAttribute("loginStatus", "false");
			return map;
		}
		User user2 = loginService.selectUserByUsername(username);
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
	
	// 获取登录验证码
	@RequestMapping(value = "RandomPictrue")
	public void RandomPictrue() {
		CreateImageCode vcu = new CreateImageCode();
		request.getSession().setAttribute("ImageCode", vcu.getCode());
		//5 图形写给浏览器
        response.setContentType("image/jpeg");
        response.setHeader("Expires", "-1");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setHeader("Pragma", "no-cache");
		try {
			ImageIO.write(vcu.getBuffImg(), "jpg", response.getOutputStream());
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} // 写入流中
	}
	
	/**
	 * 1测试
	 */
	@Autowired
	private UtilService utilService;
	
	@RequestMapping(value = "/testMap")
	public String testMap(){
		PageData pageData = this.getPageData();
		pageData.put("aid", 1);
		pageData.put("uid", 2);
		boolean dianZan = utilService.changeDianZan(pageData);
		System.out.println(dianZan);
		return "test/test";
	}
	
	@RequestMapping(value = "/toTest")
	public String test() {
		return "test/test";
	}
	
}
