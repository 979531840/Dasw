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
    <title>修改订单</title>
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
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">销售管理</a>><a href="">订单管理</a>>&nbsp;&nbsp;&nbsp;修改订单</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">修改订单</h3>
        </div>
        <div class="public-content-cont">
        	<form action="${ctx}/order/orderProduceEdit">            
                <h3 style="font-size:15px;font-weight:bold;">订单信息</h3><br>
                <input type="hidden" name="orderId" value="${orderDetail.orderId}">
                <div class="form-group ">
                   
                    <div class="col-sm-3">
                     	<label for="" class=" control-label " >客&nbsp;&nbsp;&nbsp;户：</label>
                        <label for="" class=" control-label " >${orderDetail.customerName}</label>
                    </div>
                    <div class="col-sm-3">
                    	<label for="" class=" control-label">业务员：</label>
                        <label for="" class=" control-label " >${orderDetail.userName}</label>
                    </div>
                    <div class="col-sm-6">
                    	<label for="orderDate" class=" control-label col-sm-4">日&nbsp;&nbsp;&nbsp;期：</label>
                        <input type="date" class="form-control col-sm-8" id="orderDate" name="orderDate" style="width:200px;" value="<fmt:formatDate value="${orderDetail.orderDate}" pattern="yyyy-MM-dd" />">
                    </div>
                </div>
               
               
                <div class="form-group ">
               		 <div class="col-sm-3">
	                    	<label for="orderFlag" class=" control-label">退换货：</label>
	                        <select id="orderFlag" name="orderFlag" class="form-control" value="" style="width:150px;">
	                        <option id="select0" value="0">退换货</option>
	                        <option id="select1" value="1" <c:if test="${orderDetail.orderFlag == 1}">selected</c:if>>非退换货</option>
	                    	</select>
             		 </div>
                     <div class="col-sm-3">
	                    	 <label for="orderPay" class=" control-label">已&nbsp;&nbsp;&nbsp;付：</label>
	                        <input type="text" class="form-control" style="width:150px;"  id="orderPay" name="orderPay" value="${orderDetail.orderPay}">
                    </div>
                    
                </div>
              
                
                <div class="form-group">
                <br>
                <h3 style="font-size:15px;font-weight:bold;">订单包含的产品</h3>
                <br>                
                <table class="table table-striped">
                <thead>
                    <tr><td>产品ID</td><td>数量</td><td>折扣</td><td>操作</td></tr>
                </thead>
                <tbody>
                <c:forEach items="${sellList}"  var="sellDetail" varStatus="index">
                	<tr>
                		<input type="hidden" name="Sell[${index.count-1}].orderId" value="${sellDetail.orderId}">	 
                        <td><input type="text" class="form-control" name="Sell[${index.count-1}].produceId" value="${sellDetail.produceId}"></td>
                        <td><input type="text" class="form-control" name="Sell[${index.count-1}].produceNumber" value="${sellDetail.produceNumber}"></td>
                        <td><input type="text" class="form-control" name="Sell[${index.count-1}].produceDiscount" value="${sellDetail.produceDiscount}"></td>
                        <td><input id="delete" type="button" class="btn btn-default" value="删除"/></td>
                    </tr>
                 </c:forEach>
                 </tbody>
                 </table>
                 
                 
  

					<div id="button" class="form-group form-inline">
                    	<input id="add" value="添加产品" type="button" class="btn btn-default"></input>
                    	<input value="提交修改" type="submit" class="btn btn-default"></input>
                 	</div>
          		</div>
           
            </form>
        </div>
    </div>
<script type="text/javascript">

var list = ${sellList.size()};

$(document).ready(function(){
		
	$("#add").click(function(){
		$("tbody").append(
            
            '<tr>'+
            	'<input type="hidden" name="Sell['+list+'].orderId" value="${orderDetail.orderId}">'+
                '<td><input type="text" class="form-control" name="Sell['+list+'].produceId" placeholder="产品ID"></td>'+
           		'<td><input type="text" class="form-control" name="Sell['+list+'].produceNumber" placeholder="数量"></td>'+
            	'<td><input type="text" class="form-control" name="Sell['+list+'].produceDiscount" placeholder="折扣"></td>'+
            	'<td><input id="delete" type="button" class="button button-glow button-rounded button-raised button-primary" value="删除"/></td>'+
            '</tr>'
		);
	
		list++;
	});		
});

$(function(){
	$(document).on('click','#delete',function(){
		$(this).parent().parent().remove();
	});
});
</script>
</body>
</html>