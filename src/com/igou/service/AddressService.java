package com.igou.service;

import java.util.List;

import com.igou.app.pojos.Address;
import com.igou.dao.AddressDao;

public class AddressService {
	private AddressDao addressDao;

	public AddressDao getAddressDao() {
		return addressDao;
	}

	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}

	public void update(Address address) {
		// TODO Auto-generated method stub
		addressDao.update(address);
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		addressDao.delete(Address.class, id);
	}

	public boolean updateById(Address address) {
		// TODO Auto-generated method stub
		return addressDao.update(address);
	}

	public boolean save(Address address) {
		// TODO Auto-generated method stub
		return addressDao.save(address);
	}

	public List<Object> findAddressById(int userId) {
		// TODO Auto-generated method stub
		return addressDao.findByHQL("from Address where userinfo_id=" + userId
				+ "and isDefault=" + "1", null);
	}

}
