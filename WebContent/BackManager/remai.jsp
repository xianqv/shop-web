<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=
 "com.food.bean.*,com.food.dao.*,
 java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>..</title>
<link href="../css/manageadmin.css" rel="stylesheet" type="text/css" />
<jsp:include page="style.jsp" ></jsp:include>
</head>
<body>
 <div id="main" class="wrap">
  	<div  class="main">
		<h2>热卖推荐列表</h2>
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
     <li class="click"><span><img src="../images/t01.png" /></span><a href="../AddProductServlet?type=select">添加</a></li>
      
      <li><span><img src="../images/t03.png" /></span><a href="#">删除</a></li>
    </ul>
   
  </div>
  <table class="imgtable">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>菜品ID</th>
        <th>菜品名称</th>
        <th>菜品材料</th>
        <th>菜品价格</th>
        <th>销售数量</th>
        <th>菜品图片</th>
     
      </tr>
    </thead>
    <tbody>
     <%
      ProductDao dao = new ProductDao();
      List<Product> list = dao.getProductList();
      for(Product p:list){
      		if(p.getFood_salTotalNum()>100){
      %>
      <tr height="50px">
        <td ><input name="" type="checkbox" value="" /></td>
        
        <td><%=p.getFood_id() %></td>
        <td><%=p.getFood_name() %></td>
        <td><%=p.getFood_material() %></td>
        <td><%=p.getFood_price() %></td>
        <td><%=p.getFood_salTotalNum() %></td>
        <td><%=p.getFood_pic() %></td>
      
      </tr>
      <%}} %>
    </tbody>
  </table>
  <div class="pagin">
    <div class="message">共<i class="blue">1</i>页，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
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
