package com.hui.crud.service.impl;

import java.util.List;

import com.hui.crud.dao.DepartmentMapper;
import com.hui.crud.pojo.Department;
import com.hui.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts() {
        // TODO Auto-generated method stub
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }

}
