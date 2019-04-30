<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  	<jsp:include page="style.jsp" ></jsp:include>
  </head>
  
  <body>
  <div id="main" class="wrap">
  <div class="main">
	<div class="main">
		<h2>提示信息</h2>
		<div class="manage">
			<div class="shadow">
				<em class="corner lb"></em>
				<em class="corner rt"></em>
				<div class="box">
				<input id="url" type="hidden" value="${url }"/>
					<div class="msg">
						<p>恭喜：操作成功！</p>
						<p>正在进入操作页面...</p>
						<script type="text/javascript">
							var u = document.getElementById("url").value;
							setTimeout("location.href='"+u+"'", 1000);
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	</div>
  </div>
  </body>
</html>
