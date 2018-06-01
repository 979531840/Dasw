<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 左侧导航栏 -->
		<div class="public-ifame-leftnav">
			<div class="public-title-warrp">
				<div class="public-ifame-title ">
					<a href="<%=basePath%>base/index">首页</a>
				</div>
			</div>
			<c:if test="${currentUser.userType=='0' }">
					<jsp:include page="/WEB-INF/page/managerMenu.jsp" flush="true"></jsp:include> 
  			</c:if>
  			<c:if test="${currentUser.userType=='1' }">
  					<jsp:include page="/WEB-INF/page/userMenu.jsp" flush="true"></jsp:include> 
  			</c:if>
		</div>