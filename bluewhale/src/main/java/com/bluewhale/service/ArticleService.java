package com.bluewhale.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluewhale.mapper.ArticleDao;
import com.bluewhale.pojo.Article;
import com.bluewhale.pojo.PageData;
import com.bluewhale.pojo.QueryVo;
import com.bluewhale.pojo.User;

@Service
public class ArticleService {
	@Autowired
	private ArticleDao articleDao;
	@Autowired
	private UtilService utilService;
	
	// 获取访问量最多的五个
	public List<Article> getFifthArticle(int userid){
		PageData pd = new PageData();
		pd.put("userid", userid);
		List<Article> fifthArticle = articleDao.getFifthArticle(pd);
		for (int i = 0; i < fifthArticle.size(); i++) {
			Article article = fifthArticle.get(i);
			User user = utilService.getUserById(article.getOwnerid());
			article.setOwnername(user.getUsername());
		}
		return fifthArticle;
	}
	
	// 通过文件id获取文章
	public Article getArticleById(Integer id) {
		return articleDao.getArticleById(id);
	}
	
	// 添加文章
	public void addArticle(Article article) {
		SimpleDateFormat simpleDateFormat;
		simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss");
		Date date = new Date();
		String str = simpleDateFormat.format(date);
		article.setSubmitdata(str);
		article.setType("测试");
		article.setComment("");
		articleDao.addArticle(article);
	}
	
	// 通过id删除文章
	public void deleteArticleById(Integer id) {
		articleDao.deleteArticleById(id);
	}
	
	// 获取文章列表
	public QueryVo<Article> getArticle(QueryVo<Article> qv,int id) {
		Integer total = getTotalArticle(id);
		qv.setTotal(total);
		qv.setTotalPage();
		qv.setBeginIndex();
		PageData pd = new PageData();
		pd.put("qv", qv);
		pd.put("userid", id);
		List<Article> article = articleDao.getArticle(pd);
		qv.setQueryList(article);
		return qv;
	}
	
	// 获取文章总数
	public Integer getTotalArticle(int id) {
		PageData pd = new PageData();
		pd.put("userid", id);
		return articleDao.getArticleTotal(pd);
	}
	
	// 获取该用户已收藏文章列表
	public QueryVo<Article> getCollectArticle(QueryVo<Article> qv, Integer userid) {
		Integer total = utilService.getCollectCount(userid);
		qv.setTotal(total);
		qv.setTotalPage();
		qv.setBeginIndex();
		PageData pd = new PageData();
		pd.put("qv", qv);
		pd.put("userid", userid);
		List<Article> article = articleDao.getCollectArticle(pd);
		qv.setQueryList(article);
		return qv;
	}
}
