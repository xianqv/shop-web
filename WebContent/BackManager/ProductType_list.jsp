<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta charset="utf-8">
<title>分类管理</title>
<link href="<%=basePath%>css/manageadmin.css" rel="stylesheet"
	type="text/css" />
<jsp:include page="style.jsp"></jsp:include>
</head>
<body>
	<div id="main" class="wrap">
		<div class="main">
			<h2>分类管理</h2>
			<div class="rightinfo">
				<div class="tools">
					<ul class="toolbar">
						<li class="click"><span><img
								src="<%=basePath%>images/lgoinclose.png" /></span><a
							href="productClass-delete.jsp">删除</a></li>
						<li class="click"><span><img
								src="<%=basePath%>images/t01.png" /></span><a
							href="productClass-add.jsp">添加</a></li>

					</ul>
					
				</div>
				<table class="imgtable">
					<thead>
						<tr>
							<th><input name="" type="checkbox" value=""
								checked="checked" /></th>
							<th align="center">类型ID</th>
							<th align="center">类型名称</th>
							<th align="center">产品列表</th>
							<th align="center">操作</th>
						</tr>
					</thead>
					<tbody>



						<c:forEach var="type" items="${typeList}">
							<tr height="50px">
								<td><input name="" type="checkbox" value="" /></td>
								<td align="center">${type.id }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td align="center">${type.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><select>
									<c:forEach var="product" items="${type.getProducts() }">
										<option value="${product.id }">${product.name }</option>
									</c:forEach>
								</select>
								</td>
								<td align="center"><a href="ProductType_delete.action" class="tablelink">删除&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
							</tr>


						</c:forEach>

					</tbody>
				</table>
				在select中选中某个类型的商品后点击后面删除按钮进行对指定商品的删除
			</div>
		</div>

	</div>
</body>
</html>