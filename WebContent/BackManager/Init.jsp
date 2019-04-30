<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="../js/jquery-1.8.3.min.js"/>
    <jsp:include page="style.jsp" ></jsp:include>
    <script type="text/javascript">
       $(document).ready(function () {
//            document.getElementById("fm").submit();
           window.location.href="UserInfo_index.action";
       })
    </script>
</head>

<body>
    <form id="fm" action="UserInfo_index.action">

    </form>
</body>
</html>
