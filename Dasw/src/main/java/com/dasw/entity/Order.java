package com.dasw.entity;

import java.util.Date;

public class Order {
    private Integer orderId;

    private Integer customerId;

    private Integer userId;

    private Date orderDate;

    private Double orderTotalprice;

    private Integer orderStatus;

    private Integer orderFlag;

    private Double orderPay;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
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

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", customerId=" + customerId
				+ ", userId=" + userId + ", orderDate=" + orderDate
				+ ", orderTotalprice=" + orderTotalprice + ", orderStatus="
				+ orderStatus + ", orderFlag=" + orderFlag + ", orderPay="
				+ orderPay + "]";
	}
    
}