<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>企业列表</title>
<link href="<%=basePath %>css/manageadmin.css" rel="stylesheet" type="text/css" />
<jsp:include page="style.jsp" ></jsp:include>
</head>
<body>
 <div id="main" class="wrap">
  	<div  class="main">
		<h2>菜品列表</h2>
<div class="rightinfo">
  
  <table class="imgtable">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
       	<th>图标</th>
        <th>名称</th>
        <th>链接地址</th>
        <th style="text-align:center">操作</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach var="button" items="${buttonlist }">
      <tr height="50px">
        <td ><input name="" type="checkbox" value="" /></td>
        <td><img src="http://localhost:8080/${button.imageUrl }" width="80" height="50"/></td>
        
        <td style="text-align:center">${button.name }</td>
        <td style="text-align:center">${button.jumpUrl }</td>
      
        
        <td style="text-align:center">
	       <a href="FunctionButton_modify?button.id=${button.id }" class="tablelink">修改</a>
	              <a href="FunctionButton_add.jsp" class="tablelink">添加</a>
	        <a href="FunctionButton_delete.action?button.id=${button.id }" class="tablelink">删除</a>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  
  </div>
  </div>
 
</div>
</body>
</html>
