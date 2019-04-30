package com.igou.dao;

import java.util.List;

public class ProductDao extends BaseDao {

	public List<Object> findAllBrand() {
		// TODO Auto-generated method stub
		return super.getAll("from Brand");
	}

	public List<Object> findAllTypes() {
		// TODO Auto-generated method stub
		return super.getAll("from ProductType");
	}

}
