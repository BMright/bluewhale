package com.bluewhale.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.bluewhale.mapper.ArticleDao;
import com.bluewhale.mapper.UserDao;
import com.bluewhale.pojo.User;

public class UtilService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private ArticleDao articleDao;
	
	// 通过用户id获取用户
	public User getUserById(int id) {
		return userDao.getUserById(id);
	}
	
	// 通过文章id获取点赞数
	public Integer getZanCount(int id) {
		return articleDao.getZanCount(id);
	}
	
}