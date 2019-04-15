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
    <title>智能路灯管理系统</title>
    <script src="../../js/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="../../css/pintuer.css">
    <link rel="stylesheet" href="../../css/admin.css">
    <link rel="stylesheet" href="../../css/alert.css">
    <script src="../../js/alert.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="../images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />智能路灯管理系统</h1>
  </div>
    <div class="head-l" style="margin-top: 30px" >&nbsp;&nbsp;&nbsp;<span style="color:white">你好，${user.name}</span></div>
  <div class="head-l" ><a class="button button-little bg-red"  href="../user/loginOut.do"><span class="icon-power-off"></span> 退出登录</a> </div>

</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <ul style="display:block">
    <li><a href="../road/listPage.do?pageIndex=1" target="right"><span class="icon-caret-right"></span>路灯管理</a></li>
    <li><a href="../road/contol.do?pageIndex=1" target="right"><span class="icon-caret-right"></span>路灯控制</a></li>
    <li><a href="../road/time.do?pageIndex=1" target="right"><span class="icon-caret-right"></span>策略设置</a></li>
    <li><a href="../road/jbxx.do?pageIndex=1" target="right"><span class="icon-caret-right"></span>警报信息</a></li>
      <li><a href="../user/userList.do" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
    <li><a href="../user/handbook.do" target="right"><span class="icon-caret-right"></span>用户指南</a></li>

  </ul>
</div>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="../road/listPage.do?pageIndex=1" name="right" width="100%" height="100%"></iframe>
</div>
</body>
</html>
<script type="text/javascript">
    $(function(){
        $(".leftnav-title").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
</script>