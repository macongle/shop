package com.shop.model;

import org.springframework.stereotype.Component;

@Component
public class Close {

	private int id;
	private String imgAddress;
	private String style;
	private int prices;
	private String title;
	private int seller;
	private String resume;
	public Close() {
		super();
	}
	public Close(int id, String imgAddress, String style, int prices,
			String title, int seller, String resume) {
		super();
		this.id = id;
		this.imgAddress = imgAddress;
		this.style = style;
		this.prices = prices;
		this.title = title;
		this.seller = seller;
		this.resume = resume;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImgAddress() {
		return imgAddress;
	}
	public void setImgAddress(String imgAddress) {
		this.imgAddress = imgAddress;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public int getPrices() {
		return prices;
	}
	public void setPrices(int prices) {
		this.prices = prices;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSeller() {
		return seller;
	}
	public void setSeller(int seller) {
		this.seller = seller;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	@Override
	public String toString() {
		return "Close [id=" + id + ", imgAddress=" + imgAddress + ", style="
				+ style + ", prices=" + prices + ", title=" + title
				+ ", seller=" + seller + ", resume=" + resume + "]";
	}
	
	
	
	
	
}
