package com.panda.model.origin;

import java.io.Serializable;
import java.util.Date;

public class OriginCode implements Serializable {
    private String id;

    private String originBatchId;

    private String prefixVal;

    private String originCode;

    private String createId;

    private Date createTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOriginBatchId() {
        return originBatchId;
    }

    public void setOriginBatchId(String originBatchId) {
        this.originBatchId = originBatchId;
    }

    public String getPrefixVal() {
        return prefixVal;
    }

    public void setPrefixVal(String prefixVal) {
        this.prefixVal = prefixVal;
    }

    public String getOriginCode() {
        return originCode;
    }

    public void setOriginCode(String originCode) {
        this.originCode = originCode;
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
}