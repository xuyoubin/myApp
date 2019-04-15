<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
  String ctx = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
  <script src="../../js/jquery-1.9.1.min.js"></script>
  <link rel="stylesheet" href="../../css/pintuer.css">
  <link rel="stylesheet" href="../../css/admin.css">
  <link rel="stylesheet" href="../../css/alert.css">
  <script src="../../js/pintuer.js"></script>
  <script src="../../js/alert.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 添加用户</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="">
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="name" name="mpass" size="50" placeholder="请输入用户名"  />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户权限：</label>
        </div>
        <div class="field">
          <input type="radio" class="power" id="power1" name="power"  value="1" />管理员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" checked="checked" class="power" id="power2" name="power"  value="0"   />操作员
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">年龄：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="age" name="mpass" size="50" placeholder="请输入年龄"  />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="mpass" name="mpass" size="50" placeholder="请输入密码"  />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">确认密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="renewpass" name="renewpass" size="50" placeholder="请再次输入密码"  />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button id ="submitBtn" class="button bg-main icon-check-square-o" type="button"> 提交</button>
        </div>
      </div>      
    </form>
  </div>
</div>
</body></html>
<script>
    var imageright = '../images/alert/right.png';
    var imageerror = '../images/alert/error.png';
    var imagewarn = '../images/alert/warning.png';
    $(document).ready(function(){
        //提交数据表单
        $("#submitBtn").on("click", function(){
            var name = $.trim($("#name").val());
            var age = $.trim($("#age").val());
            var pwd = $.trim($("#mpass").val());
            var power = $("input:radio[name='power']:checked").val();
            var renewpass = $.trim($("#renewpass").val());
            if(!name ){
                jqAlaert("请输入用户名",imageerror);
                return;
            }
            if(!age   ){
                jqAlaert("请输入年龄",imageerror);
                return;
            }else if(isNaN(age)){
                jqAlaert("年龄不合法",imageerror);
                return;
            }
            if(!pwd ){
                jqAlaert("请输入密码",imageerror);
                return;
            }else if(!isNaN()){
                jqAlaert("密码由大于5位数字组成",imageerror);
                return;
            }else if(pwd.length<5){
                jqAlaert("密码不能小于5位",imageerror);
                return;
            }
            if (pwd !==renewpass ){
                jqAlaert("两次密码不一致",imageerror);
                return;
            }
            $.ajax({
                type:"post",
                url:"../user/register.do",
                data:{
                    name:name,
                    pwd:pwd,
                    age:age,
                    power:power
                },
                dataType: 'json',
                beforesend:function(){},
                success:function(result){
                    if(result.success){
                        jqAlaert("添加成功",imageright);
//                        setTimeout( window.location.reload(),100)
//                        window.location.reload();

//                        location.href="../user/register.do";
                    }else{
                        jqAlaert(result.note,imageerror);
                    }
                },
                complete : function(){

                }
            })
        })
        //校验表单
        function checkForm(name,pwd){
            var result = {success:true,msg:""};
            if(!name){
                result.success = false;
                result.msg = "用户名不能为空";
                return result
            }
            if(!pwd){
                result.success = false;
                result.msg = "密码不能为空";
                return result
            }
            return result;
        }
        //弹窗
        function jqAlaert(msg , image){
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
        }

    });


</script>