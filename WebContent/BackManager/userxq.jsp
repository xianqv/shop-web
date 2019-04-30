<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import=
 "com.food.bean.*,com.food.dao.*,
 java.util.*,java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>用户详情</title>
<link href="../css/manageadmin.css" rel="stylesheet" type="text/css" />
<jsp:include page="style.jsp" ></jsp:include>
</head>
<body>
 <div id="main" class="wrap">
  	<div  class="main">
		<h2>用户详情</h2>
<div class="rightinfo">
   <%
   	System.out.println(123);
      int user_id =Integer.parseInt(request.getParameter("user_id"));
      System.out.println(456);
      UserDAO dao = new UserDAO();
      UserInfo u =dao.getUserByID(user_id);
      System.out.println(u);
   %><br />
       用户ID： <%=u.getUser_id() %><br />
       用户名：<%=u.getUser_name() %><br />
       性别：<%=u.getUser_sex() %>    <br /> 
       用户电话： <%=u.getUser_pho() %><br />
        
       所处区域：<%=u.getUser_area() %><br />
        
       送餐详细地址： <%=u.getUser_address() %><br />
      
       邮箱地址： <%=u.getUser_email() %><br />
       用户积分：<%=u.getCredit() %><br />
  
 
  </div>
  </div>
  </div>
 
</div>
</body>
</html>
