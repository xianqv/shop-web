<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="com.food.bean.*,com.food.dao.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta charset="utf-8">
<title>删除一级分类</title>
<link href="<%=basePath %>css/manageadmin.css" rel="stylesheet" type="text/css" />
 <jsp:include page="style.jsp" ></jsp:include>
</head>
<body>
 <div id="main" class="wrap">
  	<div  class="main"> 
		
<div class="rightinfo">
  <div class="tools">
   
  </div>
  <table class="imgtable">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
        <th >&nbsp;&nbsp;一级菜种ID</th>
         <th >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一级菜种名称</th>
         <th align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</th>
         
  
      </tr>
    </thead>
    <tbody>
    
    <% 
       FoodTypeDao dao = new  FoodTypeDao();
    	List<FoodTypeParent> list = dao.getFoodTypeParentList();
       for(FoodTypeParent f:list){
       
       %>
    
   
      <tr height="50px">
        <td ><input name="" type="checkbox" value="" /></td>
         <td align="center"><%=f.getMeal_id() %></td>
        <td align="center"><%=f.getMeal_name() %></td>
          <td>&nbsp;&nbsp;<a href="<%=basePath %>DeleteFoodTypeParentServlet?meal_id=<%=f.getMeal_id() %>" class="tablelink">删除&nbsp;&nbsp;</a></td>
       
        
      </tr>
      
      
     <%} %>
      
    </tbody>
  </table>
  <div class="pagin">
    
     <div class="message">共<i class="blue">1</i>页，当前显示第&nbsp;<i class="blue">1&nbsp;</i>页</div>
    <ul class="paginList">
      <li class="paginItem"><a href="#">首页</a></li>
    <!--   <c:if test="${FoodTypePageBean.hasPreviousPage }">
      		<li class="paginItem"><a href="productClass-delete.jsp?pageNO=${FoodTypePageBean.pageNO-1 }">上一页<span class="pagepre"></span></a></li>
      </c:if>
      <c:if test="${FoodTypePageBean.hasNextPage }">
     		<li class="paginItem"><a href="productClass-delete.jsp?pageNO=${FoodTypePageBean.pageNO+1 }">下一页<span class="pagenxt"></span></a></li>
      </c:if> -->
       <li class="paginItem"><a href="#">尾页</a></li>
    </ul>
    
      </div>
  </div>
  </div>
 
</div>
</body>
</html>
