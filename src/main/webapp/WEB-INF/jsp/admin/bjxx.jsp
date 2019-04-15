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
  <script src="../../loadmask/jquery.loadmask.min.js"></script>
  <link rel="stylesheet" href="../../css/pintuer.css">
  <link rel="stylesheet" href="../../css/admin.css">
  <link rel="stylesheet" href="../../css/alert.css">
  <link rel="stylesheet" href="../../loadmask/jquery.loadmask.css" />
  <script src="../../js/alert.js"></script>
</head>
<body>
<form method="post" action="">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 警报信息</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <button type="button" class="button border-green" onclick="setSelect()"> 批量处理</button>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="120">选择</th>
        <th>ID</th>
        <th>编号</th>
        <th>电流（A）</th>
        <th>电压（U）</th>
        <th width="25%">地址</th>
        <th width="120">路灯状况</th>
        <th>上次处理人员</th>
        <th>操作</th>
      </tr>
      <c:if test="${pg.list.size() gt 0}">
        <c:forEach items="${pg.list}" var="item" varStatus="state">
          <tr>
            <td><input type="checkbox" name="id[]" value="${item.id}" />
            </td>
            <td>${state.count}</td>
            <td>${item.number}</td>
            <td >${item.dl}</td>
            <td >${item.dy}</td>
            <td>${item.azaddress}</td>
            <td>${item.state eq 0 ? "正常":"损坏"}</td>
            <td>${item.czpeople}</td>
            <td   style="border-bottom: 1px;border-bottom-style: solid; border-bottom-color: #ddd;"><div class="button-group"> <a class="button border-green" href="javascript:void(0)" onclick="setRoad(${item.id})"><span class=""></span> 处理</a> </div></td>
          </tr>
        </c:forEach>
        <tr>
          <td colspan="8">
            <div class="pagelist">
              <a href="../road/jbxx.do?pageIndex=1">首页</a>
              <c:if test="${pg.pageNum gt 1}">
                <a href="../road/jbxx.do?pageIndex=${pg.pageNum-1}" >上一页</a>
              </c:if>

                <%--<span class="current">1</span><a href="">2</a><a href="">3</a>--%>
              <c:if test="${pg.pageNum lt pg.totalPage}">
                <a href="../road/jbxx.do?pageIndex=${pg.pageNum+1}" >下一页</a>
              </c:if>
              <c:if test="${pg.totalPage ne 1}">
                <a href="../road/jbxx.do?pageIndex=${pg.totalPage}" id="lastBtn">尾页</a>
              </c:if>
              <span class="current">共${pg.totalPage}页 当前第${pg.pageNum}页</span>
            </div>
          </td>
        </tr>

      </c:if>
      <c:if test="${pg.list.size() le 0}">
        <td style="margin-right: 100px">无记录</td>
      </c:if>
    </table>
  </div>
</form>
<script type="text/javascript">
    var imageright = '../images/alert/right.png';
    var imageerror = '../images/alert/error.png';
    var imagewarn = '../images/alert/warning.png';
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})
function setSelect(){
    var str="";
    var Checkbox=false;
    $("input[name='id[]']").each(function(){
        if (this.checked==true) {
            str+=$(this).val()+";";
            Checkbox=true;
        }
    });
    if (Checkbox){
        str = str.substring(0,str.length-1)
        var idArray = str.split(";");
        idArray.forEach(function(val,index){
            console.log(val);
            $.ajax({
                type:"post",
                url:"../road/update.do",
                data:{
                    id:val,
                    state:0
                },
                dataType: 'json',
                beforesend:function(){},
                success:function(result){
                },
                complete : function(){
                }
            })
        });
        jqAlaert("修复操作成功",imageright)
        setTimeout( function(){window.location.reload()},1500);
        }else {
        jqAlaert("请选择路灯",imagewarn);
    }

}
function setRoad(id) {
    $.ajax({
        type:"post",
        url:"../road/update.do",
        data:{
            id:id,
            state:0
        },
        dataType: 'json',
        beforesend:function(){},
        success:function(result){
            if(result.success){
                jqAlaert("路灯修复成功",imageright)
                setTimeout( function(){window.location.reload()},1500);
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
</script>
</body></html>