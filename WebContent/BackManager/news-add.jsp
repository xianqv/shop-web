<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <script type="text/javascript" src="../scripts/Calendar6.js"></script>
  <jsp:include page="style.jsp" ></jsp:include>
  <script type="text/javascript" language="javascript">
  
  	check = function(){
  		var megTitle = document.getElementById("megTitle");
  		var megContent = document.getElementById("megContent");
  		var title = document.getElementById("title");
  		var content = document.getElementById("content");
  		if(title.value == ""){
  			megTitle.innerHTML="公告标题不可以为空";
  			megTitle.className="error";
  			return false;
  		}
  		if(content.innerHTML == ""){
  			megContent.innerHTML="公告的内容不可以为空";
  			megContent.className="error";
  			return false;
  		}
  		return true;
	}
  </script>
  </head>
  
  <body>
  <div id="main" class="wrap">
  	<div class="main">
		<h2>添加公告</h2>
		<div class="manage">
			<form action="../BackManager/addnews.do" method="post" onsubmit="return check()">
				<table class="form">
					
					 
					<tr>
					<input id="TITLE_COLOR" class="color"  type="color" value="" />
					</tr> 
					 
					 
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
  </div>
  </body>
</html>
