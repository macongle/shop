package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shop.model.Cart;

@Repository
public interface CartMapper {

	int insertSelective(Cart cart);

	Cart queryOne(int cartid);

	Cart selectByPrimaryKey(int cartid);

	List<Cart> queryAll(int userid);

	void deleteAll(int userid);

	void deleteByPrimaryKey(int cartid, int userid);

	void updateByPrimaryKeySelective(@Param(value="total") int total,
			@Param(value="id") int id,
			@Param(value="number") int number);

	void updateCart(@Param(value="total") int total,
			@Param(value="id") int id,
			@Param(value="number") int number);

	Cart queryByUseridAndCloseid(int userid, int closeid);

	void updateByPrimaryKeySelective(Cart cart);




}
