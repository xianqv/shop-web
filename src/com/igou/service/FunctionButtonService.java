package com.igou.service;

import java.util.List;

import com.igou.app.pojos.FunctionButton;
import com.igou.dao.FunctionButtonDao;

public class FunctionButtonService {
	private FunctionButtonDao FunctionButtonDao;

	public FunctionButtonDao getFunctionButtonDao() {
		return FunctionButtonDao;
	}

	public void setFunctionButtonDao(FunctionButtonDao functionButtonDao) {
		FunctionButtonDao = functionButtonDao;
	}

	public void save(FunctionButton button) {
		// TODO Auto-generated method stub
		FunctionButtonDao.save(button);
	}

	public List<Object> getAll() {
		// TODO Auto-generated method stub
		return FunctionButtonDao.getAll("from FunctionButton");
	}

	public Object findButtonById(int id) {
		// TODO Auto-generated method stub
		return FunctionButtonDao.findById(FunctionButton.class, id);
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		FunctionButtonDao.delete(FunctionButton.class, id);
	}

	public void update(FunctionButton button) {
		// TODO Auto-generated method stub
		FunctionButtonDao.update(button);
	}

}
