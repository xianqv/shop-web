
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.food.bean.*,com.food.dao.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加商品类型</title>
<jsp:include page="style.jsp"></jsp:include>
<script type="text/javascript">
	check = function() {
		var cn = document.getElementById("className");
		if (cn.value == "") {
			var message = document.getElementById("msg");
			message.innerHTML = "商品类型不可以为空";
			message.className = "error";
			return false;
		}
		return true;
	}
</script>
</head>

<body>
	<div id="main" class="wrap">
		<div class="main">
			<h2>添加App首页 主页商品分类</h2>
			<div class="manage">
				<form action="ProductClassify_save.action" method="post">
					<table class="form">
						<tr>


							<tr>
								<td class="field">主页分类标题</td>
								<td><input type="text" class="text" name="productClassify.title"
									id="meal_name" /></td>
							</tr>

							<tr>
								<td class="field">设置字体颜色</td>
								<td><input type="color" class="text" name="productClassify.textColor"
									id="meal_name" /></td>
							</tr>


							
						<tr>
							<td><font style="color: #ff7300" id="ms">${mess }</font> <c:if
									test="${mess eq '一级菜种添加成功,正在返回...' }">
									<script type="text/javascript">
										setTimeout(
												"location.href='../BackManager/loadproducttype.do'",
												2000);
									</script>
								</c:if></td>
							<td><label class="ui-blue"> <input type="submit"
									name="submit" value="添加" /></label></td>
						</tr>
						</label>
						</form>
						</div>
						</div>
						<div class="clear"></div>
						</div>
</body>
</html>
