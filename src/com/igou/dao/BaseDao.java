package com.igou.dao;

import java.util.List;

import com.igou.pojos.Product;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;

public class BaseDao extends HibernateDaoSupport {
	public boolean save(Object object) {
		try {
			this.getHibernateTemplate().save(object);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean update(Object object) {
		try {
			// this.getHibernateTemplate().clear();
			this.getHibernateTemplate().update(object);
			// this.getHibernateTemplate().flush();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public void delete(Class clazz, int id) {
		this.getHibernateTemplate().delete(
				this.getHibernateTemplate().get(clazz, id));
	}

	public List<Object> getAll(String HQL) {
		return findByHQL(HQL, null);
	}

	public List<Object> findByHQL(String hql, Object[] params) {
		return (List<Object>) this.getHibernateTemplate().find(hql, params);
	}

	public Object findById(Class clazz, int id) {
		return this.getHibernateTemplate().get(clazz, id);
	}

	public Object getUserByUAndP(String username, String password) {
		// TODO Auto-generated method stub
		List<Object> userList = (List<Object>) this.getHibernateTemplate()
				.find("from UserInfo where name=? and pwd=?",
						new Object[] { username, password });
		if (userList.size() == 0) {
			return null;
		} else {
			return userList.get(0);
		}
	}

}
