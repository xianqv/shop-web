<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=
 "com.food.bean.*,com.food.dao.*,
 java.util.*" %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="utf-8">
<title>caidan</title>
<link href="../css/manageadmin.css" rel="stylesheet" type="text/css" />
<jsp:include page="style.jsp" ></jsp:include>
</head>
<body>
 <div id="main" class="wrap">
  	<div  class="main">
		<h2>一级菜品列表</h2>
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
    <li class="click"><span><img src="../images/t01.png" /></span><a href="productClass-add.jsp">添加</a></li>
    </ul>
  </div>
  <table class="imgtable">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
      
        <th>一级菜品id</th>
        <th>一级菜品名称</th>
        
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
     <%
      FoodTypeDao dao = new FoodTypeDao();
      List<FoodTypeParent> list = dao.getFoodTypeParentList();
      for(FoodTypeParent f:list){
      		
      %>
      <tr height="50px">
        <td ><input name="" type="checkbox" value="" /></td>
        
         <td><%=f.getMeal_id() %></td>
         <td><%=f.getMeal_name() %></td>
       
        <td ><a href="<%=basePath%>AddClassServlet?meal_id=<%=f.getMeal_id()%>" class="tablelink" >在此菜种下添加二级菜种&nbsp;&nbsp;</a></td>
      </tr>
      <%} %>
    </tbody>
  </table>
  <div class="pagin">
    <div class="message">共<i class="blue">1</i>页，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
    <ul class="paginList">
      <li class="paginItem"><a href="javascript:;">首页</a></li>
      <li class="paginItem"><a href="javascript:;">上一页<span class="pagepre"></span></a></li>
      <li class="paginItem"><a href="javascript:;">下一页<span class="pagenxt"></span></a></li>
      <li class="paginItem"><a href="javascript:;">尾页</a></li>
    </ul>
  </div>
  </div>
  </div>
 
</div>
</body>
</html>
