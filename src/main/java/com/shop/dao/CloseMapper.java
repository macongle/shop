package com.shop.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.shop.model.Close;

@Repository
public interface CloseMapper {

	List<Close> selectAll();

	void insertSelective(Close close);

	List<Close> selectlimit();

	Close queryOne(int closeid);

	Close selectBySth(Close close);

}
