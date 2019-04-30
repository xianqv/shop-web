<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.food.bean.OrderPageBean,com.food.dao.SystemDAOImpl,java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="OrderPageBean" class="com.food.bean.OrderPageBean" ></jsp:useBean>
<jsp:setProperty property="pageNO" name="OrderPageBean"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <link href="<%=basePath %>css/manageadmin.css" rel="stylesheet" type="text/css" />

  <jsp:include page="style.jsp" ></jsp:include>
  </head>
  
  <body>
  <div id="main" class="wrap">
  	<div class="main">
		<h2>订单管理</h2>
		<div class="manage">
			<div class="search">
				
			</div>
			<div class="spacer"></div>

	<table class="imgtable">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>用户ID</th>
        <th>订单号</th>   
        <th>订单状态</th>   
        <th>订单金额(元)</th>
        <th>订单日期</th>      
       <th>操作</th>
      </tr>
    </thead>
     <tbody>
    <c:forEach var="ord" items="${OrderPageBean.pageData }">
      <tr height="50px">
        <td ><input name="" type="checkbox" value="" /></td>
        <td>${ord.userId }</td>
        <td>${ord.orderId}</td>
        <td>${ord.orderState }</td>
        <td>${ord.orderprice }</td>
        <td>${ord.orderDate }</td>
        
        <td >
        <c:if test="${ord.orderState} eq '已发货'">
        <a href="#" class="tablelink">发货</a> &nbsp;&nbsp;
        </c:if>
        	
	        <a href="<%=basePath %>ModifyOrderInfoServlet?id=${ord.orderId }" class="tablelink">发货</a> &nbsp;&nbsp;
	        <a href="<%=basePath %>DeleteOrderServlet?id=${ord.orderId }" class="tablelink"> 删除 </a>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
			
  <div class="pagin">
    <div class="message">共<i class="blue">${OrderPageBean.totalPages }</i>页，当前显示第&nbsp;<i class="blue">${OrderPageBean.pageNO }&nbsp;</i>页</div>
    <ul class="paginList">
      <li class="paginItem"><a href="order.jsp?pageNO=1">首页</a></li>
      <c:if test="${OrderPageBean.hasPreviousPage }">
      		<li class="paginItem"><a href="order.jsp?pageNO=${OrderPageBean.pageNO-1 }">上一页<span class="pagepre"></span></a></li>
      </c:if>
      <c:if test="${OrderPageBean.hasNextPage }">
     		<li class="paginItem"><a href="order.jsp?pageNO=${OrderPageBean.pageNO+1 }">下一页<span class="pagenxt"></span></a></li>
      </c:if>
       <li class="paginItem"><a href="order.jsp?pageNO=${OrderPageBean.totalPages }">尾页</a></li>
    </ul>
  </div>
  		</div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
