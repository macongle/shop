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
	 * ��ת����½����
	 * @return
	 */
	@RequestMapping(value="/tologin")
	public String UserLogin(){	
		return "login";
	}
	
	/**
	 * ��ת��ע�����
	 * @return
	 */
	@RequestMapping(value="/register")
	public String toRegist(){
		return "register";
	}
	
	/**
	 * ע��(�û�����������𣬵��������ַֻ����Ψһ�ģ���Ϊ��½�õ�)
	 * ע��֮ǰӦ���ȸ������ݲ�ѯ���ݿ⣬������ݿ����и����ݣ����޷�ע��
	 */
	@RequestMapping(value="/regist")
	public String Regist(ModelMap map,User user){
		//�����û��������Ϣ�������ݿ��в�ѯ
		User user2 = service.selectAll(user);
		//��ʾ���
		String message=null;
		//���û�в�ѯ�����ݣ�����û�����ע��	
		if(user2==null){
			//��������
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
	 * ��½
	 * @param map
	 * @param req ��ȡ���е�����
	 * @return
	 */
	@RequestMapping(value="/login")
	public String Login(ModelMap map,HttpServletRequest req
			){
		//��ȡ�û���������������
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		//��ŵ�user������
		User user=new User();
		user.setEmail(email);
		user.setPassword(password);
		//�����ݿ��в�ѯ���鿴�Ƿ��и���Ϣ
		User userLogin = service.login(user);
		String msg=null;
		if(userLogin!=null){
			msg="Landing success";
			req.setAttribute("msg", msg);
			//��½�ɹ����Զ������û�id���ӹ��ﳵ���ݿ��У�����û�����������
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
	 * �˳���½
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/exit")
	public String exit(HttpServletRequest req){
		//���Ƴ�session�������Ϣ
		req.getSession().removeAttribute("user");
		
		return "index";
	}
	
	
}
