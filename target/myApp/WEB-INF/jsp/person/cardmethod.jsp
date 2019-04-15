<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	 <%@ include file="/WEB-INF/jsp/person/head.jsp" %> 
	
	<head>
		<title>银行卡绑定</title>
		<!-- <script src="../js/myJs/common.js"></script> -->
		<link href="../css/stepstyle.css" rel="stylesheet" type="text/css">
		 
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
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">银行卡绑定</strong> / <small>Bind&nbsp;Card</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">银行卡绑定</p>
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
							<label for="user-name" class="am-form-label">真实姓名</label>
							<div class="am-form-content">
								<input type="text" id="user-name" placeholder="请输入您的真实姓名">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-IDcard" class="am-form-label">身份证号</label>
							<div class="am-form-content">
								<input type="tel" id="user-IDcard" placeholder="请输入您的身份证信息">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-BankID" class="am-form-label">银行卡号</label>
							<div class="am-form-content">
								<input type="tel" id="user-BankID" placeholder="请输入要绑定的银行卡卡号">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">手机号码</label>
							<div class="am-form-content">
								<input type="tel" id="user-phone" placeholder="请输入此卡的预留手机号">
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
							<div class="am-btn am-btn-danger" id="submitBtn">开通协议并确定</div>
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
	$("#user-BankID").on('keyup',function(){
		var value = $(this).val();
		$(this).val(value.replace(/(\d{4})(?!\s)/g,'$1 '));
	})
	//保存银行卡
	$("#submitBtn").on('click',function(){
		var name =$.trim($("#user-name").val());
		var idcard =$.trim($("#user-IDcard").val());
		var idbank =$.trim($("#user-BankID").val().replace(/\s/g, ""));
		var phone =$.trim($("#user-phone").val());
		var result = checkForm(name,idcard,idbank,phone);
		if(!result.success){
			jqAlaert(result.msg,imagewarn);
			return;
		}
		//提交数据
		$.ajax({
			type:"post",
			url:"../person/addCard.do",
			data:{
				name:name,
				idcard:idcard,
				idbank:idbank,
				phone:phone,
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
				
				//setTimeout('reloadpage()', 1000);
			},
		});
	})
})

function checkForm(name,idcard,idbank,phone){
	var result = {success:true,msg:""};
	var phoneReg = /^(13\d|14[57]|15[012356789]|18\d|17[013678])\d{8}$/;
	if(!name){
		result.success = false;
		result.msg = "姓名不能为空";
		return result;
	}
	var r = IdentityCodeValid(idcard);
	if(!r.pass){
		result.success = false;
		result.msg = r.tip;
		return result;
	}
	var s = luhmCheck(idbank);
	if(!s.pass){
		result.success = false;
		result.msg = s.tip;
		return result;
	}
	if(!phone){
		result.success = false;
		result.msg = "手机号码不能为空";
		return result;
	}else{
		if(!phoneReg.test(phone)){
			result.success = false;
			result.msg = "手机格式不正确";
			return result;
		}
	}
	
	
	return result;
} 


</script>