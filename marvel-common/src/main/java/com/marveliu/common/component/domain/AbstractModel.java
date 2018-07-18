package com.marveliu.common.component.domain;

import com.marveliu.common.constants.Constants;
import io.swagger.annotations.ApiModelProperty;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.util.Date;

/**
 * @Author Marveliu
 * @Date 2018/7/18 8:33 PM
 **/

@MappedSuperclass
public abstract class AbstractModel<ID extends Serializable> implements BaseModel<ID> {

    private static final long serialVersionUID = 1195969732659409799L;

    @ApiModelProperty(value = "创建者ID")
    @Column(columnDefinition = "int default 0")
    private int creator = 0;

    @Column(updatable = false, columnDefinition = "datetime " +
            "NOT NULL " +
            "DEFAULT CURRENT_TIMESTAMP " +
            "COMMENT '创建时间'")
    private Date createTime;

    @ApiModelProperty(value = "最后修改人")
    @Column(columnDefinition = "int default 0")
    private int updator = 0;

    @Column(columnDefinition = "String " +
            "COMMENT '最近修改时间'")
    private Date operateTime;

    @Column(columnDefinition = "varchar(200) " +
            "COMMENT '备注'")
    private String remark;

    @ApiModelProperty(value = "标记删除字段 0未删除 1已删除 ")
    @Column(name = "del", columnDefinition = "tinyint default 0")
    private int del = Constants.DEL_NO;


    public int getCreator() {
        return creator;
    }

    public void setCreator(int creator) {
        this.creator = creator;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getUpdator() {
        return updator;
    }

    public void setUpdator(int updator) {
        this.updator = updator;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getDel() {
        return del;
    }

    public void setDel(int del) {
        this.del = del;
    }
}
