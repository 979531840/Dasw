<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>选择用户</title>
    <link rel="stylesheet" href="<%=basePath%>css/reset.css" >
    <link rel="stylesheet" href="<%=basePath%>css/content.css" >
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="<%=basePath%>css/bootstrap.css" rel="stylesheet">
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <style>
        .a{
            margin-top: 20px;
        }
        th{
            text-align: center
        }
    </style>
</head>
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">销售管理</a>><a href="">订单管理</a>>&nbsp;&nbsp;&nbsp;选择客户</div>
    <div class="public-content">
        <div class="public-content-cont">
        	<form action="${ctx}/order//findCustomer">            
                <h3 style="font-size:15px;font-weight:bold;">选择客户</h3><br>
                <input type="hidden" name="orderId" value="${orderDetail.orderId}">
                <div class="form-group ">
                   
                    
                    <div class="col-sm-6">
                    	<label for="orderDate" class=" control-label col-sm-4">姓名：</label>
                        <input type="text" class="form-control col-sm-8" id="customerName" name="customerName" style="width:200px;">
                        <input type="hidden" class="form-control col-sm-8" id="userId" name="userId" value="${sessionScope.currentUserId}">
                        &nbsp;&nbsp;&nbsp;
                        <input value="选择客户" type="submit" class="btn btn-default"></input>
                    </div>
                </div>          
            </form>
        </div>
    </div>

</body>
</html>