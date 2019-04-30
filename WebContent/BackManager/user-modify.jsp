<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <jsp:include page="style.jsp" ></jsp:include>
  </head>
  
  <body>
  <div id="main" class="wrap">
  	<div class="main">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<h2>修改用户</h2>
		<div  id="register" class="manage">
			<form action="../BackManager/modifyuserinfo.do?id=${user.eu_user_id }" method="post" onsubmit="return checkForm(this);"> 
				<table class="form">
					<tr>
						<td class="field">用户名：</td>
						<td><input type="text" class="text" name="userName" value="${user.eu_user_name }" readonly="readonly" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">密码：</td>
						<td><input type="text" class="text" name="passWord" value="${user.eu_password }"onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">性别：</td>
						<c:if test="${fn:trim(user.eu_sex) eq '女' }">
							<td><input type="radio" name="sex" value="男"  />男 <input type="radio" name="sex" value="女" checked="checked" />女<span></span></td>
						</c:if>
						<c:if test="${fn:trim(user.eu_sex) eq '男' }">
							<td><input type="radio" name="sex" value="男"  checked="checked" />男 <input type="radio" name="sex" value="女" />女<span></span></td>
						</c:if>
						
					</tr>
					<tr>
						<td class="field">手机号码：</td>
						<td><input type="text" class="text" name="phone" value="${user.eu_mobile }" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">邮箱：</td>
						<td><input type="text" class="text" name="email" value="${user.eu_email }" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">送货地址：</td>
						<td><input type="text" class="text" name="country" value="${user.eu_address }" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">头像：</td>
						<td><input type="file" class="text" name="photo" /></td>
					</tr>
					<tr>
						<td class="field"><font id="msg" style="color:#ff7300">${msg}</font></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="更新" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
