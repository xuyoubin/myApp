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
  <script src="../../js/alert.js"></script>
</head>
<body>
<form method="post" action="">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 路灯控制</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <button type="button" class="button border-green" onclick="contolerRoads(1,'批量打开成功')"> 批量打开</button>
          <button type="button" class="button border-gray" onclick="contolerRoads(0,'批量关闭成功')"> 批量关闭</button>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="120">选择</th>
        <th>ID</th>
        <th>编号</th>
        <th>路灯状态</th>
        <th>电流(A)</th>
        <th>电压(V)</th>
        <th width="25%">地址</th>
        <th width="120">路灯状况</th>
        <th>操作</th>
      </tr>
      <c:if test="${pg.list.size() gt 0}">
      <c:forEach items="${pg.list}" var="item" varStatus="state">
        <tr>
          <td><input type="checkbox" name="id[]" value="${item.id}" /></td>
          <td>${state.count}</td>
          <td>${item.number}</td>
          <td>${item.isopen eq 0 ? "关闭中":"打开中"}</td>
          <td>${item.isopen eq 0 ? "0":item.dl}</td>
          <td>${item.isopen eq 0 ? "0":item.dy}</td>
          <%--<td>${item.dl}</td>--%>
          <%--<td>${item.dy}</td>--%>
          <td>${item.azaddress}</td>
          <td>${item.state eq 0 ? "正常":"损坏"}</td>
          <td   style="border-bottom: 1px;border-bottom-style: solid; border-bottom-color: #ddd;">
            <div class="button-group">
              <c:if test="${item.isopen eq 0}">
                <a class="button border-green" href="javascript:void(0);" onclick="updateRoad(${item.id},1)"><span class=""></span> 打开</a>
              </c:if>
              <c:if test="${item.isopen eq 1}">
                <a class="button border-gray" href="javascript:void(0);" onclick="updateRoad(${item.id},0)"><span class=""></span> 关闭</a>
              </c:if>
            </div>
          </td>
        </tr>
      </c:forEach>
      <tr>
        <td colspan="8">
          <div class="pagelist">
            <a href="../road/contol.do?pageIndex=1">首页</a>
            <c:if test="${pg.pageNum gt 1}">
              <a href="../road/contol.do?pageIndex=${pg.pageNum-1}" >上一页</a>
            </c:if>

            <%--<span class="current">1</span><a href="">2</a><a href="">3</a>--%>
            <c:if test="${pg.pageNum lt pg.totalPage}">
              <a href="../road/contol.do?pageIndex=${pg.pageNum+1}" >下一页</a>
            </c:if>
            <c:if test="${pg.totalPage ne 1}">
              <a href="../road/contol.do?pageIndex=${pg.totalPage}" id="lastBtn">尾页</a>
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

  function updateRoad(id,parm) {
      $.ajax({
          type:"post",
          url:"../road/update.do",
          data:{
              id:id,
              isopen:parm
          },
          dataType: 'json',
          beforesend:function(){},
          success:function(result){
              if(result.success){
                  if(parm == 0){
                      jqAlaert("关闭操作成功",imageright)
                  }else{
                      jqAlaert("打开操作成功",imageright)
                  }

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
  function contolerRoads(isopen,tips){
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
                      isopen:isopen
                  },
                  dataType: 'json',
                  beforesend:function(){},
                  success:function(result){
                  },
                  complete : function(){
                  }
              })
          });
          jqAlaert(tips,imageright)
          setTimeout( function(){window.location.reload()},1500);
      }else {
          jqAlaert("请选择路灯",imagewarn);
      }

  }
</script>
</body></html>