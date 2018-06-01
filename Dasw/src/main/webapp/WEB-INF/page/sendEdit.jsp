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
    <title>修改发货记录</title>
    <link rel="stylesheet" href="<%=basePath%>css/reset.css" >
    <link rel="stylesheet" href="<%=basePath%>css/content.css" >
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="<%=basePath%>css/bootstrap.css" rel="stylesheet">
    <style>
        .a{
            margin-top: 20px;
        }
        th{
            text-align: center
        }
    </style>
</head>
<body marginwidth="0" marginheight="0">
<div>
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">销售管理</a>><a href="">发货管理</a>>&nbsp;&nbsp;&nbsp;修改发货信息</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">修改发货信息</h3>
        </div>
        <div class="public-content-cont">
            <form data-toggle="validator" class="form-horizontal" id="defaultForm" name="defaultForm" action="${ctx}/send/sendEdit" method="post">
                <h3 style="font-size:15px;font-weight:bold;">发货信息</h3><br>
                <input type="hidden" id="sendId" name="sendId" id="sendId" value="${sendDetail.sendId}">
                <input type="hidden" id="orderId" name="orderId" id="orderId" value="${sendDetail.orderId}">
                <div class="form-group ">
                    <label for="" class=" control-label " >订单ID：</label>
                    <div class="col-sm-3">
                        <label for="" class=" control-label " >${sendDetail.orderId}</label>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="" class=" control-label " >客户：</label>
                    <div class="col-sm-3">
                        <label for="" class=" control-label " >${sendDetail.customerName}</label>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="sendDate" class=" control-label " >日期：</label>
                    <div class="col-sm-3">
                        <input type="date" class="form-control" id="sendDate" name="sendDate" value="<fmt:formatDate value="${sendDetail.sendDate}" pattern="yyyy-MM-dd" />" >
                    </div>
                </div>
                <div class="form-group ">
                    <label for="sendWay" class=" control-label " >方式：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="sendWay" name="sendWay" value="${sendDetail.sendWay}"  required>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="sendCourierid" class=" control-label">单号：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="sendCourierid" name="sendCourierid" value="${sendDetail.sendCourierid}">
                    </div>
                </div>
                <div class="form-group form-inline">
                    <div class="col-md-10 col-md-offset-1">
                        <input value="提交" type="submit" class="btn btn-default"></input>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>