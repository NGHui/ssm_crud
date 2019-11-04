package com.hui.crud.commons;

/**
 * @author 辉
 * 座右铭:坚持总能遇见更好的自己!
 * @date 2019/9/21
 */
public class CrudResult {

    private boolean success; //user对象放回的标识

    private Object data;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public CrudResult() {
    }

    public CrudResult(boolean success, Object data) {
        this.success = success;
        this.data = data;
    }
}
