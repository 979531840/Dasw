<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div class="public-header-warrp">
	<div class="public-header">
		<div class="content">
			<div class="public-header-logo"><a href="<%=basePath%>base/index"><i>LOGO</i><h3>戴安进销存管理</h3></a></div>
			<div class="public-header-admin fr">
				<p class="admin-name">${user.userUsername}
								<c:if test="${currentUser.userType=='0' }">
					  				管理员
					  			</c:if>
					  			<c:if test="${currentUser.userType=='1' }">
					  				用户
					  			</c:if>您好！</p>
					  			<a href="" class="public-header-loginout">安全退出</a>	
				<!-- <div class="public-header-fun fr">
					
				</div> -->
			</div>
		</div>
	</div>
</div>