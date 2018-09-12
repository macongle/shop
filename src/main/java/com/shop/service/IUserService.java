package com.shop.service;

import com.shop.model.User;

public interface IUserService {

	int regist(User user);

	User login(User user);

	User selectAll(User user);

	User selectByPrimaryKey(int userid);

	void updateByPrimaryKeySelective(User user);

}
