package com.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.CartMapper;
import com.shop.model.Cart;
import com.shop.service.ICartService;

@Service
public class CartServiceImpl implements ICartService{

	@Autowired
	private CartMapper dao;

	@Override
	public int insertSelective(Cart cart) {
		return dao.insertSelective(cart);
	}


	@Override
	public Cart queryOne(int cartid) {
		return dao.queryOne(cartid);
	}


	@Override
	public Cart selectByPrimaryKey(int cartid) {
		return dao.selectByPrimaryKey(cartid);
	}

	@Override
	public List<Cart> queryAll(int userid) {
		return dao.queryAll(userid);
	}



	@Override
	public void deleteAll(int userid) {
		dao.deleteAll(userid);
	}


	@Override
	public void deleteByPrimaryKey(int cartid,int userid) {
		dao.deleteByPrimaryKey(cartid,userid);
	}


	@Override
	public void updateCart(int id, int number) {
		Cart cart=dao.selectByPrimaryKey(id);
		int total = cart.getPrices() * number + cart.getFreight();
		System.out.println("cart"+cart);
		System.out.println("total:"+total);
		dao.updateCart(total,id,number);
	}


	@Override
	public Cart queryByUseridAndCloseid(int userid, int closeid) {
		return dao.queryByUseridAndCloseid(userid,closeid);
	}


	@Override
	public void updateByPrimaryKeySelective(Cart flag) {
		Cart cart = flag;
		dao.updateByPrimaryKeySelective(cart);
	}




	

}
