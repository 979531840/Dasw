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
    <title>发货列表</title>
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
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">销售管理</a>>&nbsp;&nbsp;&nbsp;发货管理</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">发货管理</h3>
        </div>
        <div class="public-content-cont">

            <form class="form-inline" action="${ctx}/send/sendList" method="post">
                <div >
                    <label >发货查询:</label>
                    <input type="text" class="form-control" id="orderId" name="orderId" size="15px" placeholder="订单ID" value="${sessionScope.orderId}" >
                    <input type="text" class="form-control" id="customerName" name="customerName" size="15px" placeholder="客户姓名" value="${sessionScope.customerName}" >
                    <input type="date" class="form-control" id="sendDate" name="sendDate" size="15px" placeholder="发货日期" value="${sessionScope.sendDate}" >
                    <input type="text" class="form-control" id="sendWay" name="sendWay" size="15px" placeholder="发货方式" value="${sessionScope.sendWay}" >
                    <input type="text" class="form-control" id="sendCourierid" name="sendCourierid" size="15px" placeholder="快递单号" value="${sessionScope.sendCourierid}" >

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <button type="submit" class="btn btn-default">查找</button>
                   
                </div>
            </form>

            <div class="a">
                <table class="table table-striped">
                    <thead>
                    <tr >
                        <th >订单ID</th>
                        <th>客户</th>
                        <th>发货日期</th>
                        <th>发货方式</th>
                        <th>快递单号</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody>
	                    <c:forEach items="${pagemsg.list}"  var="sendDetail">
	                    <tr>
	                        <td>${sendDetail.orderId}</td>
	                        <td>${sendDetail.customerName}</td>
	                        <td><fmt:formatDate value="${sendDetail.sendDate}" type="date"/></td>
	                        <td>${sendDetail.sendWay}</td>
	                        <td>${sendDetail.sendCourierid}</td>
	                        <td><a href="${ctx}/send/editLoad?id=${sendDetail.sendId}">修改</a><a href="${ctx}/send/delete?sendId=${sendDetail.sendId}&orderId=${sendDetail.orderId}" >删除</a><a href="${ctx}/order/orderDetail?orderId=${sendDetail.orderId}" >对应订单</a></td>
	                    </tr>
	                    </c:forEach>
                    </tbody>
                </table>
            </div>
			<nav aria-label="Page navigation" style="text-align: center">
                <ul class="pagination">
                    <li><span>第${requestScope.pagemsg.pageIndex }/ ${requestScope.pagemsg.totalPage}页</span>&nbsp;&nbsp;</li> 
                    <li>
                    	<c:if test="${requestScope.pagemsg.pageIndex != 1}">
                    		
                        	<a href="${ctx}/send/sendList?pageIndex=1">首页</a>
                    		
                        	<a href="${ctx}/send/sendList?pageIndex=${requestScope.pagemsg.pageIndex-1}" aria-label="Previous">
                            	<span aria-hidden="true">上一页</span>
                        	</a>
                    	</c:if>
                    </li>
                    <li>
                    	<c:if test="${requestScope.pagemsg.pageIndex != requestScope.pagemsg.totalPage}">
                    		<a href="${ctx}/send/sendList?pageIndex=${requestScope.pagemsg.pageIndex+1}" aria-label="Next">
                            	<span>下一页</span>
                        	</a>
                    		<a href="${ctx}/send/sendList?pageIndex=${requestScope.pagemsg.totalPage}">尾页</a>
                    	</c:if>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script src="kingediter/kindeditor-all-min.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id');
    });
</script>
</body>
</html>