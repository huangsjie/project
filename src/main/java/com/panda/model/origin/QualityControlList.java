package com.panda.model.origin;

import java.util.Date;

public class QualityControlList {
    private String id;

    private String samplingId;

    private Integer checkStatus;

    private Date checkTime;

    private String operatorId;

    private Integer reCheckStatus;

    private String reCheckUssr;

    private Date reCheckTime;

    private String createId;

    private Date createTime;

    private String modifyId;

    private Date modifyTime;

    private Integer status;

    private String description;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSamplingId() {
        return samplingId;
    }

    public void setSamplingId(String samplingId) {
        this.samplingId = samplingId;
    }

    public Integer getCheckStatus() {
        return checkStatus;
    }

    public void setCheckStatus(Integer checkStatus) {
        this.checkStatus = checkStatus;
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
    }

    public Integer getReCheckStatus() {
        return reCheckStatus;
    }

    public void setReCheckStatus(Integer reCheckStatus) {
        this.reCheckStatus = reCheckStatus;
    }

    public String getReCheckUssr() {
        return reCheckUssr;
    }

    public void setReCheckUssr(String reCheckUssr) {
        this.reCheckUssr = reCheckUssr;
    }

    public Date getReCheckTime() {
        return reCheckTime;
    }

    public void setReCheckTime(Date reCheckTime) {
        this.reCheckTime = reCheckTime;
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
}