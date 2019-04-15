<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <title>登录</title>
    <script src="../../js/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="../../css/pintuer.css">
    <link rel="stylesheet" href="../../css/admin.css">
    <link rel="stylesheet" href="../../css/alert.css">
    <script src="../../js/pintuer.js"></script>
    <script src="../../js/alert.js"></script>
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form action="index.jsp" method="post">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>智能路灯管理系统</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" id="name" name="name" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"  id="nametips"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" id="pwd" name="pwd" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <!--<div class="form-group">-->
                        <!--<div class="field">-->
                            <!--<input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />-->
                           <!--<img src="images/passcode.jpg" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">  -->
                                                   <!---->
                        <!--</div>-->
                    <!--</div>-->
                </div>
                <%--<div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" id="submitBtn" value="登录"></div>--%>
                <div style="padding:30px;"><input type="button" class="button button-block bg-main text-big input-big" id="submitBtn" value="登录"></div>
            </div>
            </form>          
        </div>
    </div>
</div>
</body>
</html>
<script>
    var imageright = '../images/alert/right.png';
    var imageerror = '../images/alert/error.png';
    var imagewarn = '../images/alert/warning.png';
    $(document).ready(function(){
        //提交数据表单
        $("#submitBtn").on("click", function(){
            var name = $.trim($("#name").val());
            var pwd = $.trim($("#pwd").val());
//            var res = checkForm(name,pwd);
//            if(!res.success){
//                $("#nametips").text(res.msg);
//                return;
//            }
            $.ajax({
                type:"post",
                url:"../user/login.do",
                data:{
                    name:name,
                    pwd:pwd,
                },
                dataType: 'json',
                beforesend:function(){},
                success:function(result){
                    if(result.success){
                        location.href="../user/index.do";
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
