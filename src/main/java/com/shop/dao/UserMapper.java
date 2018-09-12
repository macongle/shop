package com.shop.dao;

import org.springframework.stereotype.Repository;

import com.shop.model.User;

@Repository
public interface UserMapper {

	int regist(User user);

	User login(User user);

	User selectAll(User user);

	User selectByPrimaryKey(int userid);

	void updateByPrimaryKeySelective(User user);

}
