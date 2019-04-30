<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link type="text/css" rel="stylesheet" href="<%=basePath %>css/managerstyle.css" />
<script type="text/javascript" src="<%=basePath %>scripts/function-manage.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath %>scripts/function.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath %>scripts/jquery-1.4.2.min.js"></script>