<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
<script type="text/javascript" src="../scripts/Calendar6.js"></script>
  <jsp:include page="style.jsp" ></jsp:include>
  </head>
  
  <body>
  <div id="main" class="wrap">
  	<div class="main">
		<h2>修改新闻</h2>
		<div class="manage">
			<form action="../BackManager/modifynews.do" method="post" onsubmit="return check()">
				<table class="form">
					
					<tr>
						<td class="field">公告标题：</td>
						<td><input type="text" class="text" name="title" value="${news.en_title }" /></td>
					</tr>
					<tr>
						<td class="field">公告内容：</td>
						<td><textarea name="content">${news.en_content }</textarea></td>
					</tr>
					<tr>
						<td class="field">宣传图片：</td>
						<td><input type="file" class="text" name="photo" id="photo" onfocus="FocusItem(this)" onblur="CheckProductItem(this);"/><span></span></td>
					</tr>
					<tr>
						<td class="field">发布者：</td>
						<td>
							<select name="parentId">
								<option>管理员</option>
								<option>店长</option>
								<option>企业经理</option>
							</select>					
						</td>
					</tr>
					 
					 
					  <tr>
					    <th width="110" align="right" bgcolor="#F8F8F8">发布日期：</th>
					    <td bgcolor="#F8F8F8"><input type="text" onclick="SelectDate(this)"  name="birthday" value=""></td>
					  </tr>
					
					
					
					
					<tr>
						<td><font style="color:#ff7300">${message }</font></td>
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
