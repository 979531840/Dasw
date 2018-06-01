package com.dasw.entity;

import java.util.Date;

public class PurchaseDetail {

	private Integer purchaseId;
	
	private Integer supplierId;
	
	private Integer stockProductId;  
	
	private String produceName;  //产品名称
	
	private String produceItem;  //货号
	
	private String supplierName;  //供货商
	
	private Date purchaseDate;   //采购日期
	
	private Integer supplierNumber;
	
	private Double supplierPrice;
	
	private String supplierBatch;
	
	private Double supplierMoney;
	
	private Double supplierRate;
	
	private Double supplierRatemoney;
	
	private String produceUnit;  //计量单位
	
	

	public Integer getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(Integer purchaseId) {
		this.purchaseId = purchaseId;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public Integer getStockProductId() {
		return stockProductId;
	}

	public void setStockProductId(Integer stockProductId) {
		this.stockProductId = stockProductId;
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

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public Integer getSupplierNumber() {
		return supplierNumber;
	}

	public void setSupplierNumber(Integer supplierNumber) {
		this.supplierNumber = supplierNumber;
	}

	public Double getSupplierPrice() {
		return supplierPrice;
	}

	public void setSupplierPrice(Double supplierPrice) {
		this.supplierPrice = supplierPrice;
	}

	public String getSupplierBatch() {
		return supplierBatch;
	}

	public void setSupplierBatch(String supplierBatch) {
		this.supplierBatch = supplierBatch;
	}

	public Double getSupplierMoney() {
		return supplierMoney;
	}

	public void setSupplierMoney(Double supplierMoney) {
		this.supplierMoney = supplierMoney;
	}

	public Double getSupplierRate() {
		return supplierRate;
	}

	public void setSupplierRate(Double supplierRate) {
		this.supplierRate = supplierRate;
	}

	public Double getSupplierRatemoney() {
		return supplierRatemoney;
	}

	public void setSupplierRatemoney(Double supplierRatemoney) {
		this.supplierRatemoney = supplierRatemoney;
	}

	public String getProduceUnit() {
		return produceUnit;
	}

	public void setProduceUnit(String produceUnit) {
		this.produceUnit = produceUnit;
	}

	
}
