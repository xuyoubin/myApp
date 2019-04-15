<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	 <%@ include file="/WEB-INF/jsp/person/head.jsp" %> 
	<head>
		<title>安全问题</title>
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
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">设置安全问题</strong> / <small>Set&nbsp;Safety&nbsp;Question</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">设置安全问题</p>
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
						<div class="am-form-group select">
							<label for="user-question1" class="am-form-label">问题一</label>
							<div class="am-form-content">
								<input type="hidden" id="select1" value="${answer.questionOne }"/>
								<select data-am-selected id="questionOne">
									<option value="0" selected>请选择安全问题</option>
									<c:forEach items="${list }" var="question" varStatus="i">
										<option value="${question.id }">${question.ques }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-answer1" class="am-form-label">答案</label>
							<div class="am-form-content">
								<input type="text" id="user-answer1" value="${answer.answerOne }" placeholder="请输入安全问题答案">
							</div>
						</div>
						<div class="am-form-group select">
							<label for="user-question2" class="am-form-label">问题二</label>
							<div class="am-form-content">
								<input type="hidden" id="select2" value="${answer.questionTwo }"/>
								<select data-am-selected id="questionTwo">
									<option value="0" selected>请选择安全问题</option>
									<c:forEach items="${list }" var="question" varStatus="i">
										<option value="${question.id }">${question.ques }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-answer2" class="am-form-label">答案</label>
							<div class="am-form-content">
								<input type="text" id="user-answer2" value="${answer.answerTwo }" placeholder="请输入安全问题答案">
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

$("#questionOne").val($("#select1").val());
$("#questionTwo").val($("#select2").val());

$(document).ready(function() {
	$(document).ready(function() {
		$("#submitBtn").on('click',function(){
			var qone = $("#questionOne").val();
			var qtwo = $("#questionTwo").val();
			var anone = $.trim($("#user-answer1").val());
			var antwo = $.trim($("#user-answer2").val());
			if(qone == 0 && qtwo == 0){
				jqAlaert("请选择至少一个问题",imageerror);
				return;
			}
			if(qone == qtwo){
				jqAlaert("两个问题不能一样",imageerror);
				return;
			}
			if(qone && qone !=0){
				if(!anone){
					jqAlaert("请输入问题1答案",imageerror);
					return;
				}
			}
			if(qtwo && qtwo !=0){
				if(!antwo){
					jqAlaert("请输入问题2答案",imageerror);
					return;
				}
			}
			$.ajax({
				type:"post",
				url:"../person/saveAnswer.do",
				data:{
					ques_one:qone,	
					ques_two:qtwo,
					an_one:anone,
					an_two:antwo,
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
})
</script>