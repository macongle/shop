package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shop.model.Close;
import com.shop.service.ICloseService;

@Controller
@RequestMapping(value="/close")
public class CloseController {
	
	@Autowired
	private ICloseService service;
	
	
	/**
	 * 
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/products")
	public String products(HttpServletRequest req){
	
		//查询所有的衣服信息
		List<Close> close = (List<Close>) service.selectAll();
		
		//根据销售量查询,将数据放回到products的右边部分
		List<Close> list=service.selectlimit();
		
		req.setAttribute("close", close);
		req.setAttribute("list", list);
		return "products";
	}
	
	/**
	 * 跳转
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/toadd")
	public String toadd(HttpServletRequest req){
		return "addclose";
	}
	
	/**
	 * 添加服装的信息
	 * @param req
	 * @param close
	 * @param file
	 * @param map
	 * @return
	 */
	@RequestMapping(value="add",method=RequestMethod.POST)
	public String addClose(HttpServletRequest req,Close close,
			@RequestParam(value="imgFile",required=false) MultipartFile file,
			ModelMap map){
		System.out.println("addclose");
		if(!file.isEmpty()){
			String savePath=req.getServletContext().getRealPath("upload");
			System.out.println(savePath);
			service.uploadImg(savePath,file);
			close.setImgAddress("/upload/"+file.getOriginalFilename());
		}
		service.insertClose(close);
		map.addAttribute("message", "添加成功");
		return "index";
	}
	

	
}
