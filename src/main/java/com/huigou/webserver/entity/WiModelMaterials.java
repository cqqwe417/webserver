package com.huigou.webserver.entity;

import java.util.Date;

public class WiModelMaterials {
    private Long id;

    private Long modelId;

    private Long materials;

    private Integer count;

    private Integer modelparm;

    private Integer status;

    private Long createBy;

    private Date createTime;

    private Long updateBy;

    private Date updateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getModelId() {
        return modelId;
    }

    public void setModelId(Long modelId) {
        this.modelId = modelId;
    }

    public Long getMaterials() {
        return materials;
    }

    public void setMaterials(Long materials) {
        this.materials = materials;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getModelparm() {
        return modelparm;
    }

    public void setModelparm(Integer modelparm) {
        this.modelparm = modelparm;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(Long updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}