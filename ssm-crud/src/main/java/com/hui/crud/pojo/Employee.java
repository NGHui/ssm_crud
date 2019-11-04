package com.hui.crud.pojo;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer empId;

    //使用JSR303后端校验
    //Pattern表示使用自定义校验,正
    // 则表达式 regexp表示自定义的格式
    //message 表示自己添加的错误信息封装在JSR303对象中
    //Java中双斜杠表示斜杠
    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})"
            , message = "你输入的名字非法,必须是6到16位字母,3到6个中文字符")
    private String empName;

    private String gender;
    //使用JSR303后端校验
    //使用自定义校验,正则表达式 Pattern
    //Java中双斜杠表示斜杠
    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
            , message = "邮箱格式错误")
    private String email;

    private Integer dId;

    //希望查询员工的同时部门信息也是查询好的
    private Department department;

    public Employee(Integer empId, String empName, String gender, String email, Integer dId, Department department) {
        this.empId = empId;
        this.empName = empName;
        this.gender = gender;
        this.email = email;
        this.dId = dId;
        this.department = department;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Employee() {
    }

    public Employee(Integer empId, String empName, String gender, String email, Integer dId) {
        this.empId = empId;
        this.empName = empName;
        this.gender = gender;
        this.email = email;
        this.dId = dId;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}