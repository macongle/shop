package com.shop.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.shop.model.Close;

public interface ICloseService {

	List<Close> selectAll();

	void uploadImg(String savePath, MultipartFile file);

	void insertClose(Close close);

	Close queryOne(int closeid);

	List<Close> selectlimit();

	Close selectBySth(Close close);


	

}
