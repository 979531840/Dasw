package com.dasw.entity;

import java.util.List;

public class Financial {
	
	private Integer orderId;

	private Customer customer;
	
	private List<Produce> produceList;
	
	private Double orderTotalprice;
	
	private Double orderPay;
	
	private String orderDate;
	
	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<Produce> getProduceList() {
		return produceList;
	}

	public void setProduceList(List<Produce> produceList) {
		this.produceList = produceList;
	}

	public Double getOrderTotalprice() {
		return orderTotalprice;
	}

	public void setOrderTotalprice(Double orderTotalprice) {
		this.orderTotalprice = orderTotalprice;
	}

	public Double getOrderPay() {
		return orderPay;
	}

	public void setOrderPay(Double orderPay) {
		this.orderPay = orderPay;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

}
