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
  <script src="../../js/pintuer.js"></script>
  <script src="../../js/alert.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 用户管理</strong></div>
  <div class="padding border-bottom">
    <c:if test="${user.power eq 1}">
      <button type="button" class="button border-yellow" onclick="window.location.href='../user/addUser.do'"><span class="icon-plus-square-o"></span> 添加用户</button>
    </c:if>
  </div>
  <table class="table table-hover text-center">
    <tr>
      <th width="5%">ID</th>
      <th width="15%">用户名</th>
      <th width="10%">年龄</th>
      <th width="10%">创建日期</th>
    </tr>
    <c:forEach items="${list}" var="item" varStatus="status">
    <tr>
      <td>${status.count}</td>
      <td>${item.name}</td>
      <td>${item.age}</td>

      <td><fmt:formatDate value="${item.registertime}" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
    </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>