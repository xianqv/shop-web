package com.igou.service;

import java.util.List;

import com.igou.app.pojos.Advert;
import com.igou.dao.AdvertDao;

public class AdvertService {
	private AdvertDao advertDao;

	public AdvertDao getAdvertDao() {
		return advertDao;
	}

	public void setAdvertDao(AdvertDao advertDao) {
		this.advertDao = advertDao;
	}

	public void save(Advert advert) {
		// TODO Auto-generated method stub
		advertDao.save(advert);
	}

	public List<Object> findAll() {
		// TODO Auto-generated method stub
		return advertDao.getAll("from Advert");
	}

	public void delete(Integer id) {
		// TODO Auto-generated method stub
		advertDao.delete(Advert.class, id);
	}

	public Object findAdvertById(Integer id) {
		// TODO Auto-generated method stub
		return advertDao.findById(Advert.class, id);
	}

	public void update(Advert advert) {
		// TODO Auto-generated method stub
		advertDao.update(advert);
	}

}
