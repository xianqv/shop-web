<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <link href="<%=basePath %>css/manageadmin.css" rel="stylesheet" type="text/css" />
  <jsp:include page="style.jsp" ></jsp:include>
  
 <script type="text/javascript" src="<%=path%>/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function(){
		$("#meal_id").change(function(){
			
			$("#sm_id option:not(:first)").remove();
			
			var mid = $(this).val();
		
			if(mid!=""){
				var url = "<%=basePath%>MulServlet";
				
				
				var args = {"mid":mid,"time": new Date()};
				
				$.getJSON(url,args,function(data){				
					if(data.length == 0){
						alert("当前没有食品");
					}else{
						for(var i = 0;i<data.length;i++){						
							var majorId = data[i].sm_id;					
							var majorName = data[i].sm_name;
							$("#sm_id").append("<option value='"+majorId+"'>"+majorName+"</option");
						}
					}
				});
			}
		});
		
		
	})




</script>
  
  
  </head>
  
  <body>
  <div id="main" class="wrap">
  	<div class="main">
		<h2>修改商品信息</h2>
		<div class="manage">
			<form action="Product_update.action"  method="post">
				<input type="hidden" name="product.id" id="student.id" value="${product.id}">
				<input type="hidden" name="attribute.id" id="student.id" value="${product.getAttribute().id}">
				<input type="hidden" name="product.imgUrl" id="student.id" value="${product.imgUrl}">
				<table class="form">
				
					<tr>
						<td class="field">商品名称：</td>
						<td><input type="text" class="text" name="product.name" id="fname" value="${product.name }" /><span></span></td>
					</tr>
					<tr>
						<td class="field">商品型号：</td>
						<td><input type="text" class="text" name="product.model" id="fname" value="${product.model }"/><span></span></td>
					</tr>
					
					<tr>
						<td class="field">商品价格：</td>
						<td><input type="text" class="text tiny" name="product.price" id="fprice" value="${product.price }"/> 元<span></span></td>
					</tr>
					
					
					
					<tr>
						<td class="field">商品产地：</td>
						<td><input type="text" class="text tiny" name="product.address" id="fprice" value="${product.address }"/> <span></span></td>
					</tr>
					
					<tr>
						<td class="field">上市时间：</td>
						<td><input type="text" class="text" name="product.marketDate" id="fprice" value="${product.marketDate }"/><span></span></td>
					</tr>
				
					<tr>
						<td class="field">&nbsp;&nbsp;&nbsp;&nbsp;服装</td>
						<td class="field">电子产品：</td>
						
					</tr>
					
					
					<tr>
						<td class="field">材质：</td>
						<td><input type="text" class="text tiny" name="attribute.material" id="fprice" value="${product.getAttribute().material }"/><span></span></td>
						<td class="field">CUP型号：</td>
						<td><input type="text" class="text tiny" name="attribute.cupModel" id="fprice" value="${product.getAttribute().cupModel }"/><span></span></td>
					</tr>
					
					<tr>
						<td class="field">款式：</td>
						<td><input type="text" class="text tiny" name="attribute.style" id="fprice" value="${product.getAttribute().style }"/><span></span></td>
						<td class="field">屏幕尺寸：</td>
						<td><input type="text" class="text tiny" name="attribute.screenSize" id="fprice" value="${product.getAttribute().screenSize }"/><span></span></td>
					</tr>
					
					<tr>
						<td class="field">适用对象：</td>
						<td><input type="text" class="text tiny" name="attribute.userObject" id="fprice" value="${product.getAttribute().userObject }"/><span></span></td>
						<td class="field">操作系统：</td>
						<td><input type="text" class="text tiny" name="attribute.operatingSystem" id="fprice" value="${product.getAttribute().operatingSystem }"/><span></span></td>
					</tr>
					
					<tr>
						<td class="field">适用季节：</td>
						<td><input type="text" class="text tiny" name="attribute.season" id="fprice" value="${product.getAttribute().season }"/><span></span></td>
						<td class="field">内存说明：</td>
						<td><input type="text" class="text tiny" name="attribute.memory" id="fprice" value="${product.getAttribute().memory }"/><span></span></td>
					</tr>
					
					<tr>
						<td></td>
						<td></td>
						
						<td class="field">屏幕分辨率：</td>
						<td><input type="text" class="text tiny" name="attribute.screenResolution" id="fprice" value="${product.getAttribute().screenResolution }"/><span></span></td>
					
					<input type="hidden" value="${product.id }" />
					<tr>
						<td class="field">附加说明：</td>
						<td><input type="text" class="text" name="attribute.additional" id="fname" value="${product.getAttribute().additional }"/><span></span></td>
					</tr>
					
					<tr>
						<td class="field">描述：</td>
						<td>
							<textarea rows="10" cols="5" name="attribute.describle" value="${product.getAttribute().describle }"></textarea><span></span></td>
						
					</tr>
					<tr><td></td></tr>
					
			
					<tr>
						<td align="center"><label class="ui-blue"><input type="submit" name="submit" value="添加" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
