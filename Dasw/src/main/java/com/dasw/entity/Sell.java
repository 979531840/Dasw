package com.dasw.entity;

public class Sell {
    private Integer orderId;

    private Integer produceId;

    private Integer produceNumber;

    private Double produceDiscount;

    private Double producePay;

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
}