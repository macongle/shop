package com.shop.service;

import java.util.List;

import com.shop.model.Cart;

public interface ICartService {

	int insertSelective(Cart cart);

	Cart queryOne(int cartid);

	Cart selectByPrimaryKey(int cartid);

	List<Cart> queryAll(int userid);

	void deleteAll(int userid);

	void deleteByPrimaryKey(int cartid, int userid);

	void updateCart(int cartid, int number);

	Cart queryByUseridAndCloseid(int userid, int closeid);

	void updateByPrimaryKeySelective(Cart flag);


	

}
