package com.hui.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hui.crud.pojo.Employee;
import com.hui.crud.commons.Msg;
import com.hui.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 辉
 * 座右铭:坚持总能遇见更好的自己!
 * @date 2019/9/19
 */
@Controller
public class EmployeeController {

    @RequestMapping("/toindex")
    public String toIndexPage() {
        return "index";
    }


    /*使用的是Serivce接口对象
     * 但是使用的是接口的实现类
     * */
    @Autowired
    private EmployeeService employeeServiceImpl;

    /**
     * 单个批量二合一
     * 批量删除：1-2-3
     * 单个删除：1
     *
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "emp/{ids}", method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("ids") String ids) {

        if (!ids.contains("-")) {
            int id = Integer.parseInt(ids);
            employeeServiceImpl.deleteEmpById(id);
        } else {
            List<Integer> list = new ArrayList<>();
            String[] split = ids.split("-");
            for (String id : split) {
                list.add(Integer.parseInt(id));
            }
            employeeServiceImpl.deleteEmp(list);
        }
        return Msg.success();
    }

    /**
     * 如果直接发送ajax=PUT形式的请求
     * 封装的数据
     * Employee
     * [empId=1014, empName=null, gender=null, email=null, dId=null]
     * <p>
     * 问题：
     * 请求体中有数据；
     * 但是Employee对象封装不上；
     * update tbl_emp  where emp_id = 1014;
     * <p>
     * 原因：
     * Tomcat：
     * 1、将请求体中的数据，封装一个map。
     * 2、request.getParameter("empName")就会从这个map中取值。
     * 3、SpringMVC封装POJO对象的时候。
     * 会把POJO中每个属性的值，request.getParamter("email");
     * AJAX发送PUT请求引发的血案：
     * PUT请求，请求体中的数据，request.getParameter("empName")拿不到
     * Tomcat一看是PUT不会封装请求体中的数据为map，只有POST形式的请求才封装请求体为map
     * org.apache.catalina.connector.Request--parseParameters() (3111);
     * <p>
     * protected String parseBodyMethods = "POST";
     * if( !getConnector().isParseBodyMethod(getMethod()) ) {
     * success = true;
     * return;
     * }
     * <p>
     * <p>
     * 解决方案；
     * 我们要能支持直接发送PUT之类的请求还要封装请求体中的数据
     * 1、配置上HttpPutFormContentFilter；
     * 2、他的作用；将请求体中的数据解析包装成一个map。
     * 3、request被重新包装，request.getParameter()被重写，就会从自己封装的map中取数据
     * 员工更新方法
     *
     * @param employee
     * @return
     */
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg saveEmp(Employee employee) {
        employeeServiceImpl.updateEmp(employee);
        return Msg.success();
    }

    /**
     * @param id 地址栏中传递的参数
     * @return
     * @PathVariable("id")表示result风格中传递的参数
     */
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id) {
        Employee employee = employeeServiceImpl.getEmp(id);
        return Msg.success().add("emp", employee);
    }

    /**
     * @return
     */
    @RequestMapping("/checkuser")
    @ResponseBody
    public Msg checkuser(@RequestParam(value = "empName") String empName) {
        //先判断用户名是不是合法的正则表达规则
        String str = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        boolean matches = empName.matches(str);
        //先用正则表达式先验证,通过,进行数据库的验证姓名是否重复,
        // 不通过直接将数据放回给前端
        if (!matches) {
            return Msg.fail().add("va_msg", "用户名是6-16位数字或者字母或3到6位中文");
        }
        boolean b = employeeServiceImpl.checkUser(empName);
        if (b) {
            //添加成功
            return Msg.success();
        } else {
            //姓名重复将信息返回给前端
            return Msg.fail().add("va_msg", "用户名不可用");
        }
    }

    /**
     * 使用了后端校验JSR303
     * 保存员工的方法  @Valid表示使用后端数据库校验功能
     * @param employee BindingResult表示返回后端校验数据的封装
     * @return
     */
    /*@RequestMapping(value = "emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg save(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else {
                employeeServiceImpl.save(employee);
                return Msg.success();
        }

    }*/


    /**
     * 员工保存
     * 1、支持JSR303校验
     * 2、导入Hibernate-Validator
     *
     * @return
     */
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名：" + fieldError.getField());
                System.out.println("错误信息：" + fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        } else {
            employeeServiceImpl.save(employee);
            return Msg.success();
        }

    }

    /**
     * @param pn 第几页数
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmps(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        /*先使用分页插件设置分页的页码,还有页面的大小*/
        PageHelper.startPage(pn, 5);
        List<Employee> all = employeeServiceImpl.getAll();
        /*将得到的数据封装在分页对象中*/
        PageInfo pageInfo = new PageInfo(all, 5);
        /*将数据封装在Msg对象中*/
        return Msg.success().add("pageInfo", pageInfo);
    }


    /**
     * 查询员工数据（分页查询）
     *
     * @return
     */
    //@RequestMapping("/emps")
    public String getEmps(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            Model model) {
        // 这不是一个分页查询；
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn, 5);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Employee> emps = employeeServiceImpl.getAll();
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page = new PageInfo(emps, 5);
        model.addAttribute("pageInfo", page);
        return "list";
    }

    @ResponseBody
    @RequestMapping("/testMvc")/*RequestParam默认值*/
    public Object getEmp111(@RequestParam(value = "pn", defaultValue = "1033") Integer id) {
        Employee emp = employeeServiceImpl.getAEmp(id);
        return emp;
    }

    /**
     * 测试Msg传递的数据格式
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/testMsg")
    public Msg getMsg() {
        return Msg.success().add("hui", "大蟒蛇喝咖啡");
    }

}