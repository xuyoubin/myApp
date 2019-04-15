<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
  String ctx = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<script src="../../js/jquery-1.9.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="../../css/jeDate-test.css">
<link type="text/css" rel="stylesheet" href="../../css/jedate.css">
<script type="text/javascript" src="../../js/jquery.jedate.js"></script>
<script type="text/javascript" src="../../js/jedate-test.js"></script>
<link rel="stylesheet" href="../../css/pintuer.css">
<link rel="stylesheet" href="../../css/admin.css">
<link rel="stylesheet" href="../../css/alert.css">
<script src="../../js/alert.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 路灯添加</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="">
      <div class="form-group">
        <div class="label">
          <label for="sitename">路灯编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="number" name="mpass" size="50" placeholder="请输入编号"  />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">电流(A)：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="dl" name="mpass" size="50" placeholder="请输入电流"  value="1.5" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">电压(U)：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="dy" name="mpass" size="50" placeholder="请输入电压"  value="220" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">生产公司：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="scgs" name="mpass" size="50" placeholder="请输入生产公司"  />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">安装人员：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="azpeople" name="mpass" size="50" placeholder="请输入安装人员"  />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">安装地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="azaddress" name="mpass" size="50" placeholder="请输入安装地址"  />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">开灯时间：</label>
        </div>
        <div class="field">
          <div class="jeinpbox">
            <input type="text" class="jeinput" id="test05" placeholder="hh:mm:ss">
            <input type="hidden"  id="hideVal1" value="" >
          </div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">关灯时间：</label>
        </div>
        <div class="field">
          <div class="jeinpbox"><input type="text" class="jeinput" id="test050" placeholder="hh:mm:ss"></div>
          <input type="hidden"  id="hideVal2" value="" >
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" onclick="updateRoad(${id})" type="button"> 提交</button>
        </div>
      </div>      
    </form>
  </div>
</div>
</body></html>
<script type="text/javascript">
    var imageright = '../images/alert/right.png';
    var imageerror = '../images/alert/error.png';
    var imagewarn = '../images/alert/warning.png';
    //获取时间
    $('#test05').jeDate({
        format: 'hh:mm:ss',
        okfun: function(obj){
            console.log(obj.val);      //得到日期生成的值，如：2017-06-16
        $("#hideVal1").val(obj.val);
        }
    })
    $('#test050').jeDate({
        format: 'hh:mm:ss',
        okfun: function(obj){
            console.log(obj.val);      //得到日期生成的值，如：2017-06-16
            $("#hideVal2").val(obj.val);
        }
    })
    function updateRoad(id) {
        var number = $.trim($("#number").val());
        var dl = $.trim($("#dl").val());
        var dy = $.trim($("#dy").val());
        var scgs = $.trim($("#scgs").val());
        var azpeople = $.trim($("#azpeople").val());
        var azaddress = $.trim($("#azaddress").val());
        var opentime = $("#hideVal1").val();
        var closetime = $('#hideVal2').val();
        var ret = checkForm(number,dl,dy,scgs,azpeople,azaddress,opentime,closetime)
        if(!ret.success){
            jqAlaert(ret.msg,imageerror);
            return;
        }

        $.ajax({
            type:"post",
            url:"../road/add.do",
            data:{
                number:number,
                dl:dl,
                dy:dy,
                scgs:scgs,
                azpeople:azpeople,
                azaddress:azaddress,
                opentime:opentime,
                closetime:closetime
            },
            dataType: 'json',
            beforesend:function(){},
            success:function(result){
                if(result.success){

                    jqAlaert("添加成功",imageright)

                    setTimeout( function(){window.location.href="../road/listPage.do?pageIndex=1"},1500);


                }else{
                    jqAlaert(result.note,imageerror);
                }
            },
            complete : function(){
            }
        })
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

    function checkForm(number,dl,dy,scgs,azpeople,azaddress,opentime,closetime) {
        var reg = new RegExp(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6}$/);
        var result={success:true,msg:""};
        if(!reg.test(number)){
            result.success=false;
            result.msg="路灯编译由6位数字，字母组成"
            return result;
        }
        if(!scgs){
            result.success=false;
            result.msg="请输入生产公司"
            return result;
        }
        if(!azpeople){
            result.success=false;
            result.msg="请输入安装人员"
            return result;
        }
        if(!azaddress){
            result.success=false;
            result.msg="请输入安装地址"
            return result;
        }
        if(!opentime){
            result.success=false;
            result.msg="请选择开灯时间"
            return result;
        }
        if(!closetime){
            result.success=false;
            result.msg="请选择关灯时间"
            return result;
        }
       return result;

    }
</script>