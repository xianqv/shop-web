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
       	<th>图片</th>
        <th>名&nbsp;称&nbsp;&nbsp;</th>
        <th>价&nbsp;格&nbsp;&nbsp;</th>
        <th>品&nbsp;牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
        <th>型号</th>
        <th>类&nbsp;型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
        <th>产&nbsp;地</th>
        <th>规格</th>
       	<th>上&nbsp;&nbsp;市&nbsp;&nbsp;时&nbsp;&nbsp;间</th>
        <th style="text-align:center">操&nbsp;作&nbsp;&nbsp;&nbsp;</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach var="product" items="${productList }">
      <tr height="50px">
        <td ><input name="" type="checkbox" value="" /></td>
        <td><img src="http://localhost:8080/${product.imgUrl }" width="80" height="50"/></td>
        <td style="text-align:center">${product.name.substring(0, 5) }.....</td>
        <td style="text-align:center">${product.price }元</td>
        <td style="text-align:center">${product.brands.name }</td>
        <td style="text-align:center">${product.model }</td>
        <td style="text-align:center">&nbsp;${product.type.name }</td>
        <td style="text-align:center">${product.address }</td>
        <td style="align:left">
        	<select>
        	<c:forEach var="size" items="${product.getSizes() }">
        		<option >${size.name} ${size.show()  }</option>
        	</c:forEach>
        	</select>
        </td>
        <td style="text-align:center">${product.marketDate }</td>
        <td >
	       <a href="Product_modify?product.id=${product.id }" class="tablelink">修改</a>
	              <a href="Size_add?product.id=${product.id }" class="tablelink">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;添加</a>
	        <a href="Product_delete.action?product.id=${product.id }" class="tablelink"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;删除</a>
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
