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
		<h2>主页轮播广告列表</h2>
<div class="rightinfo">
  
  <table class="imgtable">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
       	<th>图标</th>
        <th>描述</th>
        <th>链接地址</th>
        <th style="text-align:center">操作</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach var="advert" items="${advertlist }">
      <tr height="50px">
        <td ><input name="" type="checkbox" value="" /></td>
        <td><img src="http://localhost:8080/${advert.imageUrl }" width="80" height="50"/></td>
        
        <td style="text-align:center">${advert.des }</td>
        <td style="text-align:center">${advert.link }</td>
      
        
        <td style="text-align:center">
	       <a href="Advert_modify?advert.id=${advert.id }" class="tablelink">修改</a>
	              <a href="Advert_add.jsp" class="tablelink">添加</a>
	        <a href="Advert_delete.action?advert.id=${advert.id }" class="tablelink">删除</a>
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
