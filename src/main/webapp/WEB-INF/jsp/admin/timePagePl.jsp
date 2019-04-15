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
  <div class="panel-head"><strong><span class="icon-key"></span> 时间设置</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="">
      <div class="form-group">
        <div class="label">
          <label for="sitename">路灯编号：</label>
        </div>
        <div class="field">
          <span >${num}</span>
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
          <button class="button bg-main icon-check-square-o" onclick="updateRoad('${str}')" type="button"> 提交</button>
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
    function updateRoad(str) {
        var opentime = $("#hideVal1").val();
        var closetime = $('#hideVal2').val();
        if(!opentime || !closetime){
            jqAlaert("请选择开灯时间和关灯时间",imageright)
            return;
        }
        str = str.substring(0,str.length-1)
        var idArray = str.split(";");
        idArray.forEach(function(val,index){
            console.log(val);
            $.ajax({
                type:"post",
                url:"../road/update.do",
                data:{
                    id:val,
                    opentime:opentime,
                    closetime:closetime
                },
                dataType: 'json',
                beforesend:function(){},
                success:function(result){
//                    if(result.success){
//
//                    }else{
//                        jqAlaert(result.note,imageerror);
//                    }
                },
                complete : function(){
                }
            })
        });
        jqAlaert("修改成功",imageright)

        setTimeout( function(){window.location.href="../road/time.do?pageIndex=${index}"},1500);
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
</script>