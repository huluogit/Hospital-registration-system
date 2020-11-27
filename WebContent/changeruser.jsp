<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String context = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>添加用户</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/transition.js"></script>
<script src="js/collapse.js"></script>
<script src="js/ie-emulation-modes-warning.js"></script>
<script type="text/javascript" src="js/dropdown.js"></script>
</head>
<script>
</script>
<body>
	<div class="panel admin-panel">
		<div class="panel-head">
			<strong><span class="icon-pencil-square-o"></span> 修改用户信息</strong>
		</div>
		<c:forEach items="${user}" var="usr">
			<div class="body-content">


				<form method="post" class="form-x" action="updateUser">
				<div class="form-group" >
						<div class="label" style="display:none">
							<label>用户id</label>
						</div>
						<div class="field" style="display:none">
							<input type="text" name="id" readonly="readonly"
								value="${usr.id }" style="width: 25%; float: left;"
								class="input" />
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label>用户名</label>
						</div>
						<div class="field">
							<input type="text" name="username" 
								value="${usr.uname }" style="width: 25%; float: left;"
								class="input" />
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label>用户密码：</label>
						</div>
						<div class="field">
							<input type="password" name="password" value="${usr.pwd }"
								style="width: 25%; float: left;" class="input" />
						</div>

					</div>
					<div class="form-group">
						<div class="label">
							<label>联系方式：</label>
						</div>
						<div class="field">
							<!-- 	<input type="text" name="dTel"   class="input" style="width: 25%; float: left; value="${doctot.dTel}"/> -->
							<input type="text" class="input" name="tel" value="${usr.tel}"
								style="width: 25%; float: left;" class="input" />
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label>用户描述：</label>
						</div>
						<div class="field">
							<textarea class="input" name="info" value=""
								style="width: 50%; float: left">${usr.info }</textarea>
						</div>
					</div>
					<div class="field" align="center">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>
			</div>
		</c:forEach>
		</form>
	</div>

</body>
</html>