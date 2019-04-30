package com.igou.action;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.igou.app.pojos.Address;
import com.igou.app.pojos.UserInfo;
import com.igou.service.AddressService;
import com.igou.service.UserInfoService;

public class AddressAction implements ServletRequestAware {
	private AddressService addressService;
	private UserInfoService userInfoService;
	private Address address;
	private UserInfo userinfo;
	private List<Object> addresslist;
	private HttpServletRequest request;

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public UserInfo getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(UserInfo userinfo) {
		this.userinfo = userinfo;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public AddressService getAddressService() {
		return addressService;
	}

	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Object> getAddresslist() {
		return addresslist;
	}

	public void setAddresslist(List<Object> addresslist) {
		this.addresslist = addresslist;
	}

	public String findListById() throws IOException {
		Integer id = Integer.parseInt(request.getParameter("user_id"));
		UserInfo user = new UserInfo();
		userinfo = (UserInfo) userInfoService.findUserById(id);
		user.setAddress(userinfo.getAddress());
		JSONObject object = new JSONObject();
		object.put("address", userinfo.getAddress());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		System.out.println(object.toString() + "..");
		response.getWriter().write(object.toString());
		response.getWriter().flush();
		// .close();
		return null;
	}

	public String changeDefaultAddress() {
		try {
			int id = Integer.parseInt(request.getParameter("address_id"));
			int userId = Integer.parseInt(request.getParameter("user_id"));
			userinfo = (UserInfo) userInfoService.findUserById(userId);
			Set<Address> addresss = userinfo.getAddress();
			for (Address add : addresss) {
				if (add.getId() == id) {
					add.setIsDefault(1);
				} else {
					add.setIsDefault(0);
				}
				addressService.update(add);
			}

			JSONObject object = new JSONObject();
			object.put("address", addresss);
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

	public String DeleteAddressById() {
		try {
			int id = Integer.parseInt(request.getParameter("address_id"));
			int userId = Integer.parseInt(request.getParameter("user_id"));
			addressService.delete(id);
			userinfo = (UserInfo) userInfoService.findUserById(userId);
			Set<Address> addresss = userinfo.getAddress();
			JSONObject object = new JSONObject();
			object.put("address", addresss);
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

	public String UpdateAddress() {
		try {

			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String postalcode = request.getParameter("postalcode");
			String addressdetail = request.getParameter("address");
			int userId = Integer.parseInt(request.getParameter("userinfoId"));
			// int isdef =
			int isdef = Integer.parseInt(request.getParameter("isDef"));
			Address address = new Address();
			address.setId(id);
			address.setDetail(addressdetail);
			address.setPhone(phone);
			address.setName(name);
			address.setPostalcode(postalcode);
			address.setUserinfoid(userId);
			address.setIsDefault(isdef);

			boolean flag = addressService.updateById(address);
			JSONObject object = new JSONObject();
			if (flag) {
				object.put("success", "true");
			} else {
				object.put("success", "false");
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

	public String AddAddress() {
		try {
			int userId = Integer.parseInt(request.getParameter("userId"));
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String postalcode = request.getParameter("postalcode");
			String addressdetail = request.getParameter("address");
			Address address = new Address();
			address.setUserinfoid(userId);
			address.setDetail(addressdetail);
			address.setPhone(phone);
			address.setName(name);
			address.setPostalcode(postalcode);
			address.setIsDefault(0);
			boolean flag = addressService.save(address);
			JSONObject object = new JSONObject();
			if (flag) {
				object.put("success", "true");
			} else {
				object.put("success", "false");
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

	public String findAddressByUserId() {
		try {
			int userId = Integer.parseInt(request.getParameter("userId"));
			List<Object> list = addressService.findAddressById(userId);
			Address address = null;
			JSONObject object = new JSONObject();
			if (list != null && list.size() > 0) {
				address = (Address) list.get(0);
				object.put("success", "true");
				object.put("address", address);
			} else {
				object.put("success", "false");
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

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}


}
