<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <%@ include file="/WEB-INF/jsp/person/head.jsp" %> 
	<head>
		<title>安全设置</title>
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
					<div class="user-safety">
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账户安全</strong> / <small>Set&nbsp;up&nbsp;Safety</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">
								<img class="am-circle am-img-thumbnail" src="../images/getAvatar.do.jpg" alt="" />
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>${user.name }</i></b></div>
                                <div class="safeText">
                                  	<a href="safety.html">账户安全:<em style="margin-left:20px ;">60</em>分</a>
									<div class="progressBar"><span style="left: -95px;" class="progress"></span></div>
								</div> 
							</div>
						</div>

						<div class="check">
							<ul>
								<li>
									<i class="i-safety-lock"></i>
									<div class="m-left">
										<div class="fore1">登录密码</div>
										<div class="fore2"><small>为保证您购物安全，建议您定期更改密码以保护账户安全。</small></div>
									</div>
									<div class="fore3">
										<a href="javascript:void(0)" onclick="window.location.href='../person/password.do'" >
											<div class="am-btn am-btn-secondary">修改</div>
										</a>
									</div>
								</li>
								<li>
									<i class="i-safety-wallet"></i>
									<div class="m-left">
										<div class="fore1">支付密码</div>
										<div class="fore2"><small>启用支付密码功能，为您资产账户安全加把锁。</small></div>
									</div>
									<div class="fore3">
										<a href="javascript:void(0)" onclick="window.location.href='../person/payPage.do'">
											<div class="am-btn am-btn-secondary" style="padding-left:1px">立即启用</div>
										</a>
									</div>
								</li>
								<li>
									<i class="i-safety-iphone"></i>
									<div class="m-left">
										<div class="fore1">手机验证</div>
										<c:if test="${user.phone == '' || user.phone == null}">
											<div class="fore2"><small>您验证的手机：未设置</small></div>
										</c:if>
										<c:if test="${user.phone != '' && user.phone != null}">
											<div class="fore2"><small>您验证的手机：${user.phone } 若已丢失或停用，请立即更换</small></div>
										</c:if>
										
									</div>
									<div class="fore3">
										<a href="javascript:void(0)" onclick="window.location.href='../person/phonePage.do'">
											<div class="am-btn am-btn-secondary">${user.phone == '' || user.phone == null ? "设置" : "换绑" }</div>
										</a>
									</div>
								</li>
								<li>
									<i class="i-safety-mail"></i>
									<div class="m-left">
										<div class="fore1">邮箱验证</div>
										<c:if test="${user.email == '' || user.email == null}">
											<div class="fore2"><small>您验证的邮箱:未设置</small></div>
										</c:if>
										<c:if test="${user.email != '' && user.email != null}">
											<div class="fore2"><small>您验证的邮箱:${user.email}可用于快速找回登录密码</small></div>
										</c:if>
									</div>
									<div class="fore3">
										<a href="javascript:void(0)" onclick="window.location.href='../person/changeEmail.do'">
											<div class="am-btn am-btn-secondary">${user.email == '' || user.email == null ? "设置":"换绑"}</div>
										</a>
									</div>
								</li>
								<li>
									<i class="i-safety-idcard"></i>
									<div class="m-left">
										<div class="fore1">实名认证</div>
										<div class="fore2"><small>用于提升账号的安全性和信任级别，认证后不能修改认证信息。</small></div>
									</div>
									<div class="fore3">
										<a href="javascript:void(0)"  onclick="window.location.href='../person/idcardPage.do'">
											<div class="am-btn am-btn-secondary">认证</div>
										</a>
									</div>
								</li>
								<li>
									<i class="i-safety-security"></i>
									<div class="m-left">
										<div class="fore1">安全问题</div>
										<div class="fore2"><small>保护账户安全，验证您身份的工具之一。</small></div>
									</div>
									<div class="fore3">
										<a href="javascript:void(0)" onclick="window.location.href='../person/questionPage.do'">
											<div class="am-btn am-btn-secondary">${questionState == "1"?"已认证":"认证"}</div>
										</a>
									</div>
								</li>
							</ul>
						</div>
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