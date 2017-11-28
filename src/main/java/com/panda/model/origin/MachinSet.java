package com.panda.model.origin;

import java.io.Serializable;
import java.util.Date;

public class MachinSet implements Serializable {

    private String id;

    private String dicMacType;

    private String dicTeaAttr;

    private String dicMacPro;

    private String dicTeaType;

    private String dicTeaGra;

    private Date beginTime;

    private Date endTime;

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

    public String getDicMacType() {
        return dicMacType;
    }

    public void setDicMacType(String dicMacType) {
        this.dicMacType = dicMacType;
    }

    public String getDicTeaAttr() {
        return dicTeaAttr;
    }

    public void setDicTeaAttr(String dicTeaAttr) {
        this.dicTeaAttr = dicTeaAttr;
    }

    public String getDicMacPro() {
        return dicMacPro;
    }

    public void setDicMacPro(String dicMacPro) {
        this.dicMacPro = dicMacPro;
    }

    public String getDicTeaType() {
        return dicTeaType;
    }

    public void setDicTeaType(String dicTeaType) {
        this.dicTeaType = dicTeaType;
    }

    public String getDicTeaGra() {
        return dicTeaGra;
    }

    public void setDicTeaGra(String dicTeaGra) {
        this.dicTeaGra = dicTeaGra;
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