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
	 * 清空购物车
	 * @param req
	 * @return
	 */
	@RequestMapping(value="clear/{userid}")
	public String clear(HttpServletRequest req,
			@PathVariable int userid){
		//根据传参过来的userid,来删除该用户的购物车里面的信息
		service.deleteAll(userid);
		
		User user = userService.selectByPrimaryKey(userid);
		
		user.setTotals(0);
		
		userService.updateByPrimaryKeySelective(user);
		
		req.getSession().setAttribute("user", user);
		//删除完之后，
		return "index";
		
	}
	
	
	/**
	 * 点击add to cart 将数据存储到数据库中，当打开购物车时，从数据库中查询里面的信息
	 *   先根据传入的信息，查询该条数据的所有信息
	 * @param req
	 * @param close
	 * @param file
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/{closeid}")
	public String toCart(HttpServletRequest req, 
			ModelMap map,@PathVariable int closeid){
		     //获取到用户id
		     User loginuser = (User) req.getSession().getAttribute("user");
		     int userid = loginuser.getId(); 
		     
		     //在购物车数据库中查看该用户的购物车中是否有本产品，如果有就在数量上加1
		     Cart flag = service.queryByUseridAndCloseid(userid,closeid);
		     
		     //根据id,查询到该衣服的信息
		     Close close=closeService.queryOne(closeid);
		     
		     //更新totals
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
		    	//将得到的数据，插入到购物车的数据库中
			     //先创建个购物车的对象
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
	 * 登陆后点击进入购物车，如果登陆的话，就会有userid这个属性
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/checkout")
	public String checkout(HttpServletRequest req){
	        User user = (User) req.getSession().getAttribute("user");
		
	       int userid =user.getId();
			//根据用户id查询该用户购物车数据库中所有数据
			List<Cart> list=service.queryAll(userid);
			
			req.setAttribute("list", list);
			
			//跳转到购物车界面--checkout
			return "checkout";
	     
	}
	
	/**
	 * 没有登陆进入购物车
	 * @param req
	 * @return
	 */
	@RequestMapping(value="/login")
	public String login(HttpServletRequest req){
		
		req.setAttribute("msg", "Please make a landing first");
		
		return "login";
	}
	
	
	/**
	 * 点击图片，进入该服装的详情界面single
	 * @param closeid
	 * @param req
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/single/{closeid}")
	public String single(@PathVariable int closeid,HttpServletRequest req,
			ModelMap map){
		//现根据id获取到该衣服的信息
		 Close close=closeService.queryOne(closeid);
		 //传到single界面
		 req.setAttribute("close", close);

		return "single";
		
	}
	
	
	
	/**
	 * 更换数量刷新数据
	 * @param req
	 * @return
	 */
	@RequestMapping(value="updateCart")
	public String updateCart(HttpServletRequest req){
		int number = Integer.parseInt(req.getParameter("count"));
		int cartid=Integer.parseInt(req.getParameter("cartid"));
//		User user1=(User) req.getSession().getAttribute("user");
		//先更新数据
		service.updateCart(cartid,number);
		
//		int userid = user1.getId();
		//更新totals
		
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
	 * 删除单个物品
	 * @param cartid
	 * @param req
	 * @param userid
	 * @return
	 */
	@RequestMapping(value="/del/{cartid}/{userid}")
	public String deleteByCartid(@PathVariable int cartid,
			HttpServletRequest req,@PathVariable int userid){
		
		//更新totals
		User user = userService.selectByPrimaryKey(userid);
		
		Cart cart = service.selectByPrimaryKey(cartid);
		
		user.setTotals(user.getTotals()-cart.getTotal());
		
		userService.updateByPrimaryKeySelective(user);
		
		req.getSession().setAttribute("user", user);
		
		//根据衣服的id来删除对应的服装
		service.deleteByPrimaryKey(cartid,userid);
		
		return "redirect:/cart/checkout";
	}
}
