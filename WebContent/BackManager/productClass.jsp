<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <jsp:include page="style.jsp" ></jsp:include>
  </head>
  <body>
  <div id="main" class="wrap">
  	<div class="main">
		<h2>分类管理</h2>
		<div class="manage">
			<table class="list" id="t1">
				<tr>
					<th>ID</th>
					<th>分类名称</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${allProductParents }" var="p">
					<tr>
						<td class="first w4 c">${p.epp_id }</td>
						<td><b style="font-size:18px">${p.epp_name }</b></td>
						<td  class="w1 c"></td>
					</tr>
					<c:forEach items="${ allProductTypes}" var="item">
					<c:if test="${p.epp_id==item.epc_parent_id }">
						<tr>
							<td class="first w4 c">${item.epc_id }</td>
							<td>${item.epc_name }</td>
							<td class="w1 c"><a href="../BackManager/loadparenttype.do?id=${item.epc_id }">修改</a><a href="../BackManager/deleteproducttype.do?id=${item.epc_id }">删除</a></td>
						</tr>
					</c:if>	
					</c:forEach>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
