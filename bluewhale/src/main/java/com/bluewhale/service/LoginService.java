package com.bluewhale.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bluewhale.mapper.LoginDao;
import com.bluewhale.pojo.User;

@Service
public class LoginService {
	
	@Autowired
	private LoginDao loginDao;

	public User selectUserByUsername(String username) {
		return loginDao.selectUserByUsername(username);
	}
}
