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
    <title>订单详情</title>
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
        <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">销售管理</a>><a href="">订单管理</a>>&nbsp;&nbsp;&nbsp;订单详情</div>
        <div class="public-content">
            <div class="public-content-header">
                <h3 style="font-size:15px;font-weight:bold;">订单详情</h3>
            </div>
            <div class="public-content-cont">
                <form data-toggle="validator" class="form-horizontal" id="defaultForm" name="defaultForm" action="#">
                    <h3 style="font-size:15px;font-weight:bold;">订单信息</h3><br>
                    <div class="form-group ">
	                    	<div class="col-sm-3">
	                            <label class=" control-label " >客户：</label>
	                            <label class=" control-label " >${orderDetail.customerName}</label>
	                        </div>
	                        <div class="col-sm-3">
	                             <label for="password" class=" control-label">业务员：</label>
	                            <label class=" control-label " >${orderDetail.userName}</label>
	                        </div>
                        	<div class="col-sm-3">
	                             <label class=" control-label " >日期：</label>
	                            <label class=" control-label " ><fmt:formatDate value="${orderDetail.orderDate}" type="date"/></label>
	                        </div>
                    </div>
                    <div class="form-group ">
	                    	<div class="col-sm-3">
	                            <label class=" control-label " >退换货：</label>
	                            <label class=" control-label " >
		                            <c:if test="${orderDetail.orderFlag=='0'}">
						  					是
						  			</c:if>
						  			<c:if test="${orderDetail.orderFlag=='1'}">
						  				    否 
						  			</c:if>
	                            
	                            </label>
	                        </div>
	                        <div class="col-sm-3">
	                             <label class=" control-label " >总价格：</label>
	                           <label class=" control-label " >${orderDetail.orderTotalprice}</label>
	                        </div>
                        	<div class="col-sm-3">
	                             <label class=" control-label " >已付金额：</label>
	                            <label class=" control-label " >${orderDetail.orderPay}</label>
	                        </div>
                    </div>
                    <div class="form-group " >
                        <div class="col-md-10 col-md-offset-4" style="margin-top: 30px">
                            <input value="开发票" type="button"  class="btn btn-default" onclick="javascript:window.location.href='${ctx}/invoice/addLoad?orderId=${orderDetail.orderId}"></input>&nbsp;&nbsp;&nbsp;&nbsp;
                            <input value="发       货" type="button" class="btn btn-default" onclick="javascript:window.location.href='${ctx}/send/addLoad?orderId=${orderDetail.orderId}'"></input>&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                </form>
                <div class="form-group form-inline">
                    <br>
                    <h3 style="font-size:15px;font-weight:bold;">订单包含的产品</h3><br>
                    
                    <div class="a">
                        <table class="table table-striped">
                            <thead>
                            <tr >
                                <th >产品编号</th>
                                <th>产品名称</th>
                                <th>产品货号</th>
                                <th>数量</th>
                                <th>原价</th>
                                <th>折扣</th>
                                <th>成交价</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach items="${sellList}"  var="sellDetail">
                            <tr>
                                <td>${sellDetail.produceId}</td>
                                <td>${sellDetail.produceName}</td>
                                <td>${sellDetail.produceItem}</td>
                                <td>${sellDetail.produceNumber}${sellDetail.produceUnit}</td>
                                <td>${sellDetail.produceOriginalprice}</td>
                                <td>${sellDetail.produceDiscount}</td>
                                <td>
                               		<c:out value="${sellDetail.produceOriginalprice*sellDetail.produceDiscount}"/> 
                                </td>
                            </tr>
                            </c:forEach> 
                            

                            </tbody>
                        </table>
                    </div>              
                </div>
                
                <h3 style="font-size:15px;font-weight:bold;">发货信息</h3><br>
                <div class="a">
                <table class="table table-striped">
                    <thead>
                    <tr >
                        <th>发货日期</th>
                        <th>发货方式</th>
                        <th>快递单号</th>
                    </tr>
                    </thead>

                    <tbody>
	                    <c:forEach items="${sendList}"  var="sendDetail">
	                    <tr>
	                        <td><fmt:formatDate value="${sendDetail.sendDate}" type="date"/></td>
	                        <td>${sendDetail.sendWay}</td>
	                        <td>${sendDetail.sendCourierid}</td>
	                    </tr>
	                    </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <h3 style="font-size:15px;font-weight:bold;">发票信息</h3><br>
            <div class="a">
                <table class="table table-striped">
                    <thead>
                    <tr >
                        <th>订单产品</th>
                        <th>订单总额</th>
                        <th>已付金额</th>
                    </tr>
                    </thead>
                    <tbody> 
				  		<c:forEach items="${financialList}"  var="financial">
					     	<tr>
					  			<td>${financial.produceList}</td>
					  			<td>${financial.orderTotalprice}</td>
					  			<td>${financial.orderPay}</td>
					  		</tr>
				     	</c:forEach> 
				      </tbody>
			     </table>
		    </div>
                
                
                
            </div>
        </div>
    </div>

</body>
</html>