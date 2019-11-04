package com.hui.crud.pojo;

public class Department {
    private Integer deptId;

    private String deptName;

    private String gender;

    private String email;

    public Department() {
    }

    public Department(Integer deptId, String deptName, String gender, String email) {
        this.deptId = deptId;
        this.deptName = deptName;
        this.gender = gender;
        this.email = email;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
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
}