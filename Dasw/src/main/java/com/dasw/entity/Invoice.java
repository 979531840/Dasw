package com.dasw.entity;



public class Invoice {
    private Integer invoiceId;

    private Integer orderId;

    private String invoiceNumber;

    private String invoiceOwm;

    private String  invoicePaydate;

    private String invoiceWay;

    private String invoiceDate;

    private Double invoiceMoney;

    private String invoiceFlag;

    public Integer getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(Integer invoiceId) {
        this.invoiceId = invoiceId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    public String getInvoiceOwm() {
        return invoiceOwm;
    }

    public void setInvoiceOwm(String invoiceOwm) {
        this.invoiceOwm = invoiceOwm;
    }

    public String getInvoicePaydate() {
        return invoicePaydate;
    }

    public void setInvoicePaydate(String invoicePaydate) {
        this.invoicePaydate = invoicePaydate;
    }

    public String getInvoiceWay() {
        return invoiceWay;
    }

    public void setInvoiceWay(String invoiceWay) {
        this.invoiceWay = invoiceWay;
    }

    public String getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(String invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public Double getInvoiceMoney() {
        return invoiceMoney;
    }

    public void setInvoiceMoney(Double invoiceMoney) {
        this.invoiceMoney = invoiceMoney;
    }

    public String getInvoiceFlag() {
        return invoiceFlag;
    }

    public void setInvoiceFlag(String invoiceFlag) {
        this.invoiceFlag = invoiceFlag;
    }
}