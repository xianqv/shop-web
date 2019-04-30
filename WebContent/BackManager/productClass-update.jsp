<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <title>添加商品类型</title>
  <jsp:include page="style.jsp" ></jsp:include>
  <script type="text/javascript">
  	check =function(){
  		var cn = document.getElementById("className");
  		if(cn.value == ""){
  			var message = document.getElementById("msg");
  			message.innerHTML="商品类型不可以为空";
  			message.className="error";
  			return false;
  		}
  		return true;
  	}
  </script>
  </head>
  
  <body>
  <div id="main" class="wrap">
  	<div class="main">
		<h2>修改分类</h2>
		<div class="manage">
			<form action="../BackManager/addproducttype.do" method="post" onsubmit="return check()">
				<table class="form">
					<tr>
						<td class="field">菜品父分类：</td>
						<td>
							<select name="parentId">
								<option value="0" selected="selected">--请修改--</option>
								<c:forEach items="${ptps }" var="item">
									<option value="${item.epp_id }">${item.epp_name }</option>
								</c:forEach>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;最多增加5个子分类，建议增加3个
						</td>
					</tr><br><br>
					<tr>
						<td class="field">分类名称：</td>
						<td><input type="text" class="text" name="className" id="className"/><span id="msg"></span></td>
					</tr>
					
					<tr>
						<td class="field">子分类 1 名称：</td>
						<td><input type="text" class="text" name="className" id="className"/><span id="msg"></span></td>
					</tr>
					<tr>
						<td class="field">子分类 2 名称：</td>
						<td><input type="text" class="text" name="className" id="className"/><span id="msg"></span></td>
					</tr>
					<tr>
						<td class="field">子分类 3 名称：</td>
						<td><input type="text" class="text" name="className" id="className"/><span id="msg"></span></td>
					</tr>
					<tr>
						<td class="field">子分类 4 名称：</td>
						<td><input type="text" class="text" name="className" id="className"/><span id="msg"></span></td>
					</tr>
					<tr>
						<td class="field">子分类5 名称：</td>
						<td><input type="text" class="text" name="className" id="className"/><span id="msg"></span></td>
					</tr>
					<tr>
						<td>
						<font style="color:#ff7300" id="ms">${mess }</font>
						<c:if test="${mess eq '商品二级分类修改成功,正在返回...' }">
							<script type="text/javascript">
								setTimeout("location.href='../BackManager/loadproducttype.do'", 2000);
							</script>
						</c:if>
						</td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="修改" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
