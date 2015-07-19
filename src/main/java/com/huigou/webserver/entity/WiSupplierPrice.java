package com.huigou.webserver.entity;

import java.math.BigDecimal;
import java.util.Date;

public class WiSupplierPrice {
    private Long id;

    private Long supperlierId;

    private Long materialsId;

    private BigDecimal mprice;

    private Integer status;

    private Date createTime;

    private Long createBy;

    private Date updateTime;

    private Long updateBy;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSupperlierId() {
        return supperlierId;
    }

    public void setSupperlierId(Long supperlierId) {
        this.supperlierId = supperlierId;
    }

    public Long getMaterialsId() {
        return materialsId;
    }

    public void setMaterialsId(Long materialsId) {
        this.materialsId = materialsId;
    }

    public BigDecimal getMprice() {
        return mprice;
    }

    public void setMprice(BigDecimal mprice) {
        this.mprice = mprice;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Long getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(Long updateBy) {
        this.updateBy = updateBy;
    }
}