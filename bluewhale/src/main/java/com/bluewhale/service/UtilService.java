package com.bluewhale.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluewhale.mapper.ArticleDao;
import com.bluewhale.mapper.UserDao;
import com.bluewhale.pojo.PageData;
import com.bluewhale.pojo.User;

@Service
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
	
	// 通过用户id获取总收藏文章数
	public Integer getCollectCount(int userid) {
		return articleDao.getCollectCount(userid);
	}
	
	// 判断当前用户是否已点赞
	public Boolean isDianZan(PageData pd) {
		PageData pdData = articleDao.isDianZan(pd);
		if (pdData != null) {
			return true;
		}
		return false;
	}
	
	// 判断当前用户是否已收藏
	public Boolean isCollect(PageData pd) {
		PageData pdData = articleDao.isCollect(pd);
		if (pdData != null) {
			return true;
		}
		return false;
	}
	
	// 改变当前点赞状态
	public boolean changeDianZan(PageData pd) {
		try {
			PageData pdData = articleDao.isDianZan(pd);
			if (pdData != null) {
				articleDao.deleteDianZan(pd);
			}else {
				articleDao.addDianZan(pd);
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// 改变当前收藏状态
	public boolean changeCollect(PageData pd) {
		try {
			PageData pdData = articleDao.isCollect(pd);
			if (pdData != null) {
				articleDao.deleteCollect(pd);
			}else {
				articleDao.addCollect(pd);
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}