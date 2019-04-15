<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	 <%@ include file="/WEB-INF/jsp/person/head.jsp" %> 
	<head>
		<title>修改密码</title>
		<!-- <script src="../js/myJs/common.js"></script> -->
		<script type="text/javascript" src="../js/MD5/md5.js"></script>
		<link href="../css/stepstyle.css" rel="stylesheet" type="text/css">
	    <!-- <script src="../js/amazeUI/amazeui.js"></script>  -->
	</head>
	<body>
        <div class="nav-table">
			<div class="long-title"><span class="all-goods">全部分类</span></div>				 
		</div>
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<form class="am-form am-form-horizontal">
						<div class="am-form-group">
							<label for="user-old-password" class="am-form-label">原密码</label>
							<div class="am-form-content">
								<input type="password" id="user-old-password" placeholder="请输入原登录密码">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-new-password" class="am-form-label">新密码</label>
							<div class="am-form-content">
								<input type="password" id="user-new-password" placeholder="由数字、字母组合">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-confirm-password" class="am-form-label">确认密码</label>
							<div class="am-form-content">
								<input type="password" id="user-confirm-password" placeholder="请再次输入上面的密码">
							</div>
						</div>
						<div class="info-btn">
							<div class="am-btn am-btn-danger" id="submitBtn">保存修改</div>
						</div>
					</form>
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
		$("#submitBtn").on('click',function(){
			var oldpwd = $.trim($("#user-old-password").val());
			var newpwd = $.trim($("#user-new-password").val());
			var conpwd = $.trim($("#user-confirm-password").val());
			var result = checkPwd(oldpwd,newpwd,conpwd);
			if(!result.pass){
				jqAlaert(result.tip,imageerror);
				return;
			}
			$.ajax({
				type:"post",
				url:"../person/changePwd.do",
				data:{
					oldpwd:hex_md5(oldpwd),
					newpwd:hex_md5(newpwd),
				},
				dataType:"json",
				success:function(result){
					if(result.success){
						jqAlaert("保存成功",imageright);
						stepStyle();
					}else{
						jqAlaert(result.note,imageerror);
					}
				},
				complete:function(){
					
				}
			});
		
		})	
	})
</script>