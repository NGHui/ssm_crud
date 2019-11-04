package com.hui.crud.service;

import com.hui.crud.pojo.Department;

import java.util.List;

/**
 * @author 辉
 * 座右铭:坚持总能遇见更好的自己!
 * @date 2019/9/22
 */
public interface DepartmentService {
    /**
     * @return 获取部门所有的信息
     */
    List<Department> getDepts();
}
