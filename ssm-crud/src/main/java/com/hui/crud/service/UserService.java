package com.hui.crud.service;

import com.hui.crud.pojo.User;

/**
 * @author 辉
 * 座右铭:坚持总能遇见更好的自己!
 * @date 2019/9/26
 */
public interface UserService {

    //登陆方法
    int login(User user);

    //注册方法
    void reg(User user);

    //修改方法

}
