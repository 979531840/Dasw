package com.dasw.entity;

import java.util.Date;

public class Send extends SendKey {
    private Date sendDate;

	private String sendWay;

	private String sendCourierid;

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