<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>分类列表</title>
<link href="<%=basePath %>css/manageadmin.css" rel="stylesheet" type="text/css" />
<jsp:include page="style.jsp" ></jsp:include>
</head>
<body>
 <div id="main" class="wrap">
  	<div  class="main">
		<h2>分类列表</h2>
<div class="rightinfo">
  
  <table class="imgtable">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
       	<th>ID</th>
       	<th>标题</th>
        <th>字体颜色</th>
        <th style="text-align:center">操作</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach var="classify" items="${list }">
      <tr height="50px">
        <td ><input name="" type="checkbox" value="" /></td>
        <td style="text-align:center">${classify.id }</td>
        <td style="text-align:center">${classify.title }</td>
        <td style="text-align:center">${classify.textColor }</td>
      
        
        <td style="text-align:center">
	       <a href="ProductClassify_modify?productClassify.id=${classify.id }" class="tablelink">修改</a>
	              <a href="ProductClassify_add.jsp" class="tablelink">添加</a>
	        <a href="ProductClassify_prolist.action?productClassify.id=${classify.id }" class="tablelink">查看</a>
	        <a href="ProductClassify_delete.action?productClassify.id=${classify.id }" class="tablelink">删除</a>
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
