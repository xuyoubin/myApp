<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<%@ include file="/WEB-INF/jsp/person/head.jsp" %>
	<head>
		<title>个人资料</title>
	</head>

	<body>
        <div class="nav-table">
		 	<div class="long-title"><span class="all-goods">全部分类</span></div>
		</div>
		<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">
								<input type="file" id="upload"  allowexts="gif,jpeg,jpg,png,bmp" accept="images/*" style="display:none">
								<img id="headimg" class="am-circle am-img-thumbnail" src="${info.headurl =='' || info.headurl == null ? '../images/getAvatar.do.jpg' : info.headurl }" alt="" /> 
								<!--  <input type="file" id ="upload" style="display: none"/ >
								<br>
								<img src="" id="img" height="200" width="300"  />  -->
							
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>${user.name }</i></b></div>
								<div class="vip">
                                      <span></span><a href="#">会员专享</a>
								</div>
							</div>
						</div>

						<!--个人信息 -->
						<div class="info-main">
							<form class="am-form am-form-horizontal">

								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">昵称</label>
									<div class="am-form-content">
										<input type="text" id="nickname" placeholder="nickname" value="${info.nickname }">
                                          <small>昵称长度不能超过40个汉字</small>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">姓名</label>
									<div class="am-form-content">
										<input type="text" id="realname" placeholder="name" value="${info.realname }">
                                         
									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<input type="hidden" id="userSex" value="${info.sex }"/>
									<div class="am-form-content sex">
										<label class="am-radio-inline">
											<input type="radio" name="sex" value="1"  data-am-ucheck> 男
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="sex" value="2" data-am-ucheck> 女
										</label>
									</div>
								</div>

								<div class="am-form-group">
									<input type="hidden" id="birthdayVal" value="${info.birthday}"/>
									<label for="user-birth" class="am-form-label">生日</label>
									<div class="am-form-content birth">
										<div class="birth-select">
											<select data-am-selected id="select_year">
												<!-- <option value="2015">2015</option>
												<option value="1986">1986</option>-->
											</select>
											<em>年</em>
										</div>
										<div class="birth-select2"  >
											<select data-am-selected id="select_month">
												<!-- <option value="a">12</option>
												<option value="b">8</option> -->
											</select>
											<em>月</em></div>
										<div class="birth-select2">
											<select  data-am-selected  id="select_day" >
												<!-- <option value="a">21</option>
												<option value="b">23</option> -->
											</select>
											<em>日</em></div>
									</div>
							
								</div>
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="phone" placeholder="telephonenumber" type="tel" value="${info.phone }">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="email" placeholder="Email" type="email" value="${info.email }">

									</div>
								</div>
								<div class="info-btn">
									<div class="am-btn am-btn-danger" id = "submitBtn">保存修改</div>
								</div>

							</form>
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
<script>
$(document).ready(function(){
	//年份赋值
	var date = new Date()
	var year = date.getFullYear();
	for(var i=year-99;i<year+1;i++){
		var html = "<option value='"+i+"'>"+i+"</option>";
		$("#select_year").append(html);
	}
	//给月份下拉框值
	for(var i=1;i<13;i++){
		if(i<10){
			var html = "<option value='0"+i+"'>0"+i+"</option>";
		}else{
			var html = "<option value='"+i+"'>"+i+"</option>";
		}
		$("#select_month").append(html);
	}
	//月下拉框给值
	for(var i=1;i<32;i++){
		if(i<10){
			var html = "<option value='0"+i+"'>0"+i+"</option>";
		}else{
			var html = "<option value='"+i+"'>"+i+"</option>";
		}
		
		$("#select_day").append(html);
		
	}
	
	
	//如果Info为null sex为underfind，给性别赋值
	var sex = $("#userSex").val();
	if(sex){
		if(sex == 1){
		$(":radio[name='sex'][value='1']").attr("checked",true);
		}
		if(sex ==2){
			$(":radio[name='sex'][value='2']").attr("checked",true);
		}
	}
	
	//出生日期赋值
	var birthday = $("#birthdayVal").val();
	if($.trim(birthday)){
		var year = birthday.toString().substring(0,4);
		var month = birthday.toString().substring(4,6);
		var day = birthday.toString().substring(6,8);
		$("#select_year").val(year);
		$("#select_month").val(month);
		$("#select_day").val(day);
	}
	//提交表单数据
    $("#submitBtn").on("click",function(){
    		var year = $("#select_year").val();
			var month = $("#select_month").val();
			var day = $("#select_day").val();
            var nickname = $.trim($("#nickname").val());
			var realname = $.trim($("#realname").val());
			var phone = $.trim($("#phone").val());
			var email = $.trim($("#email").val());
			var sex = $(":radio[name='sex']:checked").val();
			var userid = ${user.id}
    	    $("body").mask();
			$.ajax({
				type:"post",
				url:"../person/saveInfo.do",
				data:{
					nickname:nickname,
					realname:realname,
					phone:phone,
					email:email,
					sex:sex,
					birthday:year+month+day,
					userid:userid
				},
				dataType: 'json',
				beforesend:function(){},
				success:function(result){
					if(result.success){
						/* image = '../images/alert/right.png';
						jqAlaert(null,image); */
						jqAlaert("保存成功",imageright);
					}else{
						/* image = '../images/alert/error.png';
						jqAlaert(result.note,image); */
						jqAlaert(result.note,imageerror);
					}
				},
				complete : function(){
                   $("body").unmask();
                }
			})
    })
    
    //头像预览
    $("#headimg").on('click',function(){
		$("#upload").click(); 
		$("#upload").on("change",function(){
			var preview = $("#headimg")[0];
			var file = $("input[type='file']")[0].files[0];
			var reader = new FileReader();
			reader.onloadend = function() {
				preview.src = reader.result;
			}
			if (file) {
				reader.readAsDataURL(file);
			} else {
				preview.src = "";
			}
		}); 
	});
})

//弹窗
/* function jqAlaert(msg,image){
	 // 判断是否已存在，如果已存在则直接显示
	 var M = {}
	 if(msg == null){
	 	msg = "保存成功"
	 }
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