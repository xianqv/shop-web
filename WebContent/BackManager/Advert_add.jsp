		 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
		 <%@page import="com.food.bean.*,com.food.dao.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <title>添加首页广告</title>
  <jsp:include page="style.jsp" ></jsp:include>
  <script type="text/javascript">
  	check =function(){
  		var cn = document.getElementById("className");
  		if(cn.value == ""){
  			var message = document.getElementById("msg");
  			message.innerHTML="商品类型不可以为空";
  			message.className="error";
  			return false;
  		}
  		return true;
  	}
  </script>
  </head>
  
  <body>
  <div id="main" class="wrap">
  	<div class="main">
		<h2>添加App首页 广告轮播</h2>
		<div class="manage">
			<form action="Advert_save.action" enctype="multipart/form-data" method="post">
				<table class="form">
					
						
					
					<tr>
						<td class="field">输入网页转跳链接</td>
						<td><input type="text" class="text" name="advert.link" id="meal_name"/></td>
					</tr>
					
					<tr>
						<td class="field">输入广告描述</td>
						<td><input type="text" class="text" name="advert.des" id="meal_name"/></td>
					</tr>
					
					<tr>
						<td class="field">上传广告图片</td>
						<td><input type="file" name="Brandimage"/></td>
					</tr>
					
					<tr>
						<td><label class="ui-blue">
						<input type="submit" name="submit" value="添加" /></label>
						</td>
					</tr>
				</label>
			</form>
		</div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
