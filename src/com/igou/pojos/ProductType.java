package com.igou.pojos;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class ProductType implements Serializable {
	// 主键ID
	private Integer id;
	// 一级分类名称
	private String name;
	// 与商品分类是多对一关系 n-1
	private Set<Product> products = new HashSet<>();

	public ProductType() {

	}

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

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

}
