package com.panda.model.origin;

import java.util.Date;

public class StockList {
    private String id;

    private String cultivarId;

    private String warehouseId;

    private String createId;

    private Date createTime;

    private String modifyId;

    private Date modifyTime;

    private Integer status;

    private String description;

    private Float stockNumber;

    private Date stockTime;

    private String operatorId;

    private String stockObjectId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCultivarId() {
        return cultivarId;
    }

    public void setCultivarId(String cultivarId) {
        this.cultivarId = cultivarId;
    }

    public String getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(String warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getCreateId() {
        return createId;
    }

    public void setCreateId(String createId) {
        this.createId = createId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getModifyId() {
        return modifyId;
    }

    public void setModifyId(String modifyId) {
        this.modifyId = modifyId;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Float getStockNumber() {
        return stockNumber;
    }

    public void setStockNumber(Float stockNumber) {
        this.stockNumber = stockNumber;
    }

    public Date getStockTime() {
        return stockTime;
    }

    public void setStockTime(Date stockTime) {
        this.stockTime = stockTime;
    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
    }

    public String getStockObjectId() {
        return stockObjectId;
    }

    public void setStockObjectId(String stockObjectId) {
        this.stockObjectId = stockObjectId;
    }
}