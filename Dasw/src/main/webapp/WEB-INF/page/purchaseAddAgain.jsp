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
    <title>增加采购记录</title>
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
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">采购管理</a>>&nbsp;&nbsp;&nbsp;修改采购记录</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">修改采购记录</h3>
        </div>
        <div class="public-content-cont">
            <form data-toggle="validator" class="form-horizontal" id="defaultForm" name="defaultForm" action="${ctx}/purchase/purchaseAdd" method="post">
                <h3 style="font-size:15px;font-weight:bold;">采购信息</h3><br>
                <input type="hidden" id="supplierId" name="supplierId" value="${purchaseDetail.supplierId}">
                <input type="hidden" id="stockProductId" name="stockProductId" value="${purchaseDetail.stockProductId}">
                <div class="form-group ">
                    <label for="" class=" control-label " >产品ID：</label>
                    <div class="col-sm-3">
                        <label for="" class=" control-label " >${purchaseDetail.stockProductId}</label>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="" class=" control-label " >产品：</label>
                    <div class="col-sm-3">
                        <label for="" class=" control-label " >${purchaseDetail.produceName}</label>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="" class=" control-label " >供货商：</label>
                    <div class="col-sm-3">
                        <label for="" class=" control-label " >${purchaseDetail.supplierName}</label>
                    </div>
                </div>
                <div class="form-group ">
                    <label for="supplierNumber" class=" control-label " >数量：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="supplierNumber" name="supplierNumber" value="${purchaseDetail.supplierNumber}">
                    </div>
                    <label for="" class=" control-label " >${purchaseDetail.produceUnit}</label>
                </div>
                <div class="form-group ">
                    <label for="supplierPrice" class=" control-label">价格：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="supplierPrice" name="supplierPrice" value="${purchaseDetail.supplierPrice}">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="purchaseDate" class=" control-label">日期：</label>
                    <div class="col-sm-3">
                        <input type="date" class="form-control" id="purchaseDate" name="purchaseDate" value="<fmt:formatDate value="${purchaseDetail.purchaseDate}" pattern="yyyy-MM-dd" />">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="supplierBatch" class=" control-label">批次：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="supplierBatch" name="supplierBatch" value="${purchaseDetail.supplierBatch}">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="supplierMoney" class=" control-label">金额：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="supplierMoney" name="supplierMoney" value="${purchaseDetail.supplierMoney}">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="supplierRate" class=" control-label">税率：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="supplierRate" name="supplierRate" value="${purchaseDetail.supplierRate}">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="supplierRatemoney" class=" control-label">税款：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="supplierRatemoney" name="supplierRatemoney" value="${purchaseDetail.supplierRatemoney}">
                    </div>
                </div>
                <div class="form-group form-inline">
                    <div class="col-md-10 col-md-offset-1">
                        <input value="重置" type="button" class="button button-glow button-rounded button-raised button-primary"></input>
                        <input value="提交" type="submit" class="button button-glow button-rounded button-raised button-primary"></input>
                    </div>
                </div>
            </form>
            
        </div>
    </div>
</div>
</body>
</html>