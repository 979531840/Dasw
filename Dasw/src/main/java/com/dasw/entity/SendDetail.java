package com.dasw.entity;

import java.util.Date;

public class SendDetail {
	
	private Integer sendId;

    private Integer orderId;
    
    private String customerName;
    
    private Date sendDate;

    private String sendWay;
    
    private String sendCourierid;

	public Integer getSendId() {
		return sendId;
	}

	public void setSendId(Integer sendId) {
		this.sendId = sendId;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}


	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	public String getSendWay() {
		return sendWay;
	}

	public void setSendWay(String sendWay) {
		this.sendWay = sendWay;
	}

	public String getSendCourierid() {
		return sendCourierid;
	}

	public void setSendCourierid(String sendCourierid) {
		this.sendCourierid = sendCourierid;
	}
    
	
}
