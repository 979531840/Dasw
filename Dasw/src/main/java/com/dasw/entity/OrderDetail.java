package com.dasw.entity;

import java.util.Date;

public class OrderDetail {

	private Integer orderId;

    private String customerName;

    private String  userName;

    private Date orderDate;
    
//    private List<Produce> produceList;  

    private Double orderTotalprice;

    private Integer orderStatus;

    private Integer orderFlag;

    private Double orderPay;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer oorderId) {
		this.orderId = oorderId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}


	public Double getOrderTotalprice() {
		return orderTotalprice;
	}

	public void setOrderTotalprice(Double orderTotalprice) {
		this.orderTotalprice = orderTotalprice;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Integer getOrderFlag() {
		return orderFlag;
	}

	public void setOrderFlag(Integer orderFlag) {
		this.orderFlag = orderFlag;
	}

	public Double getOrderPay() {
		return orderPay;
	}

	public void setOrderPay(Double orderPay) {
		this.orderPay = orderPay;
	}
    
    
	
}
