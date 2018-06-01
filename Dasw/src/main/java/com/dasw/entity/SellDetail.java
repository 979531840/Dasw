package com.dasw.entity;

public class SellDetail {
	
	private Integer orderId;

    private Integer produceId;

    private Integer produceNumber;

    private Double produceDiscount;

    private Double producePay;
    
    private String produceName;
    
    private String produceUnit;
    
    private String produceItem;
    
    private Double produceOriginalprice;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getproduceId() {
		return produceId;
	}

	public void setproduceId(Integer produceId) {
		this.produceId = produceId;
	}

	public Integer getproduceNumber() {
		return produceNumber;
	}

	public void setproduceNumber(Integer produceNumber) {
		this.produceNumber = produceNumber;
	}

	public Double getproduceDiscount() {
		return produceDiscount;
	}

	public void setproduceDiscount(Double produceDiscount) {
		this.produceDiscount = produceDiscount;
	}

	public Double getproducePay() {
		return producePay;
	}

	public void setproducePay(Double producePay) {
		this.producePay = producePay;
	}

	public String getProduceName() {
		return produceName;
	}

	public void setProduceName(String produceName) {
		this.produceName = produceName;
	}

	public String getProduceItem() {
		return produceItem;
	}

	public void setProduceItem(String produceItem) {
		this.produceItem = produceItem;
	}

	public Double getProduceOriginalprice() {
		return produceOriginalprice;
	}

	public void setProduceOriginalprice(Double produceOriginalprice) {
		this.produceOriginalprice = produceOriginalprice;
	}

	public String getProduceUnit() {
		return produceUnit;
	}

	public void setProduceUnit(String produceUnit) {
		this.produceUnit = produceUnit;
	}
    
    
}
