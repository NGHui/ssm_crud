package com.hui.crud.controller;

import com.hui.crud.commons.Msg;
import com.hui.crud.pojo.User;
import com.hui.crud.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 辉
 * 座右铭:坚持总能遇见更好的自己!
 * @date 2019/9/26
 */
@Controller
public class UserController {
    @Autowired
    private UserService userServiceImpl;

    /**
     * 跳转到注册页面
     *
     * @return
     */
    @RequestMapping("/toregister")
    public String toRegister() {
        return "register";
    }

    /**
     * 跳转到登陆页面
     *
     * @return
     */
    @RequestMapping("/tologin")
    public String toLoginPage() {
        return "login";
    }

    /**
     * 登陆逻辑
     *
     * @param user
     * @param session
     * @return
     */
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    @ResponseBody
    public Msg login(User user, HttpSession session) {
        int i = userServiceImpl.login(user);
        if (i > 0) {
            //将登陆的用户放入session中
            session.setAttribute("loginUser", user);
            return Msg.success();
        } else {
            HashMap<String, Object> map = new HashMap<>();
            map.put("error", "用户名或密码错误");
            return Msg.fail().add("error", map);
        }

    }

    @RequestMapping(value = "/reg", method = RequestMethod.POST)
    @ResponseBody
    public Msg reg(User user) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        user.setCreationtime(simpleDateFormat.format(new Date()));
        user.setUpdatetime(simpleDateFormat.format(new Date()));
        userServiceImpl.reg(user);
        return Msg.success();
    }
}
