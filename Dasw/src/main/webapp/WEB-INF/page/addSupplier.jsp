<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>新增供应商</title>
    <link rel="stylesheet" href="<%=basePath%>css/reset.css" >
    <link rel="stylesheet" href="<%=basePath%>css/content.css" >
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
    <link href="<%=basePath%>css/bootstrap.css" rel="stylesheet">

    <!--<link href="css/button.css" rel="stylesheet">
    <style>
        .a{
            margin-top: 20px;
        }
    </style>-->
</head>
<body marginwidth="0" marginheight="0">
<div>
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">人员管理</a>>&nbsp;&nbsp;&nbsp;供应商管理</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">新增供应商</h3>
        </div>
        <div class="public-content-cont">
            <form data-toggle="validator" class="form-horizontal  demoform" id="defaultForm" name="defaultForm" action="${ctx}/supplier/add" method="post">
                <div class="form-group ">
                    <label for="supplierName" class=" control-label " >供货商名称：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="supplierName" name="supplierName"  placeholder="供货商名称">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="supplierTel" class=" control-label">联系电话：</label>
                    <div class="col-sm-3">
                        <input type="tel" class="form-control" id="supplierTel" nullmsg="请输入11位数字的电话号码"  datatype="n11-11" errormsg="请输入11位数字的电话号码"  name="supplierTel" placeholder="联系电话">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="supplierCompany" class=" control-label">公司名称：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="supplierCompany" name="supplierCompany">
                    </div>
                </div>
                <div class="form-group ">
                    <label  class=" control-label" for="supplierAddress">单位地址：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="supplierAddress" name="supplierAddress" placeholder="单位地址">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="supplierPhone" class=" control-label">单位电话：</label>
                    <div class="col-sm-3">
                        <input type="tel" class="form-control" id="supplierPhone" name="supplierPhone" placeholder="单位电话">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="supplierQq" class=" control-label">单位QQ：</label>
                    <div class="col-sm-3">
                        <input type="number" class="form-control" id="supplierQq" name="supplierQq" placeholder="单位QQ">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="supplierEmail" class=" control-label">单位邮箱：</label>
                    <div class="col-sm-3">
                        <input type="email" class="form-control" id="supplierEmail" name="supplierEmail" placeholder="单位邮箱" required>
                    </div>
                </div>
                <div class="form-group form-inline">
                    <div class="col-md-10 col-md-offset-1">
                        <input type="submit" class="button button-glow button-rounded button-raised button-primary" value="确定"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" class="button button-glow button-border button-rounded button-primary" value="重置"/>
                    </div>
                </div>
            </form>
            <!--<nav aria-label="Page navigation" style="text-align: center">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>-->
        </div>
    </div>
</div>
<script src="kingediter/kindeditor-all-min.js"></script>
<script type="text/javascript" src="http://validform.rjboy.cn/wp-content/themes/validform/js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="http://validform.rjboy.cn/Validform/v5.1/Validform_v5.1_min.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id');
    });

</script>
<script type="text/javascript">
$(".demoform").Validform();


</script>
</body>
</html>