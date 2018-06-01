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
	<base href="<%=basePath%>">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link rel="stylesheet" href="<%=basePath%>css/reset.css">
	<link rel="stylesheet" href="<%=basePath%>css/public.css">
</head>
<body>
<div class="public-header-warrp">
	<div class="public-header">
		<div class="content">
			<div class="public-header-logo"><a href=""><i>LOGO</i><h3>戴安进销存管理</h3></a></div>
			<div class="public-header-admin fr">
				<p class="admin-name">${user.userUsername}管理员 您好！</p>
				<div class="public-header-fun fr">
					<a href="" class="public-header-man">管理</a>
					<a href="" class="public-header-loginout">安全退出</a>	
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<!-- 内容展示 -->
<div class="public-ifame mt20">
	<div class="content">
	<!-- 内容模块头 -->
		<!-- 左侧导航栏 -->
		<div class="public-ifame-leftnav">
			<div class="public-title-warrp">
				<div class="public-ifame-title ">
					<a href="">首页</a>
				</div>
			</div>
			<ul class="left-nav-list">
				<!--<li class="public-ifame-item">
					<a href="javascript:">系统管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li class="active"><a href="系统管理/config.html" target="content">网站配置</a></li>
							<li><a href="系统管理/pass.html" target="content">修改管理员密码</a></li>
						</ul>
					</div>
				</li>-->
				<li class="public-ifame-item">
					<a href="javascript:">产品管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="production.html" target="content">产品管理</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:">销售管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="orderSelect.html" target="content">订单管理</a></li>
							<li><a href="sendSelect.html" target="content">发货管理</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:">采购管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="purchaseSelect.html" target="content">采购管理</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:">财务管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="invoice.html" target="content">发票管理</a></li>
							<li><a href="blank.html" target="content">财务查询</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:">人员管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="<%=basePath%>user/userList" target="content">员工管理</a></li>
							<li><a href="<%=basePath%>customer/customerList" target="content">客户管理</a></li>
							<li><a href="<%=basePath%>supplier/supplierList" target="content">供应商管理</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<!-- 右侧内容展示部分 -->
		<div class="public-ifame-content">
		<iframe name="content" src="user/main" frameborder="0" id="mainframe" scrolling="yes" marginheight="0" marginwidth="0" width="100%" style="height: 700px;"></iframe>
		</div>
	</div>
</div>
<script src="js/jquery.min.js"></script>
<script>
$().ready(function(){
	var item = $(".public-ifame-item");

	for(var i=0; i < item.length; i++){
		$(item[i]).on('click',function(){
			$(".ifame-item-sub").hide();
			if($(this.lastElementChild).css('display') == 'block'){
				$(this.lastElementChild).hide()
				$(".ifame-item-sub li").removeClass("active");
			}else{
				$(this.lastElementChild).show();
				$(".ifame-item-sub li").on('click',function(){
					$(".ifame-item-sub li").removeClass("active");
					$(this).addClass("active");
				});
			}
		});
	}
});
</script>
</body>
</html>