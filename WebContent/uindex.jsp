<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>用户服务中心</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
</head>
<body style="background-color: #f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				<img src="images/y.jpg" class="radius-circle rotate-hover"
					height="50" alt="" />用户服务中心
			</h1>
		</div>
		<div class=" margin-big-right  margin-big-top" align="right">
			<a class="button button-little bg-green" target="_blank"><span
				class="icon-user"></span>用户名:${name }</a> &nbsp;&nbsp;
			<!--    <a href="##" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> -->
			&nbsp;&nbsp;<a class="button button-little bg-red" href="login.jsp">
				<span class="icon-power-off"></span> 退出登录
			</a>
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<h2>
			<span class="icon-user"></span>个人管理
		</h2>
		<ul>
			<li><a href="./changeruser.jsp" target="right"><span
					class="icon-caret-right"></span>修改个人信息</a></li>
			<li><a href="./guahao.jsp" target="right"><span
					class="icon-caret-right"></span>挂号</a></li>
		</ul>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
		});
	</script>
	<ul class="bread">
		<li><a href="./getAllNew?pageNum=1&pageSize=3" target="right"
			class="icon-home"> 首页</a></li>
		<li><a href="##" id="a_leader_txt">网站信息</a></li>
		<!--  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a> </li> -->
	</ul>
	<div class="admin">
		<iframe scrolling="auto" rameborder="0"
			src="./getAllNew?pageNum=1&pageSize=3" name="right" width="100%"
			height="100%"></iframe>
	</div>
	<script>
	var jsUrlHelper = {
		    getUrlParam : function(url, ref) {
		        var str = "";

		        // 如果不包括此参数
		        if (url.indexOf(ref) == -1)
		            return "";

		        str = url.substr(url.indexOf('?') + 1);

		        arr = str.split('&');
		        for (i in arr) {
		            var paired = arr[i].split('=');

		            if (paired[0] == ref) {
		                return paired[1];
		            }
		        }

		        return "";
		    },
		    putUrlParam : function(url, ref, value) {

		        // 如果没有参数
		        if (url.indexOf('?') == -1)
		            return url + "?" + ref + "=" + value;

		        // 如果不包括此参数
		        if (url.indexOf(ref) == -1)
		            return url + "&" + ref + "=" + value;

		        var arr_url = url.split('?');

		        var base = arr_url[0];

		        var arr_param = arr_url[1].split('&');

		        for (i = 0; i < arr_param.length; i++) {

		            var paired = arr_param[i].split('=');

		            if (paired[0] == ref) {
		                paired[1] = value;
		                arr_param[i] = paired.join('=');
		                break;
		            }
		        }

		        return base + "?" + arr_param.join('&');
		    },
		    delUrlParam : function(url, ref) {

		        // 如果不包括此参数
		        if (url.indexOf(ref) == -1)
		            return url;

		        var arr_url = url.split('?');

		        var base = arr_url[0];

		        var arr_param = arr_url[1].split('&');

		        var index = -1;

		        for (i = 0; i < arr_param.length; i++) {

		            var paired = arr_param[i].split('=');

		            if (paired[0] == ref) {

		                index = i;
		                break;
		            }
		        }

		        if (index == -1) {
		            return url;
		        } else {
		            arr_param.splice(index, 1);
		            return base + "?" + arr_param.join('&');
		        }
		    }
		};
		function getQueryVariable(variable) {
			var query = window.location.search.substring(1);
			var vars = query.split("&");
			for (var i = 0; i < vars.length; i++) {
				var pair = vars[i].split("=");
				if (pair[0] == variable) {
					return pair[1];
				}
			}
			return (false);
		}
		if (getQueryVariable("refresh") == "true") {
			alert("修改个人信息成功！");
			jsUrlHelper.delUrlParam(window.location.href,'refresh')
		}
	</script>
</body>
</html>