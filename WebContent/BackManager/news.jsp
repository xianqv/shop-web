<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <link href="../css/manageadmin.css" rel="stylesheet" type="text/css" />
  <jsp:include page="style.jsp" />
  </head> 
  <body>
  <div id="main" class="wrap">
  	<div class="main">
		<h2>新闻管理</h2>
		<div class="manage">
			
<table class="imgtable">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>公告编号</th>
        <th>公告标题</th>
        <th>发布日期</th>
        <th>浏览次数</th>
       <th>&nbsp;&nbsp;操作</th>
      </tr>
    </thead>
    <tbody>
      <tr height="50px">
        <td ><input name="" type="checkbox" value="" /></td>
        <td>001</td>
        <td>日本地震了</td>
        <td>2015-5-6</td>
         <td>100</td>
        <td align="center"><a href="news-modify.jsp" class="tablelink">编辑</a> &nbsp;&nbsp;<a href="#" class="tablelink"> 删除</a></td>
      </tr>
    </tbody>
  </table>
<div class="pagin">
   <div class="message">共<i class="blue">1256</i>页，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
    <ul class="paginList">
      <li class="paginItem"><a href="javascript:;">首页</a></li>
      <li class="paginItem"><a href="javascript:;">上一页<span class="pagepre"></span></a></li>
      <li class="paginItem"><a href="javascript:;">下一页<span class="pagenxt"></span></a></li>
       <li class="paginItem"><a href="javascript:;">尾页</a></li>
    </ul>
    </div>
  </div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
