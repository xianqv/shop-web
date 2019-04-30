package com.igou.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.igou.app.pojos.Cart;
import com.igou.pojos.Product;
import com.igou.service.CartService;
import com.igou.service.ProductService;
import com.igou.service.UserInfoService;

public class CartAction implements ServletRequestAware {
	private CartService cartService;
	private HttpServletRequest request;
	private ProductService productService;
	private UserInfoService userInfoService;
	private Cart cart;
	private List<Cart> carts;

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public List<Cart> getCarts() {
		return carts;
	}

	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}

	public CartService getCartService() {
		return cartService;
	}

	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public String addProduct() {
		try {
			String color = request.getParameter("color");
			String size = request.getParameter("size");
			int num = Integer.parseInt(request.getParameter("num"));
			int userId = Integer.parseInt(request.getParameter("userId"));
			String proId = request.getParameter("proId");

			boolean flag = false;
			JSONObject object = new JSONObject();
			System.out.print("1");
			List<Object> list = cartService.findCartByProId(proId);

			if (list.size() > 0 && list != null) {
				cart = (Cart) list.get(0);
				if (cart != null) {
					if (cart.getColor().equals(color)
							&& cart.getSize().equals(size)
							&& cart.getUserId() == userId) {
						int proNum = cart.getNum();
						cart.setNum(proNum + num);
						flag = cartService.update(cart);
					} else {
						cart.setColor(color);
						cart.setNum(num);
						cart.setProId(Integer.parseInt(proId));
						cart.setSize(size);
						cart.setUserId(userId);
						cart.setTotalPrice(0);
						cart.setUserinfo_id(userId);
						flag = cartService.save(cart);
					}
				}
			} else {
				Cart car = new Cart();
				car.setColor(color);
				car.setNum(num);
				car.setProId(Integer.parseInt(proId));
				car.setSize(size);
				car.setUserinfo_id(userId);
				car.setUserId(userId);
				car.setTotalPrice(0);
				flag = cartService.save(car);
			}
			System.out.print("3");
			if (flag) {
				object.put("success", "true");
				object.put("msg", "成功添加到购物车");

			} else {
				object.put("success", "false");
				object.put("msg", "添加购物车失败");
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

	public String findAllCarts() {
		try {
			int userId = Integer.parseInt(request.getParameter("userId"));

			List<Object> carts = cartService.findAllByUserId(userId);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig
					.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			JSONObject object = new JSONObject();

			Integer id = null;
			String name = null;
			double price = 0;
			String imgUrl = null;
			Product pro = null;
			if (carts != null && carts.size() > 0) {
				for (Object obj : carts) {
					Cart cart = (Cart) obj;
					Product product = (Product) productService
							.findProductById(cart.getProId());
					id = product.getId();
					name = product.getName();
					price = product.getPrice();
					imgUrl = product.getImgUrl();
					pro = new Product();
					pro.setId(id);
					pro.setName(name);
					pro.setPrice(price);
					pro.setImgUrl(imgUrl);
					cart.setProduct(pro);
				}
				object.put("success", "true");
				object.put("carts", carts);

			} else {
				object.put("success", "false");
				// json = JSONObject.fromObject("", jsonConfig);
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

	public String deleteById() {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			cartService.delete(id);
			JSONObject object = new JSONObject();
			object.put("error", "true");
			object.put("Msg", "删除成功！");
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

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}

}
