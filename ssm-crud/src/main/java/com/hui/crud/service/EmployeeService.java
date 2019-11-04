package com.hui.crud.service;

import com.hui.crud.commons.Msg;
import com.hui.crud.pojo.Employee;

import java.util.List;

/**
 * @author 辉
 * 座右铭:坚持总能遇见更好的自己!
 * @date 2019/9/19
 */

public interface EmployeeService {

    /**
     * 获取所有员工
     *
     * @return
     */
    List<Employee> getAll();


    /**
     * 获取一个员工的方法,用于测试SSM框架,JSON数据
     *
     * @param id
     * @return
     */
    Employee getAEmp(Integer id);

    /**
     * 员工保存
     *
     * @param employee
     */
    void save(Employee employee);

    /**
     * 检查用户名是否可用
     *
     * @param empName
     * @return
     */
    boolean checkUser(String empName);

    /**
     * 通过id获取单个员工的信息
     *
     * @param id
     * @return
     */
    Employee getEmp(Integer id);

    /**
     * 修改员工后保存数据
     */
    void updateEmp(Employee employee);

    /**
     * 单个员工删除的按钮
     *
     * @param id
     */
    void deleteEmpById(Integer id);

    /**
     * 批量删除
     *
     * @param ids
     * @return
     */
    void deleteEmp(List<Integer> ids);

}
