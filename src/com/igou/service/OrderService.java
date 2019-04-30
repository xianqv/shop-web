package com.igou.service;

import java.util.ArrayList;
import java.util.List;

import com.igou.app.pojos.Order;
import com.igou.dao.OrderDao;
import com.sun.org.apache.xpath.internal.operations.Or;
import net.sf.json.JSONObject;

public class OrderService {
	private OrderDao orderDao;

	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public boolean save(Order order) {
		// TODO Auto-generated method stub
		return orderDao.save(order);
	}

	public List<Order> findOrderByUserId(int userid) {
		// TODO Auto-generated method stub
		List<Object> list = orderDao.findByHQL("from Order where userId="
				+ userid, null);
		Order order = null;
		List<Order> orders = new ArrayList<Order>();
		for (Object obj : list) {
			order = (Order) obj;
			orders.add(order);
		}
		return orders;

	}

	public List<Order> findAll() {
		// TODO Auto-generated method stub
		List<Object> list = orderDao.getAll("from Order");
		Order order = null;
		List<Order> orders = new ArrayList<Order>();
		for (Object obj : list) {
			order = (Order) obj;
			orders.add(order);
		}
		return orders;
	}

	public Order findOrderById(Integer id) {
		// TODO Auto-generated method stub
		return (Order) orderDao.findById(Order.class, id);
	}

	public String update(Integer id) {
		// TODO Auto-generated method stub
		Order order = (Order) orderDao.findById(Order.class, id);
		if (order != null) {
			if (order.getIsDeliver() >= 1) {
				return "该商品已经发货，无法再次发货！";
			}
			order.setIsDeliver(1);
			if (orderDao.update(order)) {
				return "该商品发货成功！！！";
			} else {
				return "该商品发货失败！！！";
			}
		}
		return "该商品不存在！！！";

	}


	public JSONObject delete(String orderId) {
		JSONObject jsonObject = new JSONObject();
		try {
			if (orderId == null || orderId.equals("")){
				jsonObject.put("success",0);
				jsonObject.put("msg","订单号不能为空！");
				return jsonObject;
			}
				orderDao.delete(Order.class, Integer.parseInt(orderId));
				jsonObject.put("success",1);
				jsonObject.put("msg","订单删除成功！");
		}catch (Exception e){
				jsonObject.put("success",0);
				jsonObject.put("msg","订单号不存在！");
				e.printStackTrace();
				return jsonObject;
		}
				return jsonObject;
	}


	public JSONObject updateStstus(String orderId, String status) {
		JSONObject jsonObject = new JSONObject();
		try {
			if (orderId == null || orderId.equals("") || status == null || status.equals("")){
				jsonObject.put("success",0);
				jsonObject.put("msg","数据异常！");
				return jsonObject;
			}
			Order order = (Order) orderDao.findById(Order.class,Integer.parseInt(orderId));
			int st =Integer.parseInt(status);
			if(st == -1){
				order.setIsDeliver(st);
				order.setIsDeal(0);
			}
			order.setIsDeliver(st);
			orderDao.update(order);
			jsonObject.put("success",1);
		}catch (Exception e){
			jsonObject.put("success",0);
			jsonObject.put("msg","数据异常！");
			e.printStackTrace();
			return jsonObject;
		}
		return jsonObject;
	}
}
