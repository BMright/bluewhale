package com.bluewhale.mapper;

import java.util.List;

import com.bluewhale.pojo.Article;
import com.bluewhale.pojo.PageData;

public interface ArticleDao {
	
	// 获取访问量最多的五个
	public List<Article> getFifthArticle(PageData pd);
	
	// 获取文章总数
	public Integer getArticleTotal(PageData pd);
	
	// 添加文章
	public void addArticle(Article article);
	
	// 通过id获取文章
	public Article getArticleById(Integer id);
	
	// 通过id删除文章
	public void deleteArticleById(Integer id);
	
	// 获取文章列表
	public List<Article> getArticle(PageData pd);
	
	// 获取文章点赞数
	public Integer getZanCount(Integer id);
	
	// 判断文章是否已点赞
	public PageData isDianZan(PageData pd);
	
	// 删除点赞
	public void deleteDianZan(PageData pd);
	
	// 添加点赞
	public void addDianZan(PageData pd);

	// 判断文章是否已收藏
	public PageData isCollect(PageData pd);
	
	// 删除收藏
	public void deleteCollect(PageData pd);
		
	// 添加收藏
	public void addCollect(PageData pd);

	// 获取该用户收藏文章数
	public Integer getCollectCount(int userid);

	// 获取用户收藏文章列表
	public List<Article> getCollectArticle(PageData pd);
}
