
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加商品尺寸</title>
<link href="<%=basePath%>css/default.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/swfupload.js"></script>
<script type="text/javascript" src="<%=basePath%>js/swfupload.queue.js"></script>
<script type="text/javascript" src="<%=basePath%>js/fileprogress.js"></script>
<script type="text/javascript" src="<%=basePath%>js/handlers.js"></script>
<!-- 初始化swfupload 对象-->

<script type="text/javascript">
	var upload1, upload2;

	window.onload = function() {
		upload1 = new SWFUpload({
			// Backend Settings
			upload_url : "Size_addPic.action",
			post_params : {
				"id" : "${product.id}"
			},
			file_post_name : "file",
			// File Upload Settings
			file_size_limit : "102400", // 100MB
			file_types : "*.*",
			file_types_description : "All Files",
			file_upload_limit : "10",
			file_queue_limit : "0",

			// Event Handler Settings (all my handlers are in the Handler.js file)
			file_dialog_start_handler : fileDialogStart,
			file_queued_handler : fileQueued,
			file_queue_error_handler : fileQueueError,
			file_dialog_complete_handler : fileDialogComplete,
			upload_start_handler : uploadStart,
			upload_progress_handler : uploadProgress,
			upload_error_handler : uploadError,
			upload_success_handler : uploadSuccess,
			upload_complete_handler : uploadComplete,

			// Button Settings
			button_image_url : "<%=basePath%>images/XPButtonUploadText_61x22.png",
			button_placeholder_id : "spanButtonPlaceholder1",
			button_width : 61,
			button_height : 22,

			// Flash Settings
			flash_url : "<%=basePath%>js/swfupload.swf",

			custom_settings : {
				progressTarget : "fsUploadProgress1",
				cancelButtonId : "btnCancel1"
			},

			// Debug Settings
			debug : false
		});

	}
</script>


<jsp:include page="style.jsp"></jsp:include>


</head>

<body>
	<div id="main" class="wrap">
		<div class="main">
			<h2>添加尺寸</h2>
			<div class="manage">
				
				<table class="form">


					<tr>
						<td><a href="Size_addSize?product.id=${product.id }"
							class="tablelink">添加尺寸</a></td>
					</tr>

					<tr>
						<td><a href="Size_addColor?product.id=${product.id }"
							class="tablelink">添加颜色</a></td>
					</tr>

					<tr>
						<td class="legend">添加展示图片</td>
					</tr>




					<div id="content">
						<form action="Size_addPic.action" method="post" 
							enctype="multipart/form-data">
							<input type="hidden" name="product.id" value="${product.id }"/>
							<table>
								<tr valign="top">
									<td>
										<div>
											<div class="fieldset flash" id="fsUploadProgress1">
												<span class="legend">${product.id }</span>
											</div>
											<div style="padding-left: 5px;">
												<span id="spanButtonPlaceholder1"></span> <input
													id="btnCancel1" type="button" value="Cancel Uploads"
													onclick="cancelQueue(upload1);" disabled="disabled"
													style="margin-left: 2px; height: 22px; font-size: 8pt;" />
												<br />
											</div>
										</div>
									</td>
								</tr>
							</table>
						</form>
					</div>




					</label>

					</div>
					</div>
					<div class="clear"></div>
					</div>
</body>
</html>
