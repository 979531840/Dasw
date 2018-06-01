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
    <title>修改业务员信息</title>
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
    <div class="public-nav">您当前的位置：<a href="">系统首页</a>><a href="">人员管理</a>>&nbsp;&nbsp;&nbsp;员工管理</div>
    <div class="public-content">
        <div class="public-content-header">
            <h3 style="font-size:15px;font-weight:bold;">修改业务员信息</h3>
        </div>
         <div class="public-content-cont">
            <form data-toggle="validator" class="form-horizontal" id="defaultForm" name="defaultForm"  action="${ctx}/user/edit"  method="post">
                <input type="hidden"   id="userId" name="userId" value="${user.userId}" />
                <div class="form-group ">
                    <label for="userName" class=" control-label " >员工姓名：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="userName" name="userName"  placeholder="员工姓名" value="${user.userName}">
                    </div>
                </div>
                <%-- <div class="form-group ">
                    <label for="userType" class=" control-label">员工类型：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="userType" name="userType" placeholder="员工类型" value="${user.userType}">
                    </div>
                </div> --%>
                 <div class="form-group ">
                    <label for="userType" class=" control-label">客户类型：</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="userType"  name="userType">
                            <option value="" >--请选择--</option>
                            <option value="0" <c:if test="${user.userType==0}">selected="selected"</c:if>>管理员</option>
                            <option value="1" <c:if test="${user.userType==1}">selected="selected"</c:if>>普通用户</option>
                        </select>
                    </div>
                </div>
                 <div class="form-group ">
                    <label for="userAge" class=" control-label">年龄：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="userAge" name="userAge" placeholder="年龄" value="${user.userAge}">
                    </div>
                </div>
                <div class="form-group ">
                    <label  class=" control-label" for="userSex">性别：</label>
                     <div class="col-sm-3">
                    		<select id="userSex" name="userSex" value="${user.userSex}" class="form-control">
									<option>男</option>
									<option>女</option>
							</select>
                        <!-- <input type="text" class="form-control" id="userSex" name="userSex" placeholder="性别"  value=""> -->
                    </div>
                    <%-- <div class="col-sm-3">
                        <input type="text" class="form-control" id="userSex" name="userSex" placeholder="性别" value="${user.userSex}">
                    </div> --%>
                </div>  
                <div class="form-group ">
                    <label for="userEmail" class=" control-label">邮箱：</label>
                    <div class="col-sm-3">
                        <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="邮箱" value="${user.userEmail}">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="userUsername" class=" control-label">用户名：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="userUsername" name="userUsername" placeholder="用户名" value="${user.userUsername}">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="userPassword" class=" control-label">用户密码：</label>
                    <div class="col-sm-3">
                        <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="用户密码" value="${user.userPassword}">
                    </div>
                </div>
               
                <div class="form-group ">
                    <label for="userTel" class=" control-label">联系方式：</label>
                    <div class="col-sm-3">
                        <input type="number" class="form-control" id="userTel" name="userTel" placeholder="联系方式" value="${user.userTel}">
                    </div>
                </div>
                <div class="form-group ">
                    <label for="userAddress" class=" control-label">联系地址：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="userAddress" name="userAddress"  value="${user.userAddress}">
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