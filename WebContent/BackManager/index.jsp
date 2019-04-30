<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>美食美刻-后台管理</title>
	<link type="text/css" rel="stylesheet" href="../css/manager/Mstyle.css" />
	<script type="text/javascript" language="javascript" src="../scripts/manager.js"></script>

	<script type="text/javascript">
//		window.location = "UserInfo_CMSLogout.action";
	</script>

</head>

<body>
<!-- 头部信息 -->
<div class="header">
	<div class="header03"></div>
	<div class="header01"></div>
	<div class="header02">IGOU后台信息管理系统</div>
</div>
<!-- 左侧部分 -->
<div class="left" id="LeftBox">
	<!-- 左侧第一部分 -->
	<div class="left01">
		<div class="left01_right"></div>
		<div class="left01_left"></div>
		<div class="left01_c"><div class="left01_c">当前登录者： ${LOGIN_NAME.name}</div></div>
	</div>
	<!-- 用户信息管理 -->
	<div class="left02">
		<!-- 上部分导航 -->
		<div class="left02top">
			<div class="left02top_right"></div>
			<div class="left02top_left"></div>
			<div class="left02top_c">用户信息</div>
		</div>
		<!-- 下部分显示 -->
		<div class="left02down">
			<div class="left02down01"><a  onclick="show_menuB(60)" href="javascript:;"><div id="Bf060" class="left02down01_img"></div>用户信息管理</a></div>
			<div class="left02down01_xia noneBox" id="Bli060">
				<ul>
					<li id="f060"><a href="UserInfo_list.action" target="showPage">&middot;查看用户列表</a></li>
				</ul>
			</div>

		</div>
	</div>


	<!--商品管理-->
	<div class="left02">
		<div class="left02top">
			<div class="left02top_right"></div>
			<div class="left02top_left"></div>
			<div class="left02top_c">商品管理</div>
		</div>

		<div class="left02down">

			<div class="left02down01"><a onclick="show_menuB(82)" href="javascript:;"><div id="Bf082" class="left02down01_img"></div>商品分类管理</a></div>

			<div class="left02down01_xia noneBox" id="Bli082">
				<ul>
					<li id="f082"><a href="../BackManager/productClass-add.jsp" target="showPage">&middot;增加商品分类</a></li>
					<li id="f082"><a href="ProductType_list.action" target="showPage">&middot;查看商品分类列表</a></li>
					<li id="f082"><a href="../BackManager/Brand_add.jsp" target="showPage">&middot;增加商品品牌</a></li>
					<li id="f082"><a href="Brand_list.action" target="showPage">&middot;查看品牌列表</a></li>
				</ul>
			</div>

			<div class="left02down01"><a onclick="show_menuB(83)" href="javascript:;"><div id="Bf083" class="left02down01_img"></div>商品管理</a></div>

			<div class="left02down01_xia noneBox" id="Bli083">
				<ul>
					<li id="f083"><a href="Product_add.action" target="showPage">&middot;新增商品</a></li>
					<li id="f083"><a href="Product_list.action" target="showPage">&middot;商品列表</a></li>
				</ul>
			</div>
		</div>
	</div>





	<!-- 订单管理 -->
	<div class="left02">
		<div class="left02top">
			<div class="left02top_right"></div>
			<div class="left02top_left"></div>
			<div class="left02top_c">订单管理</div>
		</div>

		<div class="left02down">

			<div class="left02down01"><a onclick="show_menuB(84)" href="javascript:;"><div id="Bf084" class="left02down01_img"></div>订单管理</a></div>

			<div class="left02down01_xia noneBox" id="Bli084">
				<ul>
					<li id="f084"><a href="Order_list.action" target="showPage">&middot;(修改、删除)订单列表</a></li>
				</ul>
			</div>
		</div>

	</div>

	<!-- 留言管理 -->
	<div class="left02">
		<div class="left02top">
			<div class="left02top_right"></div>
			<div class="left02top_left"></div>
			<div class="left02top_c">客户端界面管理</div>
		</div>
		<div class="left02down">

			<div class="left02down01"><a onclick="show_menuB(85)" href="javascript:;"><div id="Bf085" class="left02down01_img"></div>数据添加</a></div>
			<div class="left02down01_xia noneBox" id="Bli085">
				<ul>
					<li id="f085"><a href="<c:url value='../BackManager/Advert_add.jsp'/>" target="showPage">&middot;首页轮播广告-添加</a></li>
					<li id="f085"><a href="<c:url value='../BackManager/FunctionButton_add.jsp'/>" target="showPage">&middot;首页功能按钮-添加</a></li>
					<li id="f085"><a href="<c:url value='../BackManager/ProductClassify_add.jsp'/>" target="showPage">&middot;主页商品分类-添加</a></li>
				</ul>
			</div>

			<div class="left02down01"><a onclick="show_menuB(86)" href="javascript:;"><div id="Bf086" class="left02down01_img"></div>数据列表</a></div>
			<div class="left02down01_xia noneBox" id="Bli086">
				<ul>
					<li id="f086"><a href="<c:url value='FunctionButton_list.action'/>" target="showPage">&middot;首页功能按钮-列表</a></li>
					<li id="f086"><a href="<c:url value='ProductClassify_list.action'/>" target="showPage">&middot;主页商品分类-列表</a></li>
					<li id="f086"><a href="<c:url value='Advert_list.action'/>" target="showPage">&middot;轮播广告-列表</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="left01">
		<div class="left01_right"></div>
		<div class="left01_left"></div>
		<div class="left03_c"><a href="UserInfo_CMSLogout.action">安全退出</a></div>
	</div>
</div>

<div class="rrcc" id="RightBox">
	<div class="center" id="Mobile" onclick="show_menuC()"></div>
	<div class="right" id="li010">
		<iframe name="showPage" src="../BackManager/manager-result.jsp" scrolling="auto" width="1097px;" height="550px" frameborder="no"></iframe>
	</div>

</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
