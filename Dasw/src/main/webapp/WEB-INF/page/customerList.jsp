<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>后台欢迎页</title>
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
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">人员管理</a>>&nbsp;&nbsp;&nbsp;客户管理</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">客户管理</h3>
        </div>
        <div class="public-content-cont">

            <form class="form-inline"  action="${ctx}/customer/customerList" method="post">
                <div >
                    <label for="">客户查询:</label>
                    <input type="text" class="form-control" id="customerName" name="customerName" value="${sessionScope.customerName}" placeholder="客户姓名">
                     <input type="text" class="form-control" id="customerCompanyName"  name="customerCompanyName" value="${sessionScope.customerCompanyName}" placeholder="单位名称">
                    <button type="submit" class="btn btn-default">查找</button>
                    &nbsp;&nbsp;
                    <!-- <input type="button" class="btn btn-primary" onclick="javascript:window.location.href='addCustomer.html'" value="添加"/> -->
                    <a type="button" class="btn btn-default"  href="${ctx}/customer/addLoad">添加</a>
                </div>
            </form>

            <div class="a">
                <table class="table table-striped">
                    <thead>
                    <tr >
                        <th >客户名称</th>
                        <th>客户类型</th>
                        <th>业务员</th>
                        <th>联系方式</th>
                        <th>公司名称</th>
                        <th>单位地址</th>
                        <th>单位电话</th>
                        <th>收货人</th>
                        <th>收货地址</th>
                        <th>收货电话</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody>
	                    <c:forEach items="${pagemsg.list}"  var="customer">
					     	<tr>
					  			<td>${customer.customerName}</td>
					  			<%-- <td>${customer.customerType}</td> --%>
					  			<c:if test="${customer.customerType=='0' }">
					  				<td>普通客户</td>
					  			</c:if>
					  			<c:if test="${customer.customerType=='1' }">
					  				<td>贵宾客户</td>
					  			</c:if>
					  			<td>${currentUser.userUsername}</td>
					  			<td>${customer.customerTel}</td>
					  			<td>${customer.customerCompanyName}</td>
					  			<td>${customer.customerCompanyAddress}</td>
					  			<td>${customer.customerCompanyTel}</td>
					  			<td>${customer.customerReceiverName}</td>
					  			<td>${customer.customerReceiverTel}</td>
					  			<td>${customer.customerReceiverAddress}</td>
					  			<td>
					  			<%-- <a href="${ctx}/customer/addLoad">增加</a> --%> 
					  			<a href="${ctx}/order/addLoad?userId=${currentUser.userId}&customerId=${customer.customerId}">添加订单</a> 
					  			<a href="${ctx}/customer/editLoad?id=${customer.customerId}">修改</a>   <a href="${ctx}/customer/delete?id=${customer.customerId}">删除</a> </td>
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
                    		
                        	<a href="${ctx}/customer/customerList?pageIndex=1">首页</a>
                    		
                        	<a href="${ctx}/customer/customerList?pageIndex=${requestScope.pagemsg.pageIndex-1}" aria-label="Previous">
                            	<span aria-hidden="true">上一页</span>
                        	</a>
                    	</c:if>
                    </li>
                    <li>
                    	<c:if test="${requestScope.pagemsg.pageIndex != requestScope.pagemsg.totalPage}">
                    		<a href="${ctx}/customer/customerList?pageIndex=${requestScope.pagemsg.pageIndex+1}" aria-label="Next">
                            	<span>下一页</span>
                        	</a>
                    		<a href="${ctx}/customer/customerList?pageIndex=${requestScope.pagemsg.totalPage}">尾页</a>
                    	</c:if>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script src="<%=basePath%>kingediter/kindeditor-all-min.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id');
    });
</script>
</body>
</html>