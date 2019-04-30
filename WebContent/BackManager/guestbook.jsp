<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <link href="<%=basePath%>/css/manageadmin.css" rel="stylesheet" type="text/css" />
  <jsp:include page="style.jsp" ></jsp:include>
  </head>
  
  <body>
  <div id="main" class="wrap">
  	<div class="main">
		<h2>留言管理</h2>
		<div class="manage">

<table class="imgtable">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>留言编号</th>
        <th>用户ID</th>
        <th>留言内容</th>
        <th>对话日期</th>
       <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="message"  items="${messageList }">
      <tr height="50px">
        <td ><input name="" type="checkbox" value="" /></td>
        <td>${message.mess_id }</td>
        <td>${message.user_id }</td>
        <td>${message.mess_content }</td>
         <td>${message.mess_data }</td>
        <td align="center"><a href="#" class="tablelink" onClick="window.open('user-add.jsp','弹出小窗口','width=400,height=400,top=200,left=500')" style="cursor:hand">查看记录</a> &nbsp;&nbsp;<a href="<c:url value='/MessageServlet?method=getMessage&mid=${message.mess_id }'/>" class="tablelink">回复</a> &nbsp;&nbsp;<a href="<c:url value='/MessageServlet?method=delete&mid=${message.mess_id }'/>"> 删除</a></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
<div class="pagin">
  
    </ul>
    </div>
		</div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
	