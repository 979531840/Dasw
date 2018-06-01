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
    <title>采购列表</title>
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
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>>&nbsp;&nbsp;&nbsp;采购管理</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">采购管理</h3>
        </div>
        <div class="public-content-cont">

            <form class="form-inline" action="${ctx}/purchase/purchaseList" method="post">
                <div >
                    <label for="">采购查询:</label>
                    <input type="text" class="form-control" id="stockProductId" name="stockProductId" placeholder="产品ID" value="${sessionScope.stockProductId}">
                    <input type="text" class="form-control" id="produceName" name="produceName" placeholder="产品名称" value="${sessionScope.produceName}">
                    <input type="text" class="form-control" id="supplierName" name="supplierName" placeholder="供货商" value="${sessionScope.supplierName}">
                    <input type="date" class="form-control" id="purchaseDate" name="purchaseDate" placeholder="采购日期" value="${sessionScope.purchaseDate}">
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <button type="submit" class="btn btn-default">查找</button>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" class="btn btn-primary" onclick="javascript:window.location.href='${ctx}/purchase/findProduceLoad'" value="添加"/>

                </div>
            </form>

            <div class="a">
                <table class="table table-striped">
                    <thead>
                    <tr >
                        <th >产品ID</th>
                        <th>产品名称</th>
                        <th>货号</th>
                        <th>供货商</th>
                        <th>采购日期</th>
                        <th>供应数量</th>
                        <th>供应价格</th>
                        <th>批次</th>
                        <th>金额</th>
                        <th>税率</th>
                        <th>税款</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${pagemsg.list}"  var="purchaseDetail">
                    <tr>
                        <td>${purchaseDetail.stockProductId}</td>
                        <td>${purchaseDetail.produceName}</td>
                        <td>${purchaseDetail.produceItem}</td>
                        <td>${purchaseDetail.supplierName}</td>
                        <td><fmt:formatDate value="${purchaseDetail.purchaseDate}" type="date"/></td>
                        <td>${purchaseDetail.supplierNumber}${purchaseDetail.produceUnit}</td>
                        <td>${purchaseDetail.supplierPrice}</td>
                        <td>${purchaseDetail.supplierBatch}</td>
                        <td>${purchaseDetail.supplierMoney}</td>
                        <td>${purchaseDetail.supplierRate}</td>
                        <td>${purchaseDetail.supplierRatemoney}</td>
                        <td><a href="${ctx}/purchase/editLoad?id=${purchaseDetail.purchaseId}" >修改</a><a href="${ctx}/purchase/delete?id=${purchaseDetail.purchaseId}" >删除</a><a href="${ctx}/purchase/addLoadAgain?id=${purchaseDetail.purchaseId}" >再次采购</a></td>
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
                    		
                        	<a href="${ctx}/purchase/purchaseList?pageIndex=1">首页</a>
                    		
                        	<a href="${ctx}/purchase/purchaseList?pageIndex=${requestScope.pagemsg.pageIndex-1}" aria-label="Previous">
                            	<span aria-hidden="true">上一页</span>
                        	</a>
                    	</c:if>
                    </li>
                    <li>
                    	<c:if test="${requestScope.pagemsg.pageIndex != requestScope.pagemsg.totalPage}">
                    		<a href="${ctx}/purchase/purchaseList?pageIndex=${requestScope.pagemsg.pageIndex+1}" aria-label="Next">
                            	<span>下一页</span>
                        	</a>
                    		<a href="${ctx}/purchase/purchaseList?pageIndex=${requestScope.pagemsg.totalPage}">尾页</a>
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