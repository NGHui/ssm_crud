package com.hui.crud.service.impl;

import com.hui.crud.dao.UserMapper;
import com.hui.crud.pojo.User;
import com.hui.crud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 辉
 * 座右铭:坚持总能遇见更好的自己!
 * @date 2019/9/26
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public int login(User user) {

        return userMapper.login(user);
    }

    //注册方法
    @Override
    public void reg(User user) {
        userMapper.reg(user);
    }
}
