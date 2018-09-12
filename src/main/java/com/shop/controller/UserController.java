package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.model.Cart;
import com.shop.model.User;
import com.shop.service.ICartService;
import com.shop.service.IUserService;

@Controller
@RequestMapping(value="/shop")
public class UserController {

	@Autowired
	private IUserService service;
	
	@Autowired
	private ICartService cartService;
	
	@RequestMapping
	public String index(){
		return "index";
	}
	
	@RequestMapping(value="/home")
	public String home(HttpServletRequest req){
		return "index";
	}
	
	/**
	 * 跳转到登陆界面
	 * @return
	 */
	@RequestMapping(value="/tologin")
	public String UserLogin(){	
		return "login";
	}
	
	/**
	 * 跳转到注册界面
	 * @return
	 */
	@RequestMapping(value="/register")
	public String toRegist(){
		return "register";
	}
	
	/**
	 * 注册(用户名可以随便起，但是邮箱地址只能是唯一的，作为登陆用的)
	 * 注册之前应该先根据数据查询数据库，如果数据库中有该数据，则无法注册
	 */
	@RequestMapping(value="/regist")
	public String Regist(ModelMap map,User user){
		//根据用户输入的信息，到数据库中查询
		User user2 = service.selectAll(user);
		//提示语句
		String message=null;
		//如果没有查询到数据，则该用户可以注册	
		if(user2==null){
			//插入数据
			int count = service.regist(user);
			if(count>0){
				message="register successful";
				map.addAttribute("message", message);
				return "index";
			}
		}
		message="Email Address already exists";
		map.addAttribute("message", message);
		return "register";
	}
	
	/**
	 * 登陆
	 * @param map
	 * @param req 获取表单中的数据
	 * @return
	 */
	@RequestMapping(value="/login")
	public String Login(ModelMap map,HttpServletRequest req
			){
		//获取用户输入的邮箱和密码
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		//存放到user对象中
		User user=new User();
		user.setEmail(email);
		user.setPassword(password);
		//到数据库中查询，查看是否含有该信息
		User userLogin = service.login(user);
		String msg=null;
		if(userLogin!=null){
			msg="Landing success";
			req.setAttribute("msg", msg);
			//登陆成功后，自动根据用户id，从购物车数据库中，查该用户的所有数据
			int userid = userLogin.getId();
			List<Cart> list = cartService.queryAll(userid);
			int totals=0;
			for (Cart cart : list) {
				totals =cart.getTotal()+totals;
			}
			userLogin.setTotals(totals);
			service.updateByPrimaryKeySelective(userLogin);
			req.getSession().setAttribute("user", userLogin);
			return "index";
		}
		msg="Landing failure";
		map.addAttribute("msg", msg);
		return "login";	
	}
	
	/**
	 * 退出登陆
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/exit")
	public String exit(HttpServletRequest req){
		//先移除session里面的信息
		req.getSession().removeAttribute("user");
		
		return "index";
	}
	
	
}
