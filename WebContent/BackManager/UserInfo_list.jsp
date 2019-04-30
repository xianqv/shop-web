<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="utf-8">
<title>用户列表</title>
<link href="../css/manageadmin.css" rel="stylesheet" type="text/css" />
<jsp:include page="style.jsp" ></jsp:include>
</head>
<body>
 <div id="main" class="wrap">
  	<div  class="main">
		<h2 style="width: 130%">用户列表</h2>
<div class="rightinfo">
  <div class="tools">
   <!--  <ul class="toolbar">
    </ul>-->
   
  </div>
  <table class="imgtable" style="width: 130%">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
      
        <th>ID</th>
        <th>姓名</th>
        <th>联系电话</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach var="user" items="${userlist }">
      <tr height="50px">
        <td ><input name="" type="checkbox" value="" /></td>
        <td style="text-align:center">${user.id }</td>
      	<td style="text-align:center">${user.name }</td>
      	<td style="text-align:center">${user.phone }</td>
        <td style="text-align:center"><a href="ProductClassify_modify?productClassify.id=${classify.id }" class="tablelink">查看订单</a></td>
      </tr>
      
      </c:forEach>
    </tbody>
  </table>
  
  </div>
  </div>
 
</div>
</body>
</html>
