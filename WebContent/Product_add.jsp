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
		<h2>添加商品</h2>
		<div class="manage">
			<form action="Product_save.action" enctype="multipart/form-data" method="post">
				<table class="form">
				
					<tr>
						<td class="field">商品名称：</td>
						<td><input type="text" class="text" name="product.name" id="fname" /><span></span></td>
					</tr>
					
					
					<tr>
						<td class="field">所属分类：</td>
						
						<td>
							<select name="type.id" >
								<option value="null">--请选择(分类)--</option>
								
								    <c:forEach var="list" items="${typeList }">
										<option value="${list.id }">${list.name }</option>
									</c:forEach>
							</select>	
							
							<select name="brand.id" >
								<option value="null">--请选择(品牌)--</option>
								    <c:forEach var="brand" items="${brandlist }">
										<option value="${brand.id }">${brand.name }</option>
									</c:forEach>
							</select>	
						</td>
					</tr>
					
						<tr>
						<td class="field">商品型号：</td>
						<td><input type="text" class="text" name="product.model" id="fname" /><span></span></td>
					</tr>
					
					<tr>
						<td class="field">商品价格：</td>
						<td><input type="text" class="text tiny" name="product.price" id="fprice" /> 元<span></span></td>
					</tr>
					
					
					
					<tr>
						<td class="field">商品产地：</td>
						<td><input type="text" class="text tiny" name="product.address" id="fprice" /> <span></span></td>
					</tr>
					
					<tr>
						<td class="field">上市时间：</td>
						<td><input type="text" class="text" name="product.marketDate" id="fprice" /><span>* 2016年5月20日</span></td>
					</tr>
					<tr>
						<td class="field">上传展示图片</td>
						<td><input type="file" name="image"/></td>
					</tr>
					
					
					<tr>
						<td class="field">&nbsp;&nbsp;&nbsp;&nbsp;服装</td>
						<td class="field">电子产品：</td>
						
					</tr>
					
					
					<tr>
						<td class="field">材质：</td>
						<td><input type="text" class="text tiny" name="attribute.material" id="fprice" /><span></span></td>
						<td class="field">CUP型号：</td>
						<td><input type="text" class="text tiny" name="attribute.cupModel" id="fprice" /><span></span></td>
					</tr>
					
					<tr>
						<td class="field">款式：</td>
						<td><input type="text" class="text tiny" name="attribute.style" id="fprice" /><span></span></td>
						<td class="field">屏幕尺寸：</td>
						<td><input type="text" class="text tiny" name="attribute.screenSize" id="fprice" /><span></span></td>
					</tr>
					
					<tr>
						<td class="field">适用对象：</td>
						<td><input type="text" class="text tiny" name="attribute.userObject" id="fprice" /><span></span></td>
						<td class="field">操作系统：</td>
						<td><input type="text" class="text tiny" name="attribute.operatingSystem" id="fprice" /><span></span></td>
					</tr>
					
					<tr>
						<td class="field">适用季节：</td>
						<td><input type="text" class="text tiny" name="attribute.season" id="fprice" /><span></span></td>
						<td class="field">内存说明：</td>
						<td><input type="text" class="text tiny" name="attribute.memory" id="fprice" /><span></span></td>
					</tr>
					
					<tr>
						<td></td>
						<td></td>
						
						<td class="field">屏幕分辨率：</td>
						<td><input type="text" class="text tiny" name="attribute.screenResolution" id="fprice" /><span></span></td>
					
					
					<tr>
						<td class="field">附加说明：</td>
						<td><input type="text" class="text" name="attribute.additional" id="fname" /><span></span></td>
					</tr>
					
					<tr>
						<td class="field">描述：</td>
						<td><textarea rows="10" cols="5" name="attribute.describle"></textarea><span></span></td>
						
					</tr>
					
					
					
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
