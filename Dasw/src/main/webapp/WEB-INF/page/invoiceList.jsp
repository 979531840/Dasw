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
	<title>发票管理页</title>
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
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">财务管理</a>>&nbsp;&nbsp;&nbsp;发票管理</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">发票管理</h3>
        </div>
        <div class="public-content-cont">

            <form class="form-inline"  action="${ctx}/invoice/invoiceList" method="post">
                <div >
                    <label for="invoiceNumber">发票号:</label>
                    <input type="text" class="form-control" id="invoiceNumber" name="invoiceNumber" placeholder="发票号码" value="${sessionScope.invoiceNumber}">
                    &nbsp;&nbsp;
                    <label for="invoiceDate">开票日期:</label>
                    <input type="date" class="form-control" id="invoiceDate"  name="invoiceDate"  value="${sessionScope.invoiceDate}">
                    &nbsp;&nbsp;
                    <label for="invoiceFlag">是否已开发票:</label>
                    <select id="invoiceFlag" name="invoiceFlag" class="form-control" >
                        <option value="" <c:if test="${sessionScope.invoiceFlag==' '}">selected="selected"</c:if>>--请选择--</option>
                        <option value="0" <c:if test="${sessionScope.invoiceFlag=='0'}">selected="selected"</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;未开</option>
                        <option value="1" <c:if test="${sessionScope.invoiceFlag=='1'}">selected="selected"</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;已开</option>
                    </select>
                    &nbsp;&nbsp;
                    <button type="submit" class="btn btn-success">查找</button>
                </div>
            </form>

            <div class="a">
                <table class="table table-striped">
                    <thead>
                    <tr >
                        <th >订单号</th>
                        <th>发票号</th>
                        <th>付款方</th>
                        <th>付款方式</th>
                        <th>付款日期</th>
                        <th>开票金额</th>
                        <th>是否已开</th>
                        <th>开票日期</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody> 
				  		<c:forEach items="${pagemsg.list}"  var="invoice">
					     	<tr>
					  			<td>${invoice.orderId}</td>
					  			<td>${invoice.invoiceNumber}</td>
					  			<td>${invoice.invoiceOwm}</td>
					  			<td>${invoice.invoiceWay}</td>
					  			<td>${invoice.invoicePaydate}</td>
					  			<td>${invoice.invoiceMoney}</td>
					  			<c:if test="${invoice.invoiceFlag=='0'}">
					  				<td>未开</td>
					  			</c:if>
					  			<c:if test="${invoice.invoiceFlag=='1'}">
					  				<td>已开</td>
					  			</c:if>
					  			<td>${invoice.invoiceDate}</td>
					  			<td><a href="${ctx}/invoice/editLoad?id=${invoice.invoiceId}">修改</a><a href="${ctx}/invoice/deleteInvoice?id=${invoice.invoiceId}">删除</a> </td>
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
                    		
                        	<a href="${ctx}/invoice/invoiceList?pageIndex=1">首页</a>
                    		
                        	<a href="${ctx}/invoice/invoiceList?pageIndex=${requestScope.pagemsg.pageIndex-1}" aria-label="Previous">
                            	<span aria-hidden="true">上一页</span>
                        	</a>
                    	</c:if>
                    </li>
                    <li>
                    	<c:if test="${requestScope.pagemsg.pageIndex != requestScope.pagemsg.totalPage}">
                    		<a href="${ctx}/invoice/invoiceList?pageIndex=${requestScope.pagemsg.pageIndex+1}" aria-label="Next">
                            	<span>下一页</span>
                        	</a>
                    		<a href="${ctx}/invoice/invoiceList?pageIndex=${requestScope.pagemsg.totalPage}">尾页</a>
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
