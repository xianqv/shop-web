<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.food.bean.*,com.food.dao.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="FoodTypePageBean" class="com.food.bean.FoodTypePageBean" ></jsp:useBean>
<jsp:setProperty property="pageNO" name="FoodTypePageBean"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <title>添加商品类型</title>
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
		<h2>添加分类</h2>
		<div class="manage">
			<form action="<%=basePath %>ErTypeServlet" method="post">
				<table class="form">
					<tr>
						<!--<td class="field">菜品父分类：</td>
						<td>
							<select name="parentId">
								<option value="0" selected="selected">--请添加--</option>
							<%--  <c:forEach items="${ptps }" var="item">
									<option value="123">${item.epp_name }</option>
								</c:forEach>--%>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最多增加5个子分类，建议增加3个
						</td>
					</tr><br><br>!-->
					<c:forEach var="f" items="${FoodTypePageBean.pageData}">
					<tr>
					<td class="field">一级分类id：</td><td><input type="text" name="meal_id" id="meal_id" value="${requestScope.food.meal_id }" /></td></tr>
						<tr><td class="field">一级分类名称：</td><td>${requestScope.food.meal_name }</td>
						
					</tr>
					<%-- 
					<tr>
					<td class="field">二级分类id：</td>
					<td><input type="text" class="text" name="sm_id" id="sm_id"/><span id="msg"></span></td>
					</tr>
					--%>
					<tr>
						<td class="field">二级分类名称：</td>
						<td><input type="text" class="text" name="sm_name" id="sm_name"/><span id="msg"></span></td>
					</tr>
					</c:forEach>
					<tr>
						<td>
						<font style="color:#ff7300" id="ms">${mess }</font>
						<c:if test="${mess eq '商品二级分类添加成功,正在返回...' }">
							<script type="text/javascript">
								setTimeout("location.href='../BackManager/loadproducttype.do'", 2000);
							</script>
						</c:if>
						</td>
						<td><label class="ui-blue">
						<input type="submit" name="submit" value="添加" /></label></td>
					</tr>
				</label>
			</form>
		</div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
