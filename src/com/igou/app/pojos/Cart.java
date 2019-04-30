package com.igou.app.pojos;

import java.io.Serializable;

import com.igou.pojos.Product;

/**
 * Created by Administrator on 2016-08-28.
 */
public class Cart implements Serializable {
	// ID User对象 尺码，颜色 数量 ，总价
	private Integer id;
	private String size;
	private String color;
	private int num;
	private double totalPrice;
	private Integer userId;
	private Integer proId;
	private Product product;
	private Integer userinfo_id;

	public Integer getUserinfo_id() {
		return userinfo_id;
	}

	public void setUserinfo_id(Integer userinfo_id) {
		this.userinfo_id = userinfo_id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getProId() {
		return proId;
	}

	public void setProId(Integer proId) {
		this.proId = proId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
}
