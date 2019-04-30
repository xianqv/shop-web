<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <jsp:include page="style.jsp" ></jsp:include>
  </head>
  
  <body>
  <div id="main" class="wrap">
  	<div class="main">
		<h2>查看订单详情</h2>
		<div class="manage">
			<form action="Order_save.action" method="post">
				<table class="form">
					<tr>
						<td class="field">订单号：</td>
						<td><input type="text" class="text" name="order.id" value="${order.id }" readonly="readonly" /></td>
					</tr>
					
					<tr>
						<td class="field">商品名称：</td>
						<td><input type="text" class="text" name="order.proName" value="${order.proName }" readonly="readonly" /></td>
					</tr>
					
					<tr>
						<td class="field">商品单价：</td>
						<td><input type="text" class="text" name="order.onePrice" value="${order.onePrice }" readonly="readonly" /></td>
					</tr>
					
					<tr>
						<td class="field">商品数量：</td>
						<td><input type="text" class="text" name="order.num" value="${order.num }" readonly="readonly" /></td>
					</tr>
					
					
					<tr>
						<td class="field">商品总价：</td>
						<td><input type="text" class="text" name="order.totalPrice" value="${order.totalPrice }" readonly="readonly" /></td>
					</tr>
					
					
					<tr>
						<td class="field">商品颜色：</td>
						<td><input type="text" class="text" name="order.color" value="${order.color }" readonly="readonly" /></td>
					</tr>
					
					
					<tr>
						<td class="field">商品尺寸：</td>
						<td><input type="text" class="text" name="order.size" value="${order.size }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="field">订购人姓名：</td>
						<td><input type="text" class="text" name="order.userName" value="${order.userName }" /></td>
					</tr>
					<tr>
						<td class="field">用户电话：</td>
						<td><input type="text" class="text" name="order.phone" value="${order.phone }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="field">发货地址：</td>
						<td><input type="text" class="text" name="order.address" value="${order.address }" /></td>
					</tr>
					
					<c:if test="${order.isDeal == 1}">
					<tr>
						<td class="field">交易状态：</td>
						<td><input type="text" class="text" name="order.isDeal" value="已交易" /></td>
					</tr>
       				</c:if>
       				
       				
					<tr>
						<td class="field">货物状态：</td>
						<td>
							<select name="order.isDeliver">
								<option value="0">未发货</option>
								<option value="1">已发货</option>
								<option value="2">已收货</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td class="field">备注信息：</td>
						<td>
							<textarea rows="5" cols="10" id="msg" name="order.msg" >${order.msg}</textarea>
						</td>
					</tr>
					
					<tr>
						<td><label class="ui-blue"><input type="submit" name="submit" value="保存" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
