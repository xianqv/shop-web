package com.igou.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.igou.pojos.Product;
import com.igou.service.ProductService;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.igou.app.pojos.Order;
import com.igou.service.OrderService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport implements ServletRequestAware {
	private HttpServletRequest request;
	private OrderService orderService;
	private ProductService productService;
	private List<Order> orderlist;
	private Order order;

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public List<Order> getOrderlist() {
		return orderlist;
	}

	public void setOrderlist(List<Order> orderlist) {
		this.orderlist = orderlist;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String list() {
		orderlist = orderService.findAll();
		ServletActionContext.getRequest().setAttribute("orderlist", orderlist);
		return Action.SUCCESS;
	}

	public String check() {
		order = orderService.findOrderById(order.getId());
		ServletActionContext.getRequest().setAttribute("order", order);
		return Action.SUCCESS;
	}

	public String save() {
		try {
			boolean flag = orderService.save(order);
			if (flag) {
				return "check";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "list";
	}

	public String fahuoById() {
		try {
			Integer id = Integer.parseInt(request.getParameter("id"));
			String msg = orderService.update(id);
			JSONObject object = new JSONObject();
			object.put("msg", msg);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(object.toString());
			response.getWriter().flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String saveOrderInfo() {
		try {
			int userId = Integer.parseInt(request.getParameter("userId"));
			String userName = request.getParameter("userName");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String proName = request.getParameter("proName");
			String proSize = request.getParameter("proSize");
			String proColor = request.getParameter("proColor");

			double onePrice = Double.parseDouble(request
					.getParameter("onePrice"));
			int proNum = Integer.parseInt(request.getParameter("proNum")
					.substring(1).trim());
			double totalPrice = Double.parseDouble(request
					.getParameter("onePrice")) * proNum;
			String msg = request.getParameter("msg");
			String imgURL = request.getParameter("imgURL");
			Integer proId = Integer.parseInt(request.getParameter("proId"));
			Order order = new Order();
			order.setUserId(userId);
			order.setUserName(userName);
			order.setPhone(phone);
			order.setAddress(address);
			order.setProName(proName);
			order.setSize(proSize);
			order.setColor(proColor);
			order.setOnePrice(onePrice);
			order.setNum(proNum);
			order.setTotalPrice(totalPrice);
			order.setMsg(msg);
			order.setProId(proId);
			order.setImgURL(imgURL);
            SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHH");
            String c=sdf.format(new Date());
            int id = Integer.parseInt(c)+proId+new Random().nextInt(100);
            order.setId(id);
			boolean flag = orderService.save(order);
			JSONObject object = new JSONObject();
			if (flag) {
				Product product = (Product) productService.findProductById(order.getProId());
				product.setSaleNum(product.getSaleNum()+order.getNum());
				productService.update(product);
				object.put("success", "true");
				object.put("msg", "订单生成成功");
			} else {
				object.put("success", "false");
				object.put("msg", "订单生成失败");
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			System.out.println(object.toString() + "..");
			response.getWriter().write(object.toString());
			response.getWriter().flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getOrderListById() {
		try {
			int userid = Integer.parseInt(request.getParameter("userId"));
			List<Order> orders = orderService.findOrderByUserId(userid);
			JSONObject object = new JSONObject();
			object.put("orders", orders);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			System.out.println(object.toString() + "..");
			response.getWriter().write(object.toString());
			response.getWriter().flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	public String deleteByOrderId(){
        try {
            String orderId = request.getParameter("orderId");
            JSONObject object = orderService.delete(orderId);
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write(object.toString());
            response.getWriter().flush();
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    public String updateStstusByOrderId(){
        try {
            String orderId = request.getParameter("orderId");
            String status = request.getParameter("status");
            JSONObject object = orderService.updateStstus(orderId,status);
            HttpServletResponse response = ServletActionContext.getResponse();
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write(object.toString());
            response.getWriter().flush();
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}

}
