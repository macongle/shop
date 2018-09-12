package com.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/jump")
public class JumpController {
	
	/**
	 * ��ת��typo���棬ûʲô�ô�
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
	 * ��ת�����Խ���
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/contact")
	public String sendMessage(HttpServletRequest req){
		return "contact";
	}
	
	/**
	 * ֧������
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/pay")
	public String pay(HttpServletRequest req){

		return "payment";
	}
	
	
	
	

}
