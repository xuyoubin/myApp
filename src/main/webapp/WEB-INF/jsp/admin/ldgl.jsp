<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script src=" ../../js/alert.js"></script>
</head>
<body>
<form method="post" action="">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 路灯管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <button type="button" class="button border-yellow" onclick="window.location.href='../road/addPage.do'"><span class="icon-plus-square-o"></span> 添加</button>
          <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
          <button type="button" class="button border-red"  onclick="return DelSelect()"><span class="icon-trash-o"></span> 批量删除</button>

        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
          <th >选择</th>
        <th >ID</th>
        <th>编号</th>
        <th>安装人员</th>
        <th>生产厂家</th>
        <th width="25%">安装位置</th>
         <th>安装日期</th>
         <th width="120">备注</th>
        <th>操作</th>       
      </tr>
        <c:forEach items="${pg.list}" var="item" varStatus="status">
            <tr>
              <td><input type="checkbox" name="id[]" value="${item.id}" /></td>
                <td>${item.id}</td>
              <td>${item.number}</td>
              <td>${item.azpeople}</td>
               <td>${item.scgs}</td>
              <td>${item.azaddress}</td>
               <td><fmt:formatDate value="${item.azdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
              <td>${item.bz}</td>
              <td><div class="button-group"> <a class="button border-red" href="javascript:void(0)" onclick="return del(${item.id})"><span class="icon-trash-o"></span> 删除</a> </div></td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="8">
                <div class="pagelist">
                    <a href="../road/listPage.do?pageIndex=1">首页</a>
                    <c:if test="${pg.pageNum gt 1}">
                        <a href="../road/listPage.do?pageIndex=${pg.pageNum-1}" >上一页</a>
                    </c:if>

                    <%--<span class="current">1</span><a href="">2</a><a href="">3</a>--%>
                    <c:if test="${pg.pageNum lt pg.totalPage}">
                        <a href="../road/listPage.do?pageIndex=${pg.pageNum+1}" >下一页</a>
                    </c:if>
                    <c:if test="${pg.totalPage ne 1}">
                        <a href="../road/listPage.do?pageIndex=${pg.totalPage}" id="lastBtn">尾页</a>
                    </c:if>
                    <span class="current">共${pg.totalPage}页 当前第${pg.pageNum}页</span>
                </div>
            </td>
        </tr>
    </table>
  </div>
</form>
<script type="text/javascript">
    $(document).ready(function(){


    });

function del(id){
	if(confirm("您确定要删除吗?")){
        $.ajax({
            type:"post",
            url:"../road/delete.do",
            data:{
                parms:id
            },
            dataType: 'json',
            beforesend:function(){},
            success:function(result){

            },
            complete : function(){
                window.location.reload();
            }
        })
	}
}
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

function DelSelect(){
    var str="";
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {
          str+=$(this).val()+";";
          Checkbox=true;
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) {
		    return false
		}else{
//		    alert("sh"+str);
            $.ajax({
                type:"post",
                url:"../road/delete.do",
                data:{
                    parms:str
                },
                dataType: 'json',
                beforesend:function(){},
                success:function(result){

                },
                complete : function(){
                    window.location.reload();
                }
            })
        };
	} else{
		alert("请选择您要删除的内容!");
//		return false;
	}
}
</script>
</body></html>