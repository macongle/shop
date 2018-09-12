package com.shop.model;

import org.springframework.stereotype.Component;

@Component
public class Cart {

	private int id; //id
	private String img;  //图片
	private String title;  //标题
	private String resume;  //详情
	private int number;  //数量
	private int prices;  //单价
	private int freight;  //运费
	private int userid; //用户id
	private int closeid;  //服装id
	private int total; //单个总价
	public Cart() {
		super();
	}
	public Cart(int id, String img, String title, String resume, int number,
			int prices, int freight, int userid, int closeid, int total) {
		super();
		this.id = id;
		this.img = img;
		this.title = title;
		this.resume = resume;
		this.number = number;
		this.prices = prices;
		this.freight = freight;
		this.userid = userid;
		this.closeid = closeid;
		this.total = total;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getPrices() {
		return prices;
	}
	public void setPrices(int prices) {
		this.prices = prices;
	}
	public int getFreight() {
		return freight;
	}
	public void setFreight(int freight) {
		this.freight = freight;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getCloseid() {
		return closeid;
	}
	public void setCloseid(int closeid) {
		this.closeid = closeid;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", img=" + img + ", title=" + title
				+ ", resume=" + resume + ", number=" + number + ", prices="
				+ prices + ", freight=" + freight + ", userid=" + userid
				+ ", closeid=" + closeid + ", total=" + total + "]";
	}

}
