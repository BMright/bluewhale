package com.bluewhale.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluewhale.mapper.ArticleDao;
import com.bluewhale.pojo.Article;
import com.bluewhale.pojo.QueryVo;

@Service
public class ArticleService {
	@Autowired
	private ArticleDao articleDao;
	
	// 通过文件id获取文章
	public Article getArticleById(Integer id) {
		return articleDao.getArticleById(id);
	}
	
	// 添加文章
	public void addArticle(Article article) {
		article.setTitle("test1");
		article.setOwnerid(2);
		articleDao.addArticle(article);
	}
	
	// 通过id删除文章
	public void deleteArticleById(Integer id) {
		articleDao.deleteArticleById(id);
	}
	
	// 获取文章列表
	public QueryVo<Article> getArticle(QueryVo<Article> qv) {
		Integer total = articleDao.getArticleTotal();
		qv.setTotal(total);
		qv.setTotalPage();
		qv.setBeginIndex();
		List<Article> article = articleDao.getArticle(qv);
		qv.setQueryList(article);
		return qv;
	}
}
