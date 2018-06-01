package com.dasw.entity;

public class Produce {
    private Integer produceId;

    private String produceName;

    private String produceTypename;

    private String produceItem;

    private String produceSpecification;

    private String produceUnit;

    private Long produceNumber;

    private String producePurchasedate;

    private Double produceOriginalprice;

    private Double roduceDiscount;

    private String produceAdddate;

    private String produceDate;

    private String produceBatch;

    private String produceContent;

    public Integer getProduceId() {
        return produceId;
    }

    public void setProduceId(Integer produceId) {
        this.produceId = produceId;
    }

    public String getProduceName() {
        return produceName;
    }

    public void setProduceName(String produceName) {
        this.produceName = produceName == null ? null : produceName.trim();
    }

    public String getProduceTypename() {
        return produceTypename;
    }

    public void setProduceTypename(String produceTypename) {
        this.produceTypename = produceTypename == null ? null : produceTypename.trim();
    }

    public String getProduceItem() {
        return produceItem;
    }

    public void setProduceItem(String produceItem) {
        this.produceItem = produceItem == null ? null : produceItem.trim();
    }

    public String getProduceSpecification() {
        return produceSpecification;
    }

    public void setProduceSpecification(String produceSpecification) {
        this.produceSpecification = produceSpecification == null ? null : produceSpecification.trim();
    }

    public String getProduceUnit() {
        return produceUnit;
    }

    public void setProduceUnit(String produceUnit) {
        this.produceUnit = produceUnit == null ? null : produceUnit.trim();
    }

    public Long getProduceNumber() {
        return produceNumber;
    }

    public void setProduceNumber(Long produceNumber) {
        this.produceNumber = produceNumber;
    }

    public String getProducePurchasedate() {
        return producePurchasedate;
    }

    public void setProducePurchasedate(String producePurchasedate) {
        this.producePurchasedate = producePurchasedate;
    }

    public Double getProduceOriginalprice() {
        return produceOriginalprice;
    }

    public void setProduceOriginalprice(Double produceOriginalprice) {
        this.produceOriginalprice = produceOriginalprice;
    }

    public Double getRoduceDiscount() {
        return roduceDiscount;
    }

    public void setRoduceDiscount(Double roduceDiscount) {
        this.roduceDiscount = roduceDiscount;
    }

    public String getProduceAdddate() {
        return produceAdddate;
    }

    public void setProduceAdddate(String produceAdddate) {
        this.produceAdddate = produceAdddate;
    }

    public String getProduceDate() {
        return produceDate;
    }

    public void setProduceDate(String produceDate) {
        this.produceDate = produceDate;
    }

    public String getProduceBatch() {
        return produceBatch;
    }

    public void setProduceBatch(String produceBatch) {
        this.produceBatch = produceBatch == null ? null : produceBatch.trim();
    }

    public String getProduceContent() {
        return produceContent;
    }

    public void setProduceContent(String produceContent) {
        this.produceContent = produceContent == null ? null : produceContent.trim();
    }
    
    public String toString(){
    	return produceName;
    }
}