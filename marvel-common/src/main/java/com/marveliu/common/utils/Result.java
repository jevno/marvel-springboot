package com.marveliu.common.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author Marveliu
 * @Date 2018/7/18 9:05 PM
 **/

public class Result<T> {

    private int code;//状态码

    private String msg;//信息

    private Object data;//数据

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Result() {
    }

    public Result(int code) {
        this.code = code;
    }

    public Result(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Map<String, Object> toMap() {
        HashMap<String, Object> result = new HashMap<String, Object>();
        result.put("code", code);
        result.put("msg", msg);
        result.put("data", data);
        return result;
    }

    @Override
    public String toString() {
        return "Result{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}