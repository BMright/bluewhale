package com.bluewhale.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController extends BaseController{

	// 跳转到游客页面
	@RequestMapping(value = "/visitor")
	public String toTest() {
		return "baseLayout/index";
	}
	// 跳转到游客所有博文页面
	@RequestMapping(value = "/visitorBlogs")
	public String visitorBlogs() {
		return "article/visitorBlogs";
	}
	
	// 跳转到用户主页面
	@RequestMapping(value = "/user")
	public String toAdmin() {
		return "baseLayout/userIndex";
	}
	// 跳转到用户所有博文页面
	@RequestMapping(value = "/userBlogs")
	public String adminUser() {
		return "article/userBlogs";
	}
	
	// 跳转到博文内容页面
	@RequestMapping(value = "blogContent")
	public String toBlogContent() {
		return "article/articleContent";
	}
}
