package com.hui.crud.pojo;

import javax.validation.constraints.Pattern;

/**
 * @author 辉
 * 座右铭:坚持总能遇见更好的自己!
 * @date 2019/9/26
 */
public class User {

    private Integer id;
    private String username;
    private String password;
    private String email;
    private String creationtime;
    private String updatetime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreationtime() {
        return creationtime;
    }

    public void setCreationtime(String creationtime) {
        this.creationtime = creationtime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public User() {
    }

    public User(Integer id, String username, String password, String email, String creationtime, String updatetime) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.creationtime = creationtime;
        this.updatetime = updatetime;
    }


}
