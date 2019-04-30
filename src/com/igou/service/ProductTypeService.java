package com.igou.service;

import java.util.List;

import com.igou.dao.ProductTypeDao;
import com.igou.pojos.ProductType;

public class ProductTypeService {
	private ProductTypeDao productTypeDao;

	public ProductTypeDao getProductTypeDao() {
		return productTypeDao;
	}

	public void setProductTypeDao(ProductTypeDao productTypeDao) {
		this.productTypeDao = productTypeDao;
	}

	public void save(ProductType type) {
		// TODO Auto-generated method stub
		productTypeDao.save(type);
	}

	public List<Object> findAll() {
		// TODO Auto-generated method stub
		return productTypeDao.getAll("from ProductType");
	}

	public Object findTypeById(Integer id) {
		// TODO Auto-generated method stub
		return productTypeDao.findById(ProductType.class, id);
	}

}
