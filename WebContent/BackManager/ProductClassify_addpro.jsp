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
		<h2>添加商品</h2>
<div class="rightinfo">
 <form action="ProductClassify_addmore.action?productClassify.id=${productClassify.id }" method="post">
  
  <table class="imgtable">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
       	<th>ID</th>
       	<th>名称</th>
        <th>品牌</th>
        <th>类型</th>
        <th>价格</th>
        <th style="text-align:center">操作</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach var="product" items="${productlist }">
     	
      <tr height="50px">
        <td ><input name="proids" type="checkbox" value="${product.id }" /></td>
        <td style="text-align:center">${product.id }</td>
        <td style="text-align:center">${product.name }</td>
        <td style="text-align:center">${product.getBrands().name }</td>
      	<td style="text-align:center">${product.getType().name }</td>
      	<td style="text-align:center">${product.price }</td>
        
        <td style="text-align:center">
        <input  type="hidden" name="productClassify.id" value="${productClassify.id }"/>
	        <a href="ProductClassify_add.action?product.id=${product.id }&productClassify.id=${productClassify.id }" class="tablelink">添加</a>
        </td>
      </tr>
      </c:forEach>
    </tbody>  
  </table> 
   <tr>
     <td><label class="ui-blue"> <input type="submit" name="submit" value="添加" />
     	</label>
     </td>
     </tr>
  </form>
  </div>
  </div>
 
</div>
</body>
</html>
