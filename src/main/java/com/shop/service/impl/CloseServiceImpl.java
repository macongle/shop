package com.shop.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shop.dao.CloseMapper;
import com.shop.model.Close;
import com.shop.service.ICloseService;

@Service
public class CloseServiceImpl implements ICloseService{

	@Autowired
	private CloseMapper dao;

	@Override
	public List<Close> selectAll() {
		return dao.selectAll();
	}

	/**
	 * 上传单个文件
	 */
	@Override
	public void uploadImg(String savePath, MultipartFile file) {
		String filePath=savePath+File.separator+file.getOriginalFilename();
		
		File saveFile=new File(filePath);
		
		if(!saveFile.getParentFile().exists()){
			saveFile.getParentFile().mkdirs();
		}
		
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertClose(Close close) {
		dao.insertSelective(close);
		
	}


	@Override
	public List<Close> selectlimit() {
		return dao.selectlimit();
	}

	@Override
	public Close queryOne(int closeid) {
		return dao.queryOne(closeid);
	}

	@Override
	public Close selectBySth(Close close) {
		return dao.selectBySth(close);
	}
	
	
}
