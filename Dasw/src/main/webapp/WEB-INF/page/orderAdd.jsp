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
    <title>新建订单</title>
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
            <h3 style="font-size:15px;font-weight:bold;">添加订单</h3>
        </div>
        <div class="public-content-cont">
        	<form action="${ctx}/order/orderAdd">            
                <h3 style="font-size:15px;font-weight:bold;">订单信息</h3><br>
                <input type="hidden" name="customerId" value="${customerId}">
                <input type="hidden" name="userId" value="${userId}">
                <div class="form-group ">
                    
                 <div class="col-sm-4">
                    	<label for="orderDate" class=" control-label col-sm-2">日期：</label>
                        <input type="date" class="form-control col-sm-10" style="width:150px;" id="orderDate" name="orderDate" value="" required>
                 </div>
                 <div class="col-sm-4">
                    	<label for="orderFlag" class=" control-label col-sm-4">退换货：</label>
                        <select id="orderFlag" name="orderFlag" class="form-control col-sm-8" value="" style="width:180px;">
                        <option id="select1" value="1" >非退换货</option>
                        <option id="select0" value="0">退换货</option>
                    	</select>
                 </div>
                 <div class="col-sm-4">
                        <label for="orderPay" class=" control-label col-sm-4">已付：</label>
                        <input type="text" class="form-control col-sm-8" id="orderPay" name="orderPay" value="0.0" style="width:150px;">
                 </div>
                <div class="form-group form-inline">
		                <br>
		                <h3 style="font-size:15px;font-weight:bold;">订单包含的产品</h3>
		                <br>     
		        </div>           
                <table class="table table-striped">
                <thead>
                    <tr><td>产品ID</td><td>数量</td><td>折扣</td><td>操作</td></tr>
                </thead>
                <tbody>
      
                 </tbody>
                 </table>
                 
                 
  

					<div id="button" class="form-group form-inline">
                    	<input id="add" value="添加产品" type="button" class="btn btn-default"></input>
                    	<input value="保存" type="submit" class="btn btn-default"></input>
                 	</div>
                 	</form>
          		</div>
           
            
        </div>
<script type="text/javascript">

var list = 0;

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