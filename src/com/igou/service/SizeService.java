package com.igou.service;

import com.igou.dao.SizeDao;
import com.igou.pojos.Size;

public class SizeService {
	private SizeDao sizeDao;

	public SizeDao getSizeDao() {
		return sizeDao;
	}

	public void setSizeDao(SizeDao sizeDao) {
		this.sizeDao = sizeDao;
	}

	public void save(Size size) {
		// TODO Auto-generated method stub
		sizeDao.save(size);
	}

	public Object findSizeById(Integer id) {
		// TODO Auto-generated method stub
		return sizeDao.findById(Size.class, id);
	}

	public void update(Size size) {
		// TODO Auto-generated method stub
		sizeDao.update(size);
	}

}
