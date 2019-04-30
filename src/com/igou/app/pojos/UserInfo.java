package com.igou.app.pojos;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Administrator on 2016-08-28.
 */
public class UserInfo implements Serializable {

	// User表 ： ID 登录账号，登录密码，电话 ，头像图片， Set<address> Set<cart> Set<order>
	private Integer id;
	private String name;
	private String pwd;
	private String phone;
	private String handImg;
	private Set<Address> address = new HashSet<>();
	private Set<Cart> carts = new HashSet<>();
	private Set<Order> orders = new HashSet<>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHandImg() {
		return handImg;
	}

	public void setHandImg(String handImg) {
		this.handImg = handImg;
	}

	public Set<Address> getAddress() {
		return address;
	}

	public void setAddress(Set<Address> address) {
		this.address = address;
	}

	public Set<Cart> getCarts() {
		return carts;
	}

	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}

	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
}
