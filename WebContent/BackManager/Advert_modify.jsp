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
  <title>修改信息</title>
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
		<h2>添加App首页 功能按钮</h2>
		<div class="manage">
		<table class="form">
			<form action="Advert_update.action" enctype="multipart/form-data" method="post">
					
					
					<input type="hidden" name="advert.id" value="${advert.id }"/>
					</tr>
						<td class="field">修改转跳链接</td>
						<td><input type="text" class="text" name="advert.link" id="meal_name" value="${advert.link }"/></td>
					</tr>
					
					
					<tr>
						<td class="field">修改描述</td>
						<td><input type="text tiny" class="text" name="advert.des" id="meal_name" value="${advert.des }"/></td>
					</tr>
					<tr>
					
						<td class="field">上传按钮图标</td>
						<td><input type="file" name="Brandimage"/></td>
					</tr>
					
					<tr>
					<td><label class="ui-blue">
						<input type="submit" name="submit" value="修改" /></label>
					</td>
					
					
					
					
					
					</form>
				</table>
			
		</div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
