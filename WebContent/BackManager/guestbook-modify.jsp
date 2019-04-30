<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  
  <jsp:include page="style.jsp" ></jsp:include>
  <script type="text/javascript" language="javascript">
  	check = function(){
  		var r = document.getElementById("rcontent");
  		if(r.value == ""){
  			var d = document.getElementById("mesContent");
  			d.className="error";
  			d.innerHTML="留言回复不可以为空";
  			return false;
  		}
  		return true;
  	}
  </script>
  </head>
  
  <body>
  <div id="main" class="wrap">
  <div class="main">
		<h2>回复留言</h2>
		<div class="manage">
			<form action="<c:url value='/MessageServlet'/>" method="post" >
			<input type="hidden" name="method" value="setReplay"/>
			<input type="hidden" name="mid" value="${message.mess_id }"/>
				<table class="form">
				
					<tr>
						<td class="field">用户ID：</td>
						<td><input type="text" class="text" name="orderId" value="${message.user_id }" readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="field">留言姓名：</td>
						<td><input type="text" class="text" name="name" value="${user.user_name }" /></td>
					</tr>
					<tr>
						<td class="field">留言内容：</td>
						<td>${message.mess_content }</td>
					</tr>
					<tr>
						<td class="field">回复内容：</td>
						<td><textarea name="replyContent" id="rcontent"></textarea><span id="mesContent"></span></td>
					</tr>
					<tr>
						<td><font style="color:#ff7300;"></font></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="回复" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
