package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.shop.model.Cart;
import com.shop.model.Close;
import com.shop.model.User;
import com.shop.service.ICartService;
import com.shop.service.ICloseService;
import com.shop.service.IUserService;

@Controller
@RequestMapping(value="/cart")
public class CartController {

	@Autowired
	private ICartService service;
	
	@Autowired
	private ICloseService closeService;
	
	@Autowired
	private IUserService userService;
	
	

	/**
	 * ��չ��ﳵ
	 * @param req
	 * @return
	 */
	@RequestMapping(value="clear/{userid}")
	public String clear(HttpServletRequest req,
			@PathVariable int userid){
		//���ݴ��ι�����userid,��ɾ�����û��Ĺ��ﳵ�������Ϣ
		service.deleteAll(userid);
		
		User user = userService.selectByPrimaryKey(userid);
		
		user.setTotals(0);
		
		userService.updateByPrimaryKeySelective(user);
		
		req.getSession().setAttribute("user", user);
		//ɾ����֮��
		return "index";
		
	}
	
	
	/**
	 * ���add to cart �����ݴ洢�����ݿ��У����򿪹��ﳵʱ�������ݿ��в�ѯ�������Ϣ
	 *   �ȸ��ݴ������Ϣ����ѯ�������ݵ�������Ϣ
	 * @param req
	 * @param close
	 * @param file
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/{closeid}")
	public String toCart(HttpServletRequest req, 
			ModelMap map,@PathVariable int closeid){
		     //��ȡ���û�id
		     User loginuser = (User) req.getSession().getAttribute("user");
		     int userid = loginuser.getId(); 
		     
		     //�ڹ��ﳵ���ݿ��в鿴���û��Ĺ��ﳵ���Ƿ��б���Ʒ������о��������ϼ�1
		     Cart flag = service.queryByUseridAndCloseid(userid,closeid);
		     
		     //����id,��ѯ�����·�����Ϣ
		     Close close=closeService.queryOne(closeid);
		     
		     //����totals
		     User user = userService.selectByPrimaryKey(userid);
				
			 user.setTotals(user.getTotals()+close.getPrices());
				
			 userService.updateByPrimaryKeySelective(user);
				
			 req.getSession().setAttribute("user", user);
		       
		     if(flag != null){
		    	int number = flag.getNumber() +1;
		    	
		    	flag.setNumber(number);
		    	
		    	flag.setTotal(close.getPrices()*number);
		    	
		    	service.updateByPrimaryKeySelective(flag);
		     }else{
		    	//���õ������ݣ����뵽���ﳵ�����ݿ���
			     //�ȴ��������ﳵ�Ķ���
			     Cart cart=new Cart();
			     
			     cart.setImg(close.getImgAddress());
			     cart.setTitle(close.getTitle());
			     cart.setResume(close.getResume());
			     cart.setPrices(close.getPrices());
			     cart.setUserid(userid);
			     cart.setCloseid(closeid);   
		    	 cart.setNumber(1);
			    	
			     cart.setTotal(close.getPrices());
			     
		    	 service.insertSelective(cart);
		     }    	 
		     
		     return "redirect:/close/products";
	}
	
	/**
	 * ��½�������빺�ﳵ�������½�Ļ����ͻ���userid�������
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/checkout")
	public String checkout(HttpServletRequest req){
	        User user = (User) req.getSession().getAttribute("user");
		
	       int userid =user.getId();
			//�����û�id��ѯ���û����ﳵ���ݿ�����������
			List<Cart> list=service.queryAll(userid);
			
			req.setAttribute("list", list);
			
			//��ת�����ﳵ����--checkout
			return "checkout";
	     
	}
	
	/**
	 * û�е�½���빺�ﳵ
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/login")
	public String login(HttpServletRequest req){
		
		req.setAttribute("msg", "Please make a landing first");
		
		return "login";
	}
	
	
	/**
	 * ���ͼƬ������÷�װ���������single
	 * @param closeid
	 * @param req
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/single/{closeid}")
	public String single(@PathVariable int closeid,HttpServletRequest req,
			ModelMap map){
		//�ָ���id��ȡ�����·�����Ϣ
		 Close close=closeService.queryOne(closeid);
		 //����single����
		 req.setAttribute("close", close);

		return "single";
		
	}
	
	
	
	/**
	 * ��������ˢ������
	 * @param req
	 * @return
	 */
	@RequestMapping(value="updateCart")
	public String updateCart(HttpServletRequest req){
		int number = Integer.parseInt(req.getParameter("count"));
		int cartid=Integer.parseInt(req.getParameter("cartid"));
//		User user1=(User) req.getSession().getAttribute("user");
		//�ȸ�������
		service.updateCart(cartid,number);
		
//		int userid = user1.getId();
		//����totals
		
//        User user = userService.selectByPrimaryKey(userid);
//		
//		Cart cart = service.selectByPrimaryKey(cartid);
//		
//		user.setTotals(user.getTotals()-cart.getTotal());
//		
//		userService.updateByPrimaryKeySelective(user);
//		
//		req.getSession().setAttribute("user", user);
		
		return "redirect:/cart/checkout";
	}
	
	/**
	 * ɾ��������Ʒ
	 * @param cartid
	 * @param req
	 * @param userid
	 * @return
	 */
	@RequestMapping(value="/del/{cartid}/{userid}")
	public String deleteByCartid(@PathVariable int cartid,
			HttpServletRequest req,@PathVariable int userid){
		
		//����totals
		User user = userService.selectByPrimaryKey(userid);
		
		Cart cart = service.selectByPrimaryKey(cartid);
		
		user.setTotals(user.getTotals()-cart.getTotal());
		
		userService.updateByPrimaryKeySelective(user);
		
		req.getSession().setAttribute("user", user);
		
		//�����·���id��ɾ����Ӧ�ķ�װ
		service.deleteByPrimaryKey(cartid,userid);
		
		return "redirect:/cart/checkout";
	}
}
