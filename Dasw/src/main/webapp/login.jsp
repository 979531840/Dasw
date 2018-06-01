<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Expires" content="0"> 
<title>戴安进销存管理信息系统</title> 
<link href="<%=basePath%>/css/login.css" type="text/css" rel="stylesheet"> 
</head> 
<script type="text/javascript">
	function checkForm(){
		var userName=document.getElementById("userUsername").value;
		var password=document.getElementById("userPassword").value;
		if(userName==null || userName==""){
			document.getElementById("login_err").innerHTML="用户名不能为空";
			return false;
		}
		if(password==null || password==""){
			document.getElementById("login_err").innerHTML="密码不能为空";
			return false;
		}
		return true;
	}
</script>
<body> 

<div class="login">
    <div class="message">戴安管理信息-登录</div>
    <div id="darkbannerwrap"></div>
    
    <form action="<%=basePath%>user/login" method="post"  onsubmit="return checkForm()">
		<input name="action" value="login" type="hidden">
		<div id="login_tip">
				<span id="login_err"  >${errorMsg }</span>
		</div>
		<input id="userUsername" name="userUsername" placeholder="用户名"  type="text"  value="${user.userUsername }"  required >
		<hr class="hr15">
		<input id="userPassword" name="userPassword" placeholder="密码"  type="password" value="${user.userPassword }" required>
		<hr class="hr15">
		<input value="登录" style="width:100%;" type="submit">
		<hr class="hr20">
	</form>

	
</div>


</body>
</html>