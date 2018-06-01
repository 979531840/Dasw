<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>编辑产品页</title>
	<base href="${ctx}">
	<link rel="stylesheet" href="${ctx}/css/reset.css" >
	<link rel="stylesheet" href="${ctx}/css/content.css" >
	<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet"><!-- BOOTSTRAP CSS -->
	<link href="${ctx}/css/bootstrap.css" rel="stylesheet">
</head>
<body marginwidth="0" marginheight="0">
    <div>
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">产品管理</a>>&nbsp;&nbsp;&nbsp;产品管理</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">编辑产品</h3>
        </div>
        <div class="public-content-cont">
            <form data-toggle="validator" class="form-horizontal" id="defaultForm" name="defaultForm" action="${ctx}/produce/editProduce" method="post">
            	<input type="hidden"  id="produceId" name="produceId"  value="${produce.produceId}">
                <div class="form-group ">
                    <label for="produceName" class=" control-label " >产品名称：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="produceName" name="produceName"  value="${produce.produceName}">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="produceItem" class=" control-label">货号：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="produceItem" name="produceItem"  value="${produce.produceItem}">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="produceSpecification" class=" control-label">规格：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="produceSpecification" name="produceSpecification"  value="${produce.produceSpecification}">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="produceUnit" class=" control-label">计量单位：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="produceUnit" name="produceUnit"  value="${produce.produceUnit}">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="produceNumber" class=" control-label">数量：</label>
                    <div class="col-sm-3">
                        <input type="number" class="form-control" id="produceNumber" name="produceNumber"  value="${produce.produceNumber}">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="produceTypename" class=" control-label">产品类型：</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="produceTypename"  name="produceTypename">
                            <option value="" >--请选择--</option>
                            <option value="0" <c:if test="${produce.produceTypename==0}">selected="selected"</c:if>>采购产品</option>
                            <option value="1" <c:if test="${produce.produceTypename==1}">selected="selected"</c:if>>自产产品</option>
                        </select>
                    </div>
                </div>
                <%-- <div id="purchase">
                    <div class="form-group ">
                        <label  class=" control-label" for="producePurchasedate">产品采购日期：</label>
                        <div class="col-sm-3">
                            <input type="date" class="form-control" id="producePurchasedate"  name="producePurchasedate" value="${produce.producePurchasedate}">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="produceOriginalprice" class=" control-label">产品原价：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="produceOriginalprice" name="produceOriginalprice"  value="${produce.produceOriginalprice}">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="roduceDiscount" class=" control-label">折扣：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="roduceDiscount" name="roduceDiscount"  value="${produce.roduceDiscount}">
                        </div>
                    </div>
                </div> --%>
                <div id="manufacture">
                    <div class="form-group ">
                        <label  class=" control-label" for="produceAdddate">产品添加日期：</label>
                        <div class="col-sm-3">
                            <input type="date" class="form-control" id="produceAdddate"  name="produceAdddate" value="${produce.produceAdddate}">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="produceDate" class=" control-label">生产日期：</label>
                        <div class="col-sm-3">
                            <input type="date" class="form-control" id="produceDate"  name="produceDate" value="${produce.produceDate}">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label for="produceBatch" class=" control-label">生产批次：</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="produceBatch" name="produceBatch"  value="${produce.produceBatch}">
                        </div>
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

    $(window).load(function(){
    	    var type=$("#produceTypename").val();
            if(type=="0"){
                $("#manufacture").hide();
            }else if(type=="1"){
                $("#manufacture").show();
            }else{
                $("#manufacture").hide();
            }
    });

    $(document).ready(function() {
        function randomNumber(min, max) {
            return Math.floor(Math.random() * (max - min + 1) + min);
        };
        $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));

        $('#manufacture').hide();

        $('#produceTypename').change(function () {
            var typeValue=$(this).children('option:selected').val();
            if(typeValue=="0"){
                $("#manufacture").hide();
            }else if(typeValue=="1"){
                $("#manufacture").show();
            }else{
                $("#manufacture").hide();
            }
        });
    });

</script>
</body>
</html>