<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	 <%@ include file="/WEB-INF/jsp/person/head.jsp" %> 
	<head>
		<title>支付密码</title>
		<script type="text/javascript" src="../js/MD5/md5.js"></script>
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
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">支付密码</strong> / <small>Set&nbsp;Pay&nbsp;Password</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">设置支付密码</p>
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
							<label for="user-password" class="am-form-label">支付密码</label>
							<div class="am-form-content">
								<input type="password" id="user-password" placeholder="6位数字">
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
$(document).ready(function(){
 	$("#submitBtn").on('click',function(){
		var paypwd = $.trim($("#user-password").val());
		var conpwd = $.trim($("#user-confirm-password").val());
		var result = checkPaypwd(paypwd,conpwd);
		if(!result.pass){
			jqAlaert(result.tip,imageerror);
			return;
		}
		$.ajax({
			type:"post",
			url:"../person/payPwd.do",
			data:{
				paypwd:hex_md5(paypwd),
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
//支付密码校验
function checkPaypwd(paypwd,conpwd){
	var result = {pass:true,tip:""};
	var pwdReg= /^\d{6}$/;
	if(!paypwd){
		result.tip = "请输入支付密码";
		result.pass = false;
	    return result;
	}else{
		if(!pwdReg.test(paypwd)){
			result.tip = "支付密码为6位数字";
			result.pass = false;
		    return result;
		}
		if (/^(\d)\1+$/.test(paypwd)){
			result.tip = "不能是一样的数字";
			result.pass = false;
		    return result;
		}
		// 顺增
		var pwd = paypwd.replace(/\d/g, function($0, pos) {
        	return parseInt($0)-pos;
	    });
	    if (/^(\d)\1+$/.test(pwd)) {
	    	result.tip = "不能是连续数字";
			result.pass = false;
		    return result;
	    } 
	    // 顺减
	    pwd = paypwd.replace(/\d/g, function($0, pos) {
	        return parseInt($0)+pos;
	    });
	    if (/^(\d)\1+$/.test(pwd)) {
	    	result.tip = "不能是连续数字";
			result.pass = false;
		    return result;
	    }
	}
	if(paypwd !=conpwd){
		result.tip = "两次密码不一致";
		result.pass = false;
	    return result;
	}
	return result;
}

</script>