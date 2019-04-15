<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	 <%@ include file="/WEB-INF/jsp/person/head.jsp" %> 
	<head>
		<title>绑定手机</title>
		<link href="../css/stepstyle.css" rel="stylesheet" type="text/css">
		<!-- <script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script> -->
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
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">绑定手机</strong> / <small>Bind&nbsp;Phone</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">绑定手机</p>
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
						<div class="am-form-group bind">
							<label for="user-phone" class="am-form-label">验证手机</label>
							<div class="am-form-content">
								<span id="user-phone">${user.phone }</span>
							</div>
						</div>
						<div class="am-form-group code">
							<label for="user-code" class="am-form-label">验证码</label>
							<div class="am-form-content">
								<input type="tel" id="user-code" placeholder="短信验证码">
							</div>
							<a class="btn" href="javascript:void(0);" onclick="sendMobileCode();" id="sendMobileCode">
								<div class="am-btn am-btn-danger">验证码</div>
							</a>
						</div>
						<div class="am-form-group">
							<label for="user-new-phone" class="am-form-label">验证手机</label>
							<div class="am-form-content">
								<input type="tel" id="user-new-phone" placeholder="绑定新手机号">
							</div>
						</div>
						<div class="am-form-group code">
							<label for="user-new-code" class="am-form-label">验证码</label>
							<div class="am-form-content">
								<input type="tel" id="user-new-code" placeholder="短信验证码">
							</div>
							<a class="btn" href="javascript:void(0);" onclick="sendMobileCode();" id="sendMobileCode">
								<div class="am-btn am-btn-danger">验证码</div>
							</a>
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
			var newphone = $.trim($("#user-new-phone").val());
			var result = checkPhone(newphone);
			if(!result.success){
				jqAlaert(result.msg,imageerror);
				return;
			}
			$.ajax({
				type:"post",
				url:"../person/bindPhone.do",
				data:{
					newphone:newphone,	
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
	
function checkPhone(newphone){
	var result = {success:true,msg:""};
	var phoneReg = /^(13\d|14[57]|15[012356789]|18\d|17[013678])\d{8}$/;
	if(!newphone){
		result.success = false;
		result.msg = "手机号码不能为空";
		return result;
	}else{
		if(!phoneReg.test(newphone)){
			result.success = false;
			result.msg = "手机格式不正确";
			return result;
		}
	}
	return result;
} 
</script>