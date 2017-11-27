package com.panda.model.origin;

import java.io.Serializable;
import java.util.Date;

public class TeaGardenLog implements Serializable {

    private String id;

    private String teaGardenId;

    private String farmTypeId;

    private String farmDesc;

    private String cultivarId;

    private Date beginTime;

    private Date endTime;

    private String operatorId;

    private Integer status;

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

    public String getTeaGardenId() {
        return teaGardenId;
    }

    public void setTeaGardenId(String teaGardenId) {
        this.teaGardenId = teaGardenId;
    }

    public String getFarmTypeId() {
        return farmTypeId;
    }

    public void setFarmTypeId(String farmTypeId) {
        this.farmTypeId = farmTypeId;
    }

    public String getFarmDesc() {
        return farmDesc;
    }

    public void setFarmDesc(String farmDesc) {
        this.farmDesc = farmDesc;
    }

    public String getCultivarId() {
        return cultivarId;
    }

    public void setCultivarId(String cultivarId) {
        this.cultivarId = cultivarId;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
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