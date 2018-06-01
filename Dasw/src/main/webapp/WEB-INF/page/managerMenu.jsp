<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<ul class="left-nav-list">
                <li class="public-ifame-item">
					<a href="javascript:">销售管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="<%=basePath%>order/orderList" target="content">订单管理</a></li>
							<li><a href="<%=basePath%>send/sendList" target="content">发货管理</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:">产品管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="<%=basePath%>produce/produceList" target="content">产品管理</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:">采购管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="<%=basePath%>purchase/purchaseList" target="content">采购管理</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:">供应商管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="<%=basePath%>supplier/supplierList" target="content">供应商管理</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:">财务管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="<%=basePath%>invoice/invoiceList" target="content">发票管理</a></li>
							<li><a href="<%=basePath%>financial/financialList" target="content">财务查询</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:">人员管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="<%=basePath%>user/userList" target="content">员工管理</a></li>
							<li><a href="<%=basePath%>customer/customerList" target="content">客户管理</a></li>
						</ul>
					</div>
				</li>
			</ul>