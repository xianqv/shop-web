package com.igou.service;

import java.util.List;

import com.igou.app.pojos.Cart;
import com.igou.dao.CartDao;

public class CartService {
	private CartDao cartDao;

	public CartDao getCartDao() {
		return cartDao;
	}

	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	public List<Object> findCartByProId(String proId) {
		// TODO Auto-generated method stub
		return cartDao.findByHQL("from Cart where proId = " + proId, null);
	}

	public boolean save(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.save(cart);
	}

	public boolean update(Cart cart) {
		// TODO Auto-generated method stub
		return cartDao.update(cart);
	}

	public List<Object> findAllByUserId(int userId) {
		// TODO Auto-generated method stub
		return cartDao.findByHQL("from Cart where userinfo_id=" + userId, null);
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		cartDao.delete(Cart.class, id);
	}

}
