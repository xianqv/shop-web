<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <title>添加用户</title>
  <jsp:include page="style.jsp" ></jsp:include>
  </head>
  <body>
  <div id="main" class="wrap">
  	<div  class="main">
		<h2>新增用户</h2>
		<div class="manage" id="register" >
			<form action="../BackManager/adduser.do" method="post" onsubmit="return checkForm(this);">
				<table class="form" >
					<tr>
						<td class="field">用户名：</td>
						<td><input type="text" class="text" name="userName" value="" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">密码：</td>
						<td><input type="password" class="text" id="passWord" name="passWord" value="" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">确认密码：</td>
						<td><input class="text" type="password" name="rePassWord" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">真是姓名：</td>
						<td><input type="text" class="text" name="RealName" value="" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">性别：</td>
						<td><input type="radio" name="sex" value="男" checked="checked" />男 <input type="radio" name="sex" value="女" onfocus="FocusItem(this)" onblur="CheckItem(this);" />女<span></span></td>
					</tr>
					<tr>
						<td class="field">手机号码：</td>
						<td><input type="text" class="text" name="phone" value="" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					
					
					<tr>
						<td class="field">赤峰市/地区：</td>
						<td>
							<select id="country" name="City">
								<option>红山区</option>
								<option>新城区</option>	
							</select>
						</td>
					</tr>
					
					
					<tr>
						<td class="field">邮箱地址：</td>
						<td><input type="text" class="text" name="email" value="" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td class="field">送餐地址：</td>
						<td><input type="text" class="text" name="country" value="" onfocus="FocusItem(this)" onblur="CheckItem(this);" /><span></span></td>
					</tr>
					<tr>
						<td><font style="color:#ff7300">${msg }</font></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="添加" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
