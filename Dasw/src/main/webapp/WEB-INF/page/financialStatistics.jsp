<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>财务统计页</title>
	<base href="${ctx}">
    <link rel="stylesheet" href="${ctx}/css/reset.css" >
    <link rel="stylesheet" href="${ctx}/css/content.css" >
    <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="${ctx}/css/bootstrap.css" rel="stylesheet">
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
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">财务管理</a>>&nbsp;&nbsp;&nbsp;财务统计</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">财务统计</h3>
        </div>
        <div class="public-content-cont">

            <form class="form-inline"  action="${ctx}/financial/financialList" method="post">
                <div >
                    <label for="orderId">订单编号:</label>
                    <input type="text" class="form-control" id="orderId" name="orderId"  style="width:110px"  placeholder="订单编号" value="${sessionScope.orderId}">
                    &nbsp;
                    <label for="customerName">客户名称:</label>
                    <input type="text" class="form-control" id="customerName"  name="customerName"  style="width:110px"  placeholder="客户名称"  value="${sessionScope.customerName}">
                    &nbsp;
                    <label for="orderDate">订单日期:</label>
                    <input type="date" class="form-control" id="orderStartDate"  name="orderStartDate" style="width:150px" value="${sessionScope.orderStartDate}">~
                    <input type="date" class="form-control" id="orderEndDate"  name="orderEndDate" style="width:150px" value="${sessionScope.orderEndDate}">
                    &nbsp;
                    <label for="isPay">是否到账:</label>
                    <select id="isPay" name="isPay" class="form-control" style="width:95px">
                        <option value="" <c:if test="${sessionScope.isPay==' '}">selected="selected"</c:if>>请选择</option>
                        <option value="0" <c:if test="${sessionScope.isPay=='0'}">selected="selected"</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;否</option>
                        <option value="1" <c:if test="${sessionScope.isPay=='1'}">selected="selected"</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;是</option>
                    </select>
                    &nbsp;&nbsp;
                    <button type="submit" class="btn btn-success">查找</button>
                </div>
            </form>
            <br/>
            <font color="#FF0000"><b>本次查询共有${pagemsg.totalCount }条记录，订单总额:${totalprice}，已付金额:${pay}，未付金额:${noPay}</b></font>
            <div class="a">
                <table class="table table-striped">
                    <thead>
                    <tr >
                        <th >订单号</th>
                        <th>客户名称</th>
                        <th>订单产品</th>
                        <th>订单总额</th>
                        <th>已付金额</th>
                        <th>订单日期</th>
                    </tr>
                    </thead>
                    <tbody> 
				  		<c:forEach items="${pagemsg.list}"  var="financial">
					     	<tr>
					  			<td>${financial.orderId}</td>
					  			<td>${financial.customer.customerName}</td>
					  			<td>${financial.produceList}</td>
					  			<td>${financial.orderTotalprice}</td>
					  			<td>${financial.orderPay}</td>
					  			<td>${financial.orderDate}</td>
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
                    		
                        	<a href="${ctx}/financial/financialList?pageIndex=1">首页</a>
                    		
                        	<a href="${ctx}/financial/financialList?pageIndex=${requestScope.pagemsg.pageIndex-1}" aria-label="Previous">
                            	<span aria-hidden="true">上一页</span>
                        	</a>
                    	</c:if>
                    </li>
                    <li>
                    	<c:if test="${requestScope.pagemsg.pageIndex != requestScope.pagemsg.totalPage}">
                    		<a href="${ctx}/financial/financialList?pageIndex=${requestScope.pagemsg.pageIndex+1}" aria-label="Next">
                            	<span>下一页</span>
                        	</a>
                    		<a href="${ctx}/financial/financialList?pageIndex=${requestScope.pagemsg.totalPage}">尾页</a>
                    	</c:if>
                    </li>
                </ul>
            </nav>
         </div>
    </div>
</div>
<script src="${ctx}/kingediter/kindeditor-all-min.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id');
    });
</script>
 </body>
</html>
