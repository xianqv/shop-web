package com.igou.service;

import java.util.List;

import com.igou.dao.BrandDao;
import com.igou.pojos.Brand;

public class BrandService {
	private BrandDao brandDao;

	public BrandDao getBrandDao() {
		return brandDao;
	}

	public void setBrandDao(BrandDao brandDao) {
		this.brandDao = brandDao;
	}

	public void save(Brand brand) {
		// TODO Auto-generated method stub
		brandDao.save(brand);
	}

	public List<Object> findAll() {
		// TODO Auto-generated method stub

		return brandDao.getAll("from Brand");
	}

	public Object findBrandById(Integer id) {
		// TODO Auto-generated method stub
		return brandDao.findById(Brand.class, id);
	}

}
