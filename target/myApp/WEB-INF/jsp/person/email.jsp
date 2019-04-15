<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	 <%@ include file="/WEB-INF/jsp/person/head.jsp" %> 
	<head>
		<title>验证邮箱</title>
		<!-- <script src="../js/myJs/common.js"></script> -->
		<link href="../css/stepstyle.css" rel="stylesheet" type="text/css">
		<!-- <script src="../js/amazeUI/amazeui.js"></script> -->
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
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">绑定邮箱</strong> / <small>Email</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">验证邮箱</p>
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
							<label for="user-email" class="am-form-label">邮箱地址</label>
							<div class="am-form-content">
								<input type="hidden" id="userEmail" value="${user.email }"/>
								<input type="email" id="user-email" name="eamil" placeholder="请输入邮箱地址">
							</div>
						</div>
						<c:if test="${user.email != '' && user.email != null}">
							<div class="am-form-group code">
								<label for="user-code" class="am-form-label">验证码</label>
								<div class="am-form-content">
									<input type="tel" id="user-code" placeholder="验证码">
								</div>
								<a class="btn" href="javascript:void(0);" onclick="sendMobileCode();" id="sendMobileCode">
									<div class="am-btn am-btn-danger">验证码</div>
								</a>
							</div>
						</c:if>
						
						<div class="info-btn">
							<c:if test="${user.email != '' && user.email != null}">
								<div style="margin-bottom:15px; display:none;" id="timeval">
									<span id="time" style="color:red;font-size:32px"></span>后重新获取
								</div>
							</c:if>
							
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
var yzm="";
var tt=60;
/* var imageright = '../images/alert/right.png';
var imageerror = '../images/alert/error.png';
var imagewarn = '../images/alert/warning.png'; */
$(document).ready(function() {
	$("#submitBtn").on("click",function(){
		var oldemail = $("#userEmail").val();
		var newemail = $("#user-email").val();
		var code = $("#user-code").val();
		if(!newemail){
			jqAlaert("请输入邮箱",imagewarn);
			return;
		}
		if(oldemail){//判断验证码是否正确
			if(!code){
				jqAlaert("请输入验证码",imagewarn);
				return;
			}
			if(yzm != code){
					jqAlaert("验证码错误或已经过期",imagewarn);
					return;
			}
		}
		//获取验证码
		$.ajax({
			type:"post",
			url:"../person/saveEmail.do",
			data:{
				email:newemail
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
				
			},
		});
		
	})
})

function sendMobileCode(){
	$("#timeval").css("display","block");
	$("#sendMobileCode").removeAttr("onclick");
	//获取验证码
	$.ajax({
		type:"post",
		url:"../person/sendYzm.do",
		data:{
		},
		dataType:"json",
		success:function(result){
			if(result.success){
				jqAlaert("发送成功，请查看邮箱",imageright);
				yzm = result.yzm;
			}else{
				jqAlaert(result.note,imageerror);
			}
		},
		complete:function(){
		},
	});
	
	
	time();
	
	
}

//一分钟内，禁止一直获取验证码
function time() {
      if (tt < 1) {
      	$("#timeval").css("display","none");
      	$("#sendMobileCode").attr("onclick","sendMobileCode();");
      	yzm="";
      	tt=60;
      	 return;
      };
      tt--;
      $("#time").text(tt);
      window.setTimeout("time()",1000);
}

//弹窗
/* function jqAlaert(msg , image){
	 // 判断是否已存在，如果已存在则直接显示
	 var M = {}
	if(M.dialog11){
	    return M.dialog11.show();
	}
	M.dialog11 = jqueryAlert({
	    'icon'    : image,
	    'content' : msg,
	    'closeTime' : 2000,
	})
} */
</script>
