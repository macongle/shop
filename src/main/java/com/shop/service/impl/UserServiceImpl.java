package com.shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.UserMapper;
import com.shop.model.User;
import com.shop.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserMapper dao;
	
	@Override
	public int regist(User user) {
		return dao.regist(user);
	}

	@Override
	public User login(User user) {
		return dao.login(user);
	}

	@Override
	public User selectAll(User user) {
		return dao.selectAll(user);
	}

	@Override
	public User selectByPrimaryKey(int userid) {
		return dao.selectByPrimaryKey(userid);
	}

	@Override
	public void updateByPrimaryKeySelective(User user) {
		dao.updateByPrimaryKeySelective(user);
	}
}
