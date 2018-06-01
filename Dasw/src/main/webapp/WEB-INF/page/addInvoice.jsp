<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>新增发票页</title>
	<base href="${ctx}">
	<link rel="stylesheet" href="${ctx}/css/reset.css" >
	<link rel="stylesheet" href="${ctx}/css/content.css" >
	<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
	<link href="${ctx}/css/bootstrap.css" rel="stylesheet">
</head>
<body marginwidth="0" marginheight="0">
    <div>
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">财务管理</a>>&nbsp;&nbsp;&nbsp;发票管理</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">新增发票</h3>
        </div>
        <div class="public-content-cont">
            <form data-toggle="validator" class="form-horizontal" id="defaultForm" name="defaultForm" action="${ctx}/invoice/addInvoice" method="post">
                <div class="form-group ">
                    <label for="orderId" class=" control-label " >订单号：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="orderId" name="orderId"  value="${orderId }"  readonly="readonly">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="invoiceNumber" class=" control-label">发票号：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="invoiceNumber" name="invoiceNumber" placeholder="发票号" value="">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="invoiceOwm" class=" control-label">付款方：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="invoiceOwm" name="invoiceOwm" placeholder="付款方" value="">
                    </div>
                </div>
                <div class="form-group ">
                        <label  class=" control-label" for="invoicePaydate">付款日期：</label>
                        <div class="col-sm-3">
                            <input type="date" class="form-control" id="invoicePaydate" name="invoicePaydate"  value="">
                        </div>
                    </div>
                <div class="form-group ">
                    <label for="invoiceWay" class=" control-label">付款方式：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="invoiceWay" name="invoiceWay" placeholder="付款方式" value="">
                    </div>
                </div>
                <div class="form-group ">
                        <label  class=" control-label" for="invoiceDate">开票日期：</label>
                        <div class="col-sm-3">
                            <input type="date" class="form-control" id="invoiceDate"  name="invoiceDate" value="">
                        </div>
                </div>
                <div class="form-group ">
                    <label for="invoiceMoney" class=" control-label">开票金额：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="invoiceMoney" name="invoiceMoney" placeholder="开票金额" value="">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="invoiceFlag" class=" control-label">是否已开：</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="invoiceFlag"  name="invoiceFlag">
                            <option value="">--请选择--</option>
                            <option value="0">&nbsp;&nbsp;&nbsp;&nbsp;未开</option>
                            <option value="1">&nbsp;&nbsp;&nbsp;&nbsp;已开</option>
                        </select>
                    </div>
                </div>
                <div class="form-group form-inline">
                    <div class="col-md-10 col-md-offset-1">
                        <input type="submit" class="button button-glow button-rounded button-raised button-primary" value="确定"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" class="button button-glow button-border button-rounded button-primary" value="重置"/>
                    </div>
                </div>
            </form>
          </div>
    </div>
</div>
<script src="${ctx}/kingediter/kindeditor-all-min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id');
    });

</script>
<script type="text/javascript">

    $(document).ready(function() {
        // Generate a simple captcha
        function randomNumber(min, max) {
            return Math.floor(Math.random() * (max - min + 1) + min);
        };
        $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));
       
    });

</script>
</body>
</html>