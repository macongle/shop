package com.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/jump")
public class JumpController {
	
	/**
	 * 跳转到typo界面，没什么用处
	 * @return
	 */
	@RequestMapping(value="/blog")
	public String blog(HttpServletRequest req){
		return "typo";
	}
	
	@RequestMapping(value="/single")
	public String single(HttpServletRequest req){
		
		return "typo";
	}
	
	/**
	 * 跳转到留言界面
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/contact")
	public String sendMessage(HttpServletRequest req){
		return "contact";
	}
	
	/**
	 * 支付界面
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/pay")
	public String pay(HttpServletRequest req){

		return "payment";
	}
	
	
	
	

}
