package com.hui.crud.controller;

import com.hui.crud.commons.Msg;
import com.hui.crud.pojo.Department;
import com.hui.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.List;

/**
 * @author 辉
 * 座右铭:坚持总能遇见更好的自己!
 * @date 2019/9/22
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentServiceImpl;

    @RequestMapping("/getDepts")
    @ResponseBody
    public Msg getDepts() {
        List<Department> list = departmentServiceImpl.getDepts();
        //将数据封装在Msg中
        return Msg.success().add("list", list);
    }
}
