package com.igou.service;

import java.util.List;

import com.igou.app.pojos.ProductClassify;
import com.igou.dao.ProductClassifyDao;

public class ProductClassifyService {
	private ProductClassifyDao productClassifyDao;

	public ProductClassifyDao getProductClassifyDao() {
		return productClassifyDao;
	}

	public void setProductClassifyDao(ProductClassifyDao productClassifyDao) {
		this.productClassifyDao = productClassifyDao;
	}

	public void save(ProductClassify productClassify) {
		// TODO Auto-generated method stub
		productClassifyDao.save(productClassify);
	}

	public void delete(Integer id) {
		// TODO Auto-generated method stub
		productClassifyDao.delete(ProductClassify.class, id);
	}

	public List<Object> getAll() {
		// TODO Auto-generated method stub
		return productClassifyDao.getAll("from ProductClassify");
	}

	public Object findCLassifyById(Integer id) {
		// TODO Auto-generated method stub
		return productClassifyDao.findById(ProductClassify.class, id);
	}

	public void update(ProductClassify productClassify) {
		// TODO Auto-generated method stub
		productClassifyDao.update(productClassify);
	}

}
