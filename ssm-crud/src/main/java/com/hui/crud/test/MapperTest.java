package com.hui.crud.test;

import com.hui.crud.dao.DepartmentMapper;
import com.hui.crud.dao.EmployeeMapper;
import com.hui.crud.pojo.Department;
import com.hui.crud.pojo.Employee;
import com.hui.crud.utils.TestData;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

/**
 * @author 辉
 * 座右铭:坚持总能遇见更好的自己!
 * @date 2019/9/19
 */

/**
 * 测试dao层的工作
 *
 * @author lfy
 * 推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 * 1、导入SpringTest模块
 * 2、@ContextConfiguration指定Spring配置文件的位置
 * 3、直接autowired要使用的组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:Spring/applicationContext.xml"}) //加载配置文件

public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private SqlSession sqlSession;

    @Test
    public void test() {

        /*System.out.println(departmentMapper);

        Department department = new Department();
        department.setDeptName("科研部");
        departmentMapper.insertSelective(department);*/
        /*向数据库中插入1000条数据*/
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        String substring = UUID.randomUUID().toString().substring(0, 6);
        System.out.println(substring);

        for (int i = 0; i < 10; i++) {
            String s = UUID.randomUUID().toString().substring(0, 6) + i;
            //departmentMapper.insertSelective(new Department(null,testData.getName(),testData.getSex(),testData.getName()+"@hui.com"));
            employeeMapper.insertSelective(new Employee(null, s, TestData.getSex(), s + "@hui.com", 5));

        }


    }
}
