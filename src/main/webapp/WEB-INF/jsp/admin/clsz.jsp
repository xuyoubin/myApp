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
    <div class="panel-head"><strong class="icon-reorder"> 策略设置</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <button type="button" class="button border-green" onclick="plSet()"> 批量设置</button>
          <div class="button-group"  style="padding-left: 200px">
            <a class="button border-red" href="javascript:void(0);" onclick="clsz('17:30:00','6:00:00','您确认要启用春季策略吗？')"><span class=""></span> 春季策略</a>
            <a class="button border-red" href="javascript:void(0);" onclick="clsz('18:30:00','5:00:00','您确认要启用夏季策略吗？')"><span class=""></span> 夏季策略</a>
            <a class="button border-red" href="javascript:void(0);" onclick="clsz('18:00:00','5:30:00','您确认要启用秋季策略吗？')"><span class=""></span> 秋季策略</a>
            <a class="button border-red" href="javascript:void(0);" onclick="clsz('17:00:00','6:00:00','您确认要启用冬季策略吗？')"><span class=""></span> 冬季策略</a>
           <%-- <p style="color: red" id="clShow">当前策略：夏季策略</p>--%>
          </div>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="120">选择</th>
        <th>ID</th>
        <th>编号</th>
        <th>开灯时间</th>
        <th>关灯时间</th>
        <th width="25%">地址</th>
        <th width="120">路灯状况</th>
        <th>上次操作人员</th>
        <th>操作</th>
      </tr>
      <c:if test="${pg.list.size() gt 0}">
      <c:forEach items="${pg.list}" var="item" varStatus="state">
        <tr>
          <td><input type="checkbox" name="id[]" value="${item.id}" hiddenVal="${item.number}" />
          </td>
          <td>${state.count}</td>
          <td>${item.number}</td>
          <td>${item.opentime}</td>
          <td>${item.closetime}</td>
          <td>${item.azaddress}</td>
          <td>${item.state eq 0 ? "正常":"损坏"}</td>
          <td>${item.czpeople}</td>
          <td   style="border-bottom: 1px;border-bottom-style: solid; border-bottom-color: #ddd;"><div class="button-group"> <a class="button border-green" href="../road/timePage.do?number=${item.number}&id=${item.id}&pageIndex=${pg.pageNum}"><span class=""></span> 设置</a> </div></td>
        </tr>
      </c:forEach>
      <tr>
        <td colspan="8">
          <div class="pagelist">
            <a href="../road/time.do?pageIndex=1">首页</a>
            <c:if test="${pg.pageNum gt 1}">
              <a href="../road/time.do?pageIndex=${pg.pageNum-1}" >上一页</a>
            </c:if>

            <%--<span class="current">1</span><a href="">2</a><a href="">3</a>--%>
            <c:if test="${pg.pageNum lt pg.totalPage}">
              <a href="../road/time.do?pageIndex=${pg.pageNum+1}" >下一页</a>
            </c:if>
            <c:if test="${pg.totalPage ne 1}">
              <a href="../road/time.do?pageIndex=${pg.totalPage}" id="lastBtn">尾页</a>
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
  //全新按钮
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
  function clsz(openTime,closeTime,tips) {
      var t=confirm(tips);
      if (t==false) {
          return false
      }else{
          $("body").mask();
          $.ajax({
              type:"post",
              url:"../road/timeForSj.do",
              data:{
                  openTime:openTime,
                  closeTime:closeTime
              },
              dataType: 'json',
              beforesend:function(){},
              success:function(result){
                  if(result.success){
                      setTimeout( function(){
                          window.location.reload()
                          $("body").unmask()
                      },1000);
                  }else{
                      jqAlaert(result.note,imageerror);
                  }
              },
              complete : function(){
                  setTimeout(function () {jqAlaert("策略设置成功",imageright);},3000);
              }
          })
      }
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

  function plSet(){
      var str="";
      var roadNum ="";
      var Checkbox=false;
      $("input[name='id[]']").each(function(){
          if (this.checked==true) {
              str+=$(this).val()+";";
              roadNum+=$(this).attr("hiddenVal")+";";
              Checkbox=true;
          }
      });
      if(Checkbox){
//          alert(str);
//          alert(roadNum);
          window.location.href="../road/plSetTime.do?pageIndex=${pg.pageNum}&str="+str+"&num="+roadNum;
      }else {
          jqAlaert("请选择路灯",imagewarn);
      }


  }
</script>
</body></html>