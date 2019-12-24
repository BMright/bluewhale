package com.bluewhale.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bluewhale.pojo.Article;
import com.bluewhale.pojo.User;
import com.bluewhale.service.ArticleService;

@Controller
public class HomeController extends BaseController{

	@Autowired
	ArticleService articleService;
	
	// 跳转到用户所有博文页面
	@RequestMapping(value = "/toCollectArticle")
	public String collectBlogs() {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		return "user/user_collect";
	}
	
	// 跳转到游客页面
	@RequestMapping(value = "/visitor")
	public String toTest() {
		List<Article> fifthArticle = articleService.getFifthArticle(-1);
		model.addAttribute("articleList", fifthArticle);
		return "baseLayout/index";
	}
	// 跳转到游客所有博文页面
	@RequestMapping(value = "/visitorBlogs")
	public String visitorBlogs() {
		/*QueryVo<Article> qv = new QueryVo<>();
		qv.setCurrentPage(1);
		qv.setPageSize(5);
		User user = (User) session.getAttribute("user");
		if (user != null) {
			qv = articleService.getArticle(qv,user.getId());
		}else {
			qv = articleService.getArticle(qv,-1);
		}
		model.addAttribute("articleList", qv.getQueryList());*/
		return "article/visitorBlogs";
	}
	
	// 跳转到用户主页面
	@RequestMapping(value = "/user")
	public String user() {
		User user = (User) session.getAttribute("user");
		model.addAttribute("user", user);
		List<Article> fifthArticle;
		if (user != null) {
			fifthArticle = articleService.getFifthArticle(user.getId());
		}else {
			fifthArticle = articleService.getFifthArticle(-1);
		}
		
		model.addAttribute("articleList", fifthArticle);
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
