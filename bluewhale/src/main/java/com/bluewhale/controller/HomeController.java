package com.bluewhale.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bluewhale.pojo.Article;
import com.bluewhale.pojo.QueryVo;
import com.bluewhale.pojo.User;
import com.bluewhale.service.ArticleService;

@Controller
public class HomeController extends BaseController{

	@Autowired
	ArticleService articleService;
	
	// 跳转到游客页面
	@RequestMapping(value = "/visitor")
	public String toTest() {
		QueryVo<Article> qv = new QueryVo<>();
		qv.setCurrentPage(1);
		qv.setPageSize(3);
		QueryVo<Article> queryVo = articleService.getArticle(qv);
		model.addAttribute("articleList", queryVo.getQueryList());
		return "baseLayout/index";
	}
	// 跳转到游客所有博文页面
	@RequestMapping(value = "/visitorBlogs")
	public String visitorBlogs() {
		QueryVo<Article> qv = new QueryVo<>();
		qv.setCurrentPage(1);
		qv.setPageSize(3);
		QueryVo<Article> queryVo = articleService.getArticle(qv);
		model.addAttribute("articleList", queryVo.getQueryList());
		return "article/visitorBlogs";
	}
	
	// 跳转到用户主页面
	@RequestMapping(value = "/user")
	public String toAdmin() {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		return "baseLayout/userIndex";
	}
	// 跳转到用户所有博文页面
	@RequestMapping(value = "/userBlogs")
	public String adminUser() {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		return "article/userBlogs";
	}
	
	// 跳转到博文内容页面
	@RequestMapping(value = "blogContent")
	public String toBlogContent(Integer id) {
		System.out.println("article_id:" + id);
		Article article = articleService.getArticleById(id);
		model.addAttribute("article", article);
		return "article/articleContent";
	}
}
