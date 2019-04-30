<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta charset="utf-8">
<title>分类管理</title>
<link href="../css/manageadmin.css" rel="stylesheet" type="text/css" />
<jsp:include page="style.jsp" ></jsp:include>
</head>
<body>
 <div id="main" class="wrap">
  	<div  class="main">
		<h2>分类管理</h2>
<div class="rightinfo">
  <div class="tools">
    <ul class="toolbar">
      <li class="click"><span><img src="../images/t01.png" /></span><a href="productClass-add.jsp">添加</a></li>
      <li><span><img src="../images/t03.png" /></span><a href="#">删除</a></li>
    </ul>
    <iframe src="../BackManager/foodSearch.html" scrolling="no" frameborder="0" width="400" height="42"></iframe>
  </div>
  <table class="imgtable">
    <thead>
      <tr>
        <th ><input name="" type="checkbox" value="" checked="checked"/></th>
        <th >&nbsp;&nbsp;菜种父类ID</th>
         <th >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;菜种父类名称</th>
        <th align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</th>
      </tr>
    </thead>
    <tbody>
      <tr height="50px">
        <td ><input name="" type="checkbox" value="" /></td>
        <td align="center">红山区</td>
        <td align="center">974167569@qq.com</td>
        <td align="center"><a href="#" class="tablelink"  onClick="window.open('user-add.jsp','弹出小窗口','width=400,height=400,top=200,left=500')" style="cursor:hand" >查看</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="productClass-update.jsp" class="tablelink">修改</a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="tablelink"> 删除</a></td>
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
 
</div>
</body>
</html>
