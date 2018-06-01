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
    <meta charset="UTF-8">
    <title>后台欢迎页</title>
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
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">人员管理</a>>&nbsp;&nbsp;&nbsp;供应商管理</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">供应商管理</h3>
        </div>
        <div class="public-content-cont">

            <form class="form-inline" action="${ctx}/supplier/supplierList" method="post">
                <div >
                    <label for="">供应商查询:</label>
                    <input type="text" class="form-control" id="supplierName" name="supplierName" value="${sessionScope.supplierName}"   placeholder="供应商姓名" >
                    <input type="text" class="form-control" id="supplierCompany" name="supplierCompany" value="${sessionScope.supplierCompany}"   placeholder="单位名称" >
                    <button type="submit" class="btn btn-default">查找</button>
                    &nbsp;&nbsp;
                    <!-- <input type="button" class="btn btn-primary" onclick="javascript:window.location.href='addSupplier.html'" value="添加"/> -->
                    <a type="button" class="btn btn-default"  href="${ctx}/supplier/addLoad">添加</a>
                </div>
            </form>

            <div class="a">
                <table class="table table-striped">
                    <thead>
                        <tr >
                            <th >供货商名称</th>
                            <th>联系电话</th>
                            <th>单位名称</th>
                            <th>单位地址</th>
                            <th>单位电话</th>
                            <th>QQ</th>
                            <th>邮箱</th>
                            <th>操作</th>
                        </tr>
                    </thead>

                    <tbody>
                  		<c:forEach items="${pagemsg.list}"  var="supplier">
					     	<tr>
					  			<td>${supplier.supplierName}</td>
					  			<td>${supplier.supplierTel}</td>
					  			<td>${supplier.supplierCompany}</td>
					  			<td>${supplier.supplierAddress}</td>
					  			<td>${supplier.supplierPhone}</td>
					  			<td>${supplier.supplierQq}</td>
					  			<td>${supplier.supplierEmail}</td>
					  			<td><%-- <a href="${ctx}/supplier/addLoad">增加</a> --%> <a href="${ctx}/supplier/editLoad?id=${supplier.supplierId}">修改</a>   <a href="${ctx}/supplier/delete?id=${supplier.supplierId}">删除</a> </td>
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
                    		
                        	<a href="${ctx}/supplier/supplierList?pageIndex=1">首页</a>
                    		
                        	<a href="${ctx}/supplier/supplierList?pageIndex=${requestScope.pagemsg.pageIndex-1}" aria-label="Previous">
                            	<span aria-hidden="true">上一页</span>
                        	</a>
                    	</c:if>
                    </li>
                    <li>
                    	<c:if test="${requestScope.pagemsg.pageIndex != requestScope.pagemsg.totalPage}">
                    		<a href="${ctx}/supplier/supplierList?pageIndex=${requestScope.pagemsg.pageIndex+1}" aria-label="Next">
                            	<span>下一页</span>
                        	</a>
                    		<a href="${ctx}/supplier/supplierList?pageIndex=${requestScope.pagemsg.totalPage}">尾页</a>
                    	</c:if>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script src="<%=basePath%>kingediter/kindeditor-all-min.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id');
    });
</script>
</body>
</html>