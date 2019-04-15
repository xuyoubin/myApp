<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<%@ include file="/WEB-INF/jsp/person/head.jsp" %> 
	<head>
		<title>我的银行卡</title>
	</head>
	<body>
		<div class="nav-table">
			<div class="long-title"><span class="all-goods">全部分类</span></div>
		</div>
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的银行卡</strong> / <small>My&nbsp;Credit&nbsp;Card</small></div>
					</div>
					<hr/>
					<div class="card-box-list">
						<ul>
							<c:forEach items="${cardlist }" var="card" varStatus="i">
								<li>
									<div class="card-box">
										<div class="card-box-name">
											<span class="bank-logo"><a href="#"><img src="../images/bankjh.png"></a></span>
											<span title="${card.bankname }" class="bank-name">${card.bankname }</span>
											<span class="bank-num4" id="bank-num4">尾号${card.banknumber}</span>
											<span class="card-type card-type-DC"></span>  
										</div>
										<div class="card-box-express">
											<div class="express-status">
												<span class="asset-icon asset-icon-express-s"></span> <span>${card.isuse eq 1 ? '已开通' : '未开通' }</span>
											</div>
											<div class="express-else"><a href="#">管理</a></div>
										</div>
										<div class="card-detail">
											<div class="card-detail-list">
												<div class="card-detail-value" title="账单"><a href="billlist.html"><strong>账单</strong><span></span></a></div>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
							<li>
								<div class="add-card">
									<a href="javascript:void(0)" onclick="window.location.href='../person/addCardPage.do'" target="_blank"><i class="am-icon-plus"></i>添加银行卡</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!--底部-->
				<%@ include file="/WEB-INF/jsp/person/footer.jsp" %>
			</div>
			<!-- 左边菜单 -->
			<%@ include file="/WEB-INF/jsp/person/leftmenu.jsp" %>
		</div>
	</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
	
	
})

</script>