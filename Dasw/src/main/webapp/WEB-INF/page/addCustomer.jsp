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
    <title>新增业务员</title>
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
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">人员管理</a>>&nbsp;&nbsp;&nbsp;客户管理</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">新增客户</h3>
        </div>
        <div class="public-content-cont">
            <form data-toggle="validator" class="form-horizontal" id="defaultForm" name="defaultForm"  action="${ctx}/customer/add"  method="post">
                <div class="form-group ">
                    <label for="customerName" class=" control-label " >客户名称：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="customerName" name="customerName"  placeholder="客户名称">
                    </div>
                </div>
                  <div class="form-group ">
                    <label for="customerType" class=" control-label">客户类型：</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="customerType"  name="customerType">
                            <option value="">--请选择--</option>
                            <option value="0">普通客户</option>
                            <option value="1">贵宾客户</option>
                        </select>
                    </div>
                </div>
               <!--  <div class="form-group ">
                    <label for="customerType" class=" control-label">客户类型：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="customerType" name="customerType" placeholder="客户类型">
                    </div>
                </div> -->
                <div class="form-group " style="display:none;">
                    <label for="userId" class=" control-label">业务员：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="userId" name="userId" placeholder="业务员" value="${currentUser.userId} " readonly="readonly">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="customerTel" class=" control-label">联系方式：</label>
                    <div class="col-sm-3">
                        <input type="tel" class="form-control" id="customerTel" name="customerTel" placeholder="联系方式">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="customerCompanyName" class=" control-label">公司名称：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="customerCompanyName" name="customerCompanyName" placeholder="公司名称">
                    </div>
                </div>
                <div class="form-group ">
                    <label  class=" control-label" for="customerCompanyAddress">单位地址：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="customerCompanyAddress" name="customerCompanyAddress" placeholder="单位地址">
                    </div>
                </div>
                <div class="form-group ">
                    <label class=" control-label"  for="customerCompanyTel">单位电话：</label>
                    <div class="col-sm-3">
                        <input type="tel" class="form-control" id="customerCompanyTel" name="customerCompanyTel" placeholder="单位电话">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="customerReceiverName" class=" control-label">收货人：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="customerReceiverName" name="customerReceiverName" placeholder="收货人">
                    </div>
                </div>
                  <div class="form-group ">
                    <label for="customerReceiverTel" class=" control-label">收货电话：</label>
                    <div class="col-sm-3">
                        <input type="tel" class="form-control" id="customerReceiverTel" name="customerReceiverTel" placeholder="收货电话">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="customerReceiverAddress" class=" control-label">收货地址：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="customerReceiverAddress" name="customerReceiverAddress" placeholder="收货地址">
                    </div>
                </div>
                <div class="form-group form-inline">
                    <div class="col-md-10 col-md-offset-1">
                        <input type="submit" class="button button-glow button-rounded button-raised button-primary" value="保存"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" class="button button-glow button-border button-rounded button-primary" value="重置"/>
                    </div>
                </div>
            </form>   
        </div>
    </div>
</div>
<script src="<%=basePath%>kingediter/kindeditor-all-min.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id');
    });

</script>
<script type="text/javascript">

    /*function showhidediv(id){
        var sbtitle=document.getElementById(id);
        if(sbtitle){
            if(sbtitle.style.display=='block'){
                sbtitle.style.display='none';
            }else{
                sbtitle.style.display='block';
            }
        }
    }*/
    
    /*function selectType() {
        var type=document.getElementById("type");
        if(type.options[type.selectedIndex].value=="0"){
            showhidediv("purchase");
        }else if(type.options[type.selectedIndex].value=="1"){
            showhidediv("manufacture");
        }else{
            document.getElementById("purchase").style.display="none";
            document.getElementById("manufacture").style.display="none";
        }
    }*/

</script>
</body>
</html>