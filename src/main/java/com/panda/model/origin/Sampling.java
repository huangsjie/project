package com.panda.model.origin;

import java.io.Serializable;
import java.util.Date;

public class Sampling implements Serializable {

    private String id;

    private String processBatchId;

    private String productId;

    private String orderNo;

    private Integer samplingNumber;

    private Date samplingTime;

    private Date machinStatus;

    private Date machinEnd;

    private String dicTeaGrade;

    private String operatorId;

    private Integer samplingBase;

    private String description;

    private String createId;

    private Date createTime;

    private String modifyId;

    private Date modifyTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProcessBatchId() {
        return processBatchId;
    }

    public void setProcessBatchId(String processBatchId) {
        this.processBatchId = processBatchId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getSamplingNumber() {
        return samplingNumber;
    }

    public void setSamplingNumber(Integer samplingNumber) {
        this.samplingNumber = samplingNumber;
    }

    public Date getSamplingTime() {
        return samplingTime;
    }

    public void setSamplingTime(Date samplingTime) {
        this.samplingTime = samplingTime;
    }

    public Date getMachinStatus() {
        return machinStatus;
    }

    public void setMachinStatus(Date machinStatus) {
        this.machinStatus = machinStatus;
    }

    public Date getMachinEnd() {
        return machinEnd;
    }

    public void setMachinEnd(Date machinEnd) {
        this.machinEnd = machinEnd;
    }

    public String getDicTeaGrade() {
        return dicTeaGrade;
    }

    public void setDicTeaGrade(String dicTeaGrade) {
        this.dicTeaGrade = dicTeaGrade;
    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
    }

    public Integer getSamplingBase() {
        return samplingBase;
    }

    public void setSamplingBase(Integer samplingBase) {
        this.samplingBase = samplingBase;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
}