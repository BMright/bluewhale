package com.bluewhale.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bluewhale.pojo.Article;
import com.bluewhale.pojo.PageData;
import com.bluewhale.pojo.QueryVo;
import com.bluewhale.pojo.User;
import com.bluewhale.service.ArticleService;
import com.bluewhale.service.UtilService;

@Controller
public class ArticleController extends BaseController{
	
	@Autowired
	private ArticleService articleService;
	@Autowired
	private UtilService utilService;
	
	// 跳转到修改文章页面
	@RequestMapping(value = "/toEditTest")
	public String toEditTest() {
		Article article = articleService.getArticleById(4);
		model.addAttribute("article", article);
		return "test/editorTest";
	}
	// 跳转到编辑文章页面
	@RequestMapping(value = "/toEditArticle")
	public String toEditArticle() {
		return "article/editArticle";
	}
	
	// 添加博文
	@RequestMapping(value = "addArticle")
	public String addArticle(Article article) {
		System.out.println("article:" + article);
		session.setAttribute("user", utilService.getUserById(1));
		User user = (User) session.getAttribute("user");
		article.setOwnerid(user.getId());
		articleService.addArticle(article);
		System.out.println("id:" + article.getId());
		
		return "test/test";
	}
	
	// 上传图片
	@RequestMapping(value = "/uploadImg")
	@ResponseBody
	public Map<String, Object> uploadImg(@RequestParam(value = "editormd-image-file", required = true) MultipartFile file){
		Map<String, Object> map = new HashMap<>();
		try {
			if(null!=file){
		        String fileOrigName=file.getOriginalFilename();// 文件原名称
		        if (!fileOrigName.contains(".")) {
		            throw new IllegalArgumentException("缺少后缀名");
		        }
		        //获取后缀名
		        String fileEndName = fileOrigName.substring(fileOrigName.lastIndexOf("."));
		        System.out.println("后缀名:"+fileEndName);
		        String realPath = "C:\\uploadImg\\";       
		        String newdestPath= realPath + fileOrigName;
		        //判断上传文件的目录是否存在
		        File newfile=new File(newdestPath);
		        if(!newfile.exists() && !newfile.isDirectory()){
		            System.out.println(newfile+"目录不存在，需要创建");
		            //创建目录
		            newfile.mkdirs();
		        }
		        System.out.println(newfile.getAbsolutePath());
		        file.transferTo(newfile);
		        map.put("success", "1");
				map.put("message", "成功");
				map.put("url",	"http://www.blingbling.wiki/uploadImg/" + fileOrigName);
		    }
		} catch (Exception e) {
			map.put("success", "0");
			map.put("message", "失败");
		    return map;
		}
		return map;
	}
	
	// 通过文章id获取文章
	@RequestMapping(value = "/getArticleById")
	public String getArticleById(Integer id) {
		Article article = articleService.getArticleById(id);
		model.addAttribute("article", article);
		return "test/true";
	}
	
	// 通过id删除文章
	@RequestMapping(value = "/deleteArticleById")
	@ResponseBody()
	public Map<String, Object> deleteArticleById(Integer id) {
		Map<String, Object> map = new HashMap<>();
		articleService.deleteArticleById(id);
		map.put("info", "删除成功");
		return map;
	}
	
	// 获取文章列表
	@RequestMapping(value ="/getPageData")
	@ResponseBody
	public Map<String, Object> getArticlePage(QueryVo<Article> qv){
		Map<String, Object> map = new HashMap<>();
		QueryVo<Article> vo = articleService.getArticle(qv);
		map.put("pageData", vo);
		return map;
	}
	
	// 改变文章点赞状态
	@RequestMapping(value = "changeDianZan")
	@ResponseBody
	public Map<String, Object> changeDianZan(){
		Map<String, Object> map = new HashMap<>();
		PageData pd = this.getPageData();
		User user = (User) session.getAttribute("user");
		pd.put("uid", user.getId());
		boolean dianZan = utilService.changeDianZan(pd);
		if (dianZan) {
			map.put("status", "SUCCESS");
		}else {
			map.put("status", "ERROR");
		}
		return map;
	}
}
