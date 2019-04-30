package com.igou.service;

import java.util.List;
import java.util.Map;

import com.igou.app.pojos.UserInfo;
import com.igou.dao.UserInfoDao;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;

public class UserInfoService {
	private UserInfoDao userInfoDao;

	public UserInfoDao getUserInfoDao() {
		return userInfoDao;
	}

	public void setUserInfoDao(UserInfoDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}

	public List<Object> getAll() {
		// TODO Auto-generated method stub
		return userInfoDao.getAll("from UserInfo");
	}

	public Object login(String name, String pass) {
		// TODO Auto-generated method stub
		return userInfoDao.getUserByUAndP(name, pass);
	}

	public Object findUserById(Integer id) {
		return userInfoDao.findById(UserInfo.class, id);
	}

	public JSONObject regist(HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		try {
			String userName = request.getParameter("userName");
			String userPass = request.getParameter("userPass");
			String userPhone = request.getParameter("phone");
			if ((userName == null|| userName.equals("") )&&(userPass == null|| userPass.equals("") )&&(userPhone == null|| userPhone.equals("") )){
				jsonObject.put("success",0);
				jsonObject.put("msg","请完善注册信息!");
				return jsonObject;
			}
//			userInfoDao.findByHQL("from UserInfo where name='"+userName+"'",null);
//			List<Object> list = userInfoDao.findByHQL("from UserInfo where name ="+userName,null);
//			if (list != null && list.size() >= 1){
//				jsonObject.put("success",0);
//				jsonObject.put("msg","该用户已存在!");
//				return jsonObject;
//			}
			UserInfo userInfo = new UserInfo();
			userInfo.setName(userName);
			userInfo.setPhone(userPhone);
			userInfo.setPwd(userPass);
			boolean flag = userInfoDao.save(userInfo);
			if (flag){
				jsonObject.put("success",1);
				jsonObject.put("msg","注册成功");

			}else {
				jsonObject.put("success",1);
				jsonObject.put("msg","请完善注册信息!");
			}
			return jsonObject;
		}catch (Exception e){
			e.printStackTrace();
			jsonObject.put("success",0);
			jsonObject.put("msg","系统异常!");
			return jsonObject;
		}
	}
}
