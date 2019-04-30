<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>订单列表</title>
<link href="<%=basePath %>css/manageadmin.css" rel="stylesheet" type="text/css" />
<jsp:include page="style.jsp" ></jsp:include>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="../js/jquery-1.8.3.min.js"></script>
	<%--<script src="../js/bootstrap.min.js"></script>--%>
<script type="text/javascript">

		function fahuo(id){
			 $.ajax({
                 type : "post",
                 url : 'Order_fahuoById.action',
                 data : {//设置数据源
                     id : id
                 },
                 dataType : "json",//设置需要返回的数据类型
                 success : function(date) {
                     alert(date.msg);
                     document.getElementById("fm").submit();
                 }
             });
           }	

</script>


</head>
<body>
 <div id="main" class="wrap">
  	<div  class="main">
		<h2 style="width:135%">订单列表</h2>
<div class="rightinfo" style="width:134%">
  <form id="fm" name="fm" method="post"
				action="Order_list.action">
			</form>
  
  <table class="table">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
       	<th style="text-align:center">订单编号</th>
        <th style="text-align:center">商品名称</th>
        <th style="text-align:center">商品单价</th>
        <th style="text-align:center">数量</th>
        <th style="text-align:center">总价</th>
        <th style="text-align:center">颜色</th>
        <th style="text-align:center">尺寸</th>
        <th style="text-align:center">用户名</th>
        <th style="text-align:center">电话</th>
       	<th style="text-align:center">是否交易</th>
       	<th style="text-align:center">是否发货</th>
        <th style="text-align:center">操作&nbsp;&nbsp;</th>
      </tr>
    </thead>
    <tbody>
     <c:forEach var="order" items="${orderlist }">
      <tr height="50px" class="success">
        <td ><input name="" type="checkbox" value="" /></td>
        <td style="text-align:center">${order.id }</td>
        <td style="text-align:center">${order.proName.substring(0, 5) }.....</td>
        <td style="text-align:center">${order.onePrice }</td>
        <td style="text-align:center">${order.num }</td>
        <td style="text-align:center">${order.totalPrice }</td>
        <td style="text-align:center">${order.color }</td>
        <td style="text-align:center">${order.size }</td>
        
        <td style="text-align:center">${order.userName }</td>
        <td style="text-align:center">${order.phone }</td>

        <c:if test="${order.isDeal == 1}">
        	<td style="text-align:center">已交易</td>
        </c:if>
          <c:if test="${order.isDeal == 0}">
          <td style="text-align:center">已取消</td>
          </c:if>


          <c:if test="${order.isDeliver ==-1}">
          <td style="text-align:center">已取消</td>
          </c:if>
        <c:if test="${order.isDeliver == 0}">
        	<td style="text-align:center">未发货</td>
        </c:if>

        <c:if test="${order.isDeliver == 1}">
        	<td style="text-align:center">已发货</td>
        </c:if>
        <c:if test="${order.isDeliver == 2}">
        	<td style="text-align:center">已收货</td>
        </c:if>
        

      <td>   
        
	        <div class="btn-group">
				<button type="button" style="width:70px;height:30px" class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown">
					操作 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<li><a href="Order_check.action?order.id=${order.id}">查看</a></li>
                    <c:if test="${order.isDeliver != -1 }">
                        <li class="divider"></li>
					<li ><a href="javascript:fahuo(${order.id});">发货</a></li>
                    </c:if>
				</ul>
			</div>
        
      </td>
      </c:forEach>
    </tbody>
  </table>
  
  </div>
  </div>
 
</div>
</body>
</html>
