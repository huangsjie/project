package com.panda.model.origin;

import java.io.Serializable;
import java.util.Date;

public class EquipmentMaintain implements Serializable{
    private String id;

    private String equipmentId;

    private String maintainType;

    private Date maintainTime;

    private Integer maintainStatus;

    private String imgUrl;

    private String description;

    private Date createTime;

    private String createId;

    private String modifyId;

    private Date modifyTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(String equipmentId) {
        this.equipmentId = equipmentId;
    }

    public String getMaintainType() {
        return maintainType;
    }

    public void setMaintainType(String maintainType) {
        this.maintainType = maintainType;
    }

    public Date getMaintainTime() {
        return maintainTime;
    }

    public void setMaintainTime(Date maintainTime) {
        this.maintainTime = maintainTime;
    }

    public Integer getMaintainStatus() {
        return maintainStatus;
    }

    public void setMaintainStatus(Integer maintainStatus) {
        this.maintainStatus = maintainStatus;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateId() {
        return createId;
    }

    public void setCreateId(String createId) {
        this.createId = createId;
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