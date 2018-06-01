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
    <title>订单列表</title>
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
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">销售管理</a>>&nbsp;&nbsp;&nbsp;订单管理</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">订单管理</h3>
        </div>
        <div class="public-content-cont">

            <form class="form-inline" action="${ctx}/order/orderList" method="post">
                <div >
                    <label >订单查询:</label>
                    <input type="text" class="form-control" size="10px" id="orderId" name="orderId" placeholder="订单ID" value="${sessionScope.orderId}" >
                    <input type="text" class="form-control " size="10px" id="customerName" name="customerName" placeholder="客户姓名" value="${sessionScope.customerName}" >
                    <input type="text" class="form-control " size="10px" id="userName" name="userName" placeholder="业务员姓名"  value="${sessionScope.userName}">
                    <input type="date" class="form-control " size="10px" id="orderDate" name="orderDate" placeholder="创建日期" value="${sessionScope.orderDate}">
                    &nbsp;&nbsp;
                    <label for="orderFlag">退换货状态:</label>
                    <select id="orderFlag" name="orderFlag" class="form-control" >
                        <option value="" >全部</option>
                        <option value="0" <c:if test="${sessionScope.orderFlag=='0'}">selected="selected"</c:if>>退换货</option>
                        <option value="1" <c:if test="${sessionScope.orderFlag=='1'}">selected="selected"</c:if>>非退换货</option>
                    </select>
                    <!-- <select id="orderFlag" name="orderFlag" class="form-control">
                        <option value="">全部</option>
                        <option value="0">退换货</option>
                        <option value="1">非退换货</option>
                    </select> -->
                    &nbsp;&nbsp;
                    <button type="submit" class="btn btn-success">查找</button>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="btn btn-primary" onclick="javascript:window.location.href='${ctx}/order/findCustomerLoad'" value="添加"/>
                </div>
            </form>

            <div class="a">
                <table class="table table-striped">
                    <thead>
                    <tr >
                        <th >订单ID</th>
                        <th>客户</th>
                        <th>业务员</th>
                        <th>创建日期</th>
                        <th>总价格</th>
                        <th>已付金额</th>
                        <th>是否退换货</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${pagemsg.list}"  var="orderDetail">
                    <tr>
                        <td>${orderDetail.orderId}</td>
                        <td>${orderDetail.customerName}</td>
                        <td>${orderDetail.userName}</td>
                        <td><fmt:formatDate value="${orderDetail.orderDate}" type="date"/></td>
                        <td>${orderDetail.orderTotalprice}</td>
                        <td>${orderDetail.orderPay}</td>
                        <c:if test="${orderDetail.orderFlag=='0' }">
					  		<td>是</td>
					  	</c:if>
			  			<c:if test="${orderDetail.orderFlag=='1' }">
			  				<td>否</td>
			  			</c:if>
                        <td><a href="${ctx}/order/orderDetail?orderId=${orderDetail.orderId}" >查看详情</a><a href="${ctx}/order/produceEditLoad?orderId=${orderDetail.orderId}" >修改</a><a href="${ctx}/order/delete?orderId=${orderDetail.orderId}" >删除</a></td>
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
                    		
                        	<a href="${ctx}/order/orderList?pageIndex=1">首页</a>
                    		
                        	<a href="${ctx}/order/orderList?pageIndex=${requestScope.pagemsg.pageIndex-1}" aria-label="Previous">
                            	<span aria-hidden="true">上一页</span>
                        	</a>
                    	</c:if>
                    </li>
                    <li>
                    	<c:if test="${requestScope.pagemsg.pageIndex != requestScope.pagemsg.totalPage}">
                    		<a href="${ctx}/order/orderList?pageIndex=${requestScope.pagemsg.pageIndex+1}" aria-label="Next">
                            	<span>下一页</span>
                        	</a>
                    		<a href="${ctx}/order/orderList?pageIndex=${requestScope.pagemsg.totalPage}">尾页</a>
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