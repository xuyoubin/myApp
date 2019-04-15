<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	 <%@ include file="/WEB-INF/jsp/person/head.jsp" %> 
	<head>
		<title>实名认证</title>
		<link href="../css/stepstyle.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div class="nav-table">
			<div class="long-title"><span class="all-goods">全部分类</span></div>
		</div>
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<form id="myform" action="../person/checkCard.do" enctype="multipart/form-data" method="post">
				<div class="main-wrap">
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">实名认证</strong> / <small>Real&nbsp;authentication</small></div>
					</div>
					<hr/>
					<div class="authentication">
						<p class="tip">请填写您身份证上的真实信息，以用于报关审核</p>
						<div class="authenticationInfo">
							<p class="title">填写个人信息</p>
							<div class="am-form-group">
								<label for="user-name" class="am-form-label">真实姓名</label>
								<div class="am-form-content">
									<input type="text" id="user-name" name="realname" placeholder="请输入您的真实姓名">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-IDcard" class="am-form-label">身份证号</label>
								<div class="am-form-content">
									<input type="tel" id="user-IDcard" name="idcard" placeholder="请输入您的身份证信息">
								</div>
							</div>
						</div>
						<div class="authenticationPic">
							<p class="title">上传身份证照片</p>
							<p class="tip">请按要求上传身份证</p>
							<ul class="cardlist">
								<li>
									<div class="cardPic">
										<input type="file" id="upidcard1" name="cardpic1" style="display:none;"/>
										<img id="icadrd1" src="../images/addimage.jpg">
										<p class="titleText">身份证正面</p>
									</div>
									<div class="cardExample">
										<img src="../images/idcard2.png">
										<p class="titleText">示例</p>										
									</div>
									
								</li>
								<li>
									<div class="cardPic">
										<img src="../images/addimage.jpg">
										<p class="titleText">身份证背面</p>
									</div>
									<div class="cardExample">
										<img src="../images/idcardfm.png">
										<p class="titleText">示例</p>										
									</div>
									
								</li>
							</ul>
						</div>
						<div class="info-btn">
							<div class="am-btn am-btn-danger" id="submitBtn">提交</div>
						</div>
					</div>
				</div>
				</form>
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
	$("#icadrd1").on("click",function(){//
		$("#upidcard1").click();
		$("#upidcard1").on("change",function(){
			var imageDom = $("#icadrd1")[0];//获取imagedom对象
			var file = $("#upidcard1")[0].files[0];
			if(file){
				if((file.type).indexOf("image/")==-1){
					alert("请选择图片!");
					return;
				}else{
					var filename = $("#upidcard1").val();
					var sufferindex = filename.lastIndexOf(".");
					var suffer = filename.substring(sufferindex+1).toUpperCase();
					if(suffer!="BMP"&&suffer!="JPG"&&suffer!="JPEG"&&suffer!="PNG"&&suffer!="GIF"){  
					    alert("抱歉，目前图片格式仅支持BMP、JPG、JPEG、PNG、GIF!"); 
					    return;
					}  
					var reader = new FileReader();
					reader.onloadend =function(){
						imageDom.src = reader.result;
					}
					reader.readAsDataURL(file);
				}
			}
			
		})
	})
	$("#submitBtn").click(function(){
		$("#myform").submit();
	})
})
</script>