<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.net.URLEncoder"
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>产品管理页</title>
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
    <div class="public-nav">您当前的位置：<a href="#">系统首页</a>><a href="#">产品管理</a>>&nbsp;&nbsp;&nbsp;产品管理</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">产品管理</h3>
        </div>
        <div class="public-content-cont">

            <form class="form-inline"  action="${ctx}/produce/produceList" method="post">
                <div >
                    <label for="produceName">产品名称:</label>
                    <input type="text" class="form-control" id="produceName" name="produceName" placeholder="产品名称" value="${sessionScope.produceName}">
                    &nbsp;&nbsp;
                    <label for="produceItem">货号:</label>
                    <input type="text" class="form-control" id="produceItem"  name="produceItem" placeholder="货号" value="${sessionScope.produceItem}">
                    &nbsp;&nbsp;
                    <label for="produceTypename">产品类型:</label>
                    <select id="produceTypename" name="produceTypename" class="form-control" >
                        <option value="" <c:if test="${sessionScope.produceTypename==' '}">selected="selected"</c:if>>--请选择--</option>
                        <option value="0" <c:if test="${sessionScope.produceTypename=='0'}">selected="selected"</c:if>>采购产品</option>
                        <option value="1" <c:if test="${sessionScope.produceTypename=='1'}">selected="selected"</c:if>>自产产品</option>
                    </select>
                    &nbsp;&nbsp;
                    <button type="submit" class="btn btn-success">查找</button>
                    &nbsp;&nbsp;&nbsp;
                    <input type="button" class="btn btn-primary" onclick="javascript:window.location.href='${ctx}/produce/addLoad'" value="添加"/>
                </div>
            </form>

            <div class="a">
                <table class="table table-striped">
                    <thead>
                    <tr >
                        <th >产品名称</th>
                        <th>货号</th>
                        <th>产品类型</th>
                        <th>规格</th>
                        <th>计量单位</th>
                        <!-- <th>单价</th> -->
                        <th>数量</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody> 
				  		<c:forEach items="${pagemsg.list}"  var="produce">
					     	<tr>
					  			<td>${produce.produceName}</td>
					  			<td>${produce.produceItem}</td>
					  			<c:if test="${produce.produceTypename=='0'}">
					  				<td>采购产品</td>
					  			</c:if>
					  			<c:if test="${produce.produceTypename=='1'}">
					  				<td>自产产品</td>
					  			</c:if>
					  			<td>${produce.produceSpecification}</td>
					  			<td>${produce.produceUnit}</td>
					  			<%-- <c:if test="${produce.produceTypename=='0'}">
					  			<td>${produce.produceOriginalprice}</td>
					  			</c:if>
					  			<c:if test="${produce.produceTypename=='1'}">
					  				<td></td>
					  			</c:if> --%>
					  			<td>${produce.produceNumber}</td>
					  			<td><a href="${ctx}/produce/editLoad?id=${produce.produceId}">修改</a> <a href="${ctx}/purchase/addLoad?produceId=${produce.produceId}">添加采购</a>  <a href="${ctx}/produce/deleteProduce?id=${produce.produceId}">删除</a> </td>
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
                    		
                        	<a href="${ctx}/produce/produceList?pageIndex=1">首页</a>
                    		
                        	<a href="${ctx}/produce/produceList?pageIndex=${requestScope.pagemsg.pageIndex-1}" aria-label="Previous">
                            	<span aria-hidden="true">上一页</span>
                        	</a>
                    	</c:if>
                    </li>
                    <li>
                    	<c:if test="${requestScope.pagemsg.pageIndex != requestScope.pagemsg.totalPage}">
                    		<a href="${ctx}/produce/produceList?pageIndex=${requestScope.pagemsg.pageIndex+1}" aria-label="Next">
                            	<span>下一页</span>
                        	</a>
                    		<a href="${ctx}/produce/produceList?pageIndex=${requestScope.pagemsg.totalPage}">尾页</a>
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
