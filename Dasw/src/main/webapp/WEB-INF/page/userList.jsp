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
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">人员管理</a>>&nbsp;&nbsp;&nbsp;员工管理</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">员工管理</h3>
        </div>
        <div class="public-content-cont">

            <form class="form-inline" action="${ctx}/user/userList" method="post" >
                <div >
                    <label  for="username">员工查询:</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="业务员姓名"  value="${sessionScope.userName}" />
                    <input type="text" class="form-control" id="userUsername" name="userUsername" placeholder="用户名查询"  value="${sessionScope.userUsername}" />
                    <button type="submit" class="btn btn-default">查找</button>
                    &nbsp;&nbsp;
                    <!-- <input type="button" class="btn btn-primary" onclick="javascript:window.location.href='addUser.html'" value="添加"/> -->
                    <a type="button" class="btn btn-default"  href="${ctx}/user/addLoad">添加</a>
                </div>
            </form>

            <div class="a">
                <table class="table table-striped">
                    <thead>
			  			<th>用户ID</th>
			  			<th>用户昵称</th>
			  			<th>用户类型</th>
			  			<th>用户年龄</th>
			  			<th>用户性别</th>
			  			<th>用户Email</th>
			  			<th>用户名</th>
			  			<th>用户密码</th>
			  			<th>用户电话</th>
			  			<th>用户地址</th>
			  			<th>操作</th>
                    </thead>

                    <tbody>
                    	<c:forEach items="${pagemsg.list}"  var="user">
					     	<tr>
					  			<td>${user.userId}</td>
					  			<td>${user.userName}</td>
					  			<c:if test="${user.userType=='0' }">
					  				<td>管理员</td>
					  			</c:if>
					  			<c:if test="${user.userType=='1' }">
					  				<td>用户</td>
					  			</c:if>
					  			<td>${user.userAge}</td>
					  			<td>${user.userSex}</td>
					  			<td>${user.userEmail}</td>
					  			<td>${user.userUsername}</td>
					  			<td>${user.userPassword}</td>
					  			<td>${user.userTel}</td>
					  			<td>${user.userAddress}</td>
					  			<td><%-- <a href="${ctx}/user/addLoad">增加</a> --%> <a href="${ctx}/user/editLoad?id=${user.userId}">修改</a>   <a href="${ctx}/user/delete?id=${user.userId}">删除</a> </td>
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
                    		
                        	<a href="${ctx}/user/userList?pageIndex=1">首页</a>
                    		
                        	<a href="${ctx}/user/userList?pageIndex=${requestScope.pagemsg.pageIndex-1}" aria-label="Previous">
                            	<span aria-hidden="true">上一页</span>
                        	</a>
                    	</c:if>
                    </li>
                    <li>
                    	<c:if test="${requestScope.pagemsg.pageIndex != requestScope.pagemsg.totalPage}">
                    		<a href="${ctx}/user/userList?pageIndex=${requestScope.pagemsg.pageIndex+1}" aria-label="Next">
                            	<span>下一页</span>
                        	</a>
                    		<a href="${ctx}/user/userList?pageIndex=${requestScope.pagemsg.totalPage}">尾页</a>
                    	</c:if>
                    </li>
                </ul>
            </nav>
 	</div> 
</div>
<script src="kingediter/kindeditor-all-min.js"></script>
<script>
    KindEditor.ready(function(K) {
        window.editor = K.create('#editor_id');
    });
</script>
</body>
</html>