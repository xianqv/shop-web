package com.igou.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.igou.app.pojos.UserInfo;
import com.igou.service.UserInfoService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

public class UserInfoAction implements ServletRequestAware {
	private UserInfoService userInfoService;
	private UserInfo userinfo;
	private List<Object> userlist;
	private HttpServletRequest request;

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public UserInfo getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(UserInfo userinfo) {
		this.userinfo = userinfo;
	}

	public List<Object> getUserlist() {
		return userlist;
	}

	public void setUserlist(List<Object> userlist) {
		this.userlist = userlist;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}

	public String list() {
		userlist = userInfoService.getAll();
		ServletActionContext.getRequest().setAttribute("userlist", userlist);
		return Action.SUCCESS;
	}

	public String login() throws IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		ActionContext context = ActionContext.getContext();
		String name = request.getParameter("username");
		String pass = request.getParameter("userpass");
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		UserInfo user = (UserInfo) userInfoService.login(name, pass);
		JSONObject Message = new JSONObject();
		if (user != null) {
			Map session = context.getSession();
			session.put(user.getId(), user.getId());
			Message.put("id", user.getId());
			Message.put("name", user.getName());
			Message.put("pwd", user.getPwd());
			Message.put("phone", user.getPhone());
			Message.put("handImg", user.getHandImg());
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(Message.toString());
		response.getWriter().close();
		return null;
	}

	public String Logout() throws IOException {
		Integer id = Integer.parseInt(request.getParameter("user_id"));
		HttpServletResponse response = ServletActionContext.getResponse();
		ActionContext context = ActionContext.getContext();
		Map session = context.getSession();
		if (session.get(id) != null) {
			session.remove(id);
		}
		JSONObject object = new JSONObject();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(object.toString());
		response.getWriter().close();
		return null;
	}
	public String index(){
		return "index";
	}
	public String CMSlogin(){
		try {
			String name = request.getParameter("name");
			String pass = request.getParameter("pass");
			JSONObject object = new JSONObject();
			UserInfo userInfo = (UserInfo) userInfoService.login(name, pass);
			if (userInfo == null) {
				object.put("flag",0);
				object.put("msg", "该用户不存在，请重新登录！");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("LOGIN_NAME",userInfo);
				object.put("flag",1);
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(object.toString());
			response.getWriter().flush();
		}catch (Exception e){
			e.printStackTrace();
		}
		return "";
	}
	public String CMSLogout(){
		HttpServletRequest request1 = ServletActionContext.getRequest();
		HttpSession session = request1.getSession();
		session.setAttribute("LOGIN_NAME",null);
		return "init";
	}
	public String regist(){
		try {
			JSONObject object = userInfoService.regist(request);
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

}
