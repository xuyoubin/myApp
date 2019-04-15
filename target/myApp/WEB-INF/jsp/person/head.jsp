 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<!-- <title>个人中心</title> -->
		<script  type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src="../js/loadmask/jquery.loadmask.min.js"></script>
		<script src="../js/amazeUI/amazeui.min.js"></script>
		<script type="text/javascript" src="../js/alert.js"></script>
		<script src="../js/myJs/common.js"></script>
		<link href="../css/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../css/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/vipstyle.css" rel="stylesheet" type="text/css">
		<link href="../css/infstyle.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../js/loadmask/jquery.loadmask.css" />
		<link rel="stylesheet" type="text/css"  href="../css/alert.css">
		 <link href="../css/addstyle.css" rel="stylesheet" type="text/css">

		
	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<c:choose >
									<c:when test="${sessionScope.USER_KEY != null}">
										<div class="menu-hd">
											<a href="#" target="_top" class="h">你好,${sessionScope.USER_KEY.name}&nbsp;&nbsp;&nbsp;&nbsp;</a>
											<a href="javascript:void(0)" onclick="window.location.href='../user/loginOut.do'"  style="color:#1E90FF;">退出</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="menu-hd">
											<a href="javascript:void(0)" onclick="window.location.href='../user/loginPage.do'" target="_top" class="h">亲，请登录</a>
											<a href="javascript:void(0)" onclick="window.location.href='../user/regPage.do'" target="_top">免费注册</a>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="javascript:void(0)" onclick="window.location.href='../user/index.do'" target="_top" class="h">商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="javascript:void(0)" onclick="window.location.href='../person/index.do'" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="javascript:void(0)" onclick="window.location.href='../shopcart/cartPage.do'" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
						</ul>
						</div>
					</div>
				</div>
			</article>
		</header>
</html>