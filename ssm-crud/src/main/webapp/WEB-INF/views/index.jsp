<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>

    <%--引入js样式--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <!-- web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
    http://localhost:3306/crud
    -->
    <%--引入bootstrap样式--%>
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <%--引入Layui页面--%>
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/layer/theme/default/layer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/layer/mobile/need/layer.css" rel="stylesheet">


</head>
<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">聂广辉 后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${loginUser.username}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>
</div>
<!-- 添加员工的模态框 -->
<div class="modal fade" id="updateEmpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="my1ModalLabel">添加员工</h4>
            </div>
            <div class="modal-body ">
                <form class="form-horizontal">
                    <div class="form-group ">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <%-- <input name="empName" type="text" class="form-control" id="empName_update_input" placeholder="empName">
                             <span class="help-block"></span>--%>
                            <p class="form-control-static" id="empName_update_input"></p>
                        </div>
                    </div>
                    <div class="form-group ">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input name="email" type="text" class="form-control" id="email_update_input"
                                   placeholder="email@hui.com">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input name="gender" type="radio" name="inlineRadioOptions" id="gender1_update_input"
                                       value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input name="gender" type="radio" name="inlineRadioOptions" id="gender2_update_input"
                                       value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group ">
                        <label name="deptName" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-10">
                            <%--部门提交id--%>
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<!-- 添加员工的模态框 -->
<div class="modal fade" id="addEmpModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body ">
                <form class="form-horizontal">
                    <div class="form-group ">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input name="empName" type="text" class="form-control" id="empName_add_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group ">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input name="email" type="text" class="form-control" id="email_add_input"
                                   placeholder="email@hui.com">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input name="gender" type="radio" name="inlineRadioOptions" id="gender1_add_input"
                                       value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input name="gender" type="radio" name="inlineRadioOptions" id="gender2_add_input"
                                       value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group ">
                        <label name="deptName" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-10">
                            <%--部门提交id--%>
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="container ">
    <!-- 第一个div用作标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1 class="text-center">SSM-CRUD</h1>
        </div>
    </div>
    <!-- 第二个div用于按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary glyphicon glyphicon-pencil" id="add_emp">添加</button>
            <button class="btn btn-danger glyphicon glyphicon-trash" id="delete_emp_all_btn">删除</button>
        </div>
    </div>
    <!-- 表格中的数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="empList">

                </tbody>
            </table>
        </div>
    </div>
    <!-- 分页信息 -->
    <div class="row">
        <!-- 分页文字信息 -->
        <div class="col-md-6">
            <h4 class="text-center" id="pageData"></h4>
        </div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="pageDataNav">

        </div>
    </div>
</div>


<script type="text/javascript">
    //全局判断变量,判断前端校验empName是否存在
    var custoTag;
    //用于美化界面
    var loadingIndex = null;
    //声明一个全局变量用于保存总页数,当前页面
    var totalRecord, thisPage, thisEmpName, thisEmpId;
    /*$(function () {});
    页面加载完成后发送ajax请求
    页面加载完成DOM对象以后,执行的回调函数,并且该函数只会执行一次
    */
    $(function () {
        toPage(1);
    });

    //将方法抽取出来
    function toPage(pn) {
        $.ajax({
            url: "${pageContext.request.contextPath}/emps",
            data: "pn=" + pn,
            type: "get",
            success: function (result) {
                //console.log(result)
                //解析并显示员工信息
                getTableData(result);
                //解析并显示分页的信息
                /*解析分页的数据*/
                getPageInfo(result);
                //解析并且显示分页条的信息
                getPageNav(result);
            }
        });

    }

    /*解析分页的数据*/
    function getPageInfo(result) {
        $("#pageData").empty();
        $("#pageData")
            .append("当前第" + result.extend.pageInfo.pageNum +
                ",总共" + result.extend.pageInfo.pages + ",一共" +
                result.extend.pageInfo.total);
        totalRecord = result.extend.pageInfo.total;
        thisPage = result.extend.pageInfo.pageNum;
    }

    /*解析分页条的数据*/
    function getPageNav(result) {
        //清空分页数据的信息
        $("#pageDataNav").empty();
        /*构建ul*/
        var ul = $("<ul><ul>").addClass("pagination");
        //append方法的返回值是当前元素,attr是设置属性的,attr("key","vaule"
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("herf", "#"));
        var prepageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("herf", "#"));
        //添加禁止点的标志,被禁用了就不需要绑定事件,没有被警用就绑定事件
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("previous disabled");
            prepageLi.addClass("previous disabled");
        } else {
            //首页
            firstPageLi.click(function () {
                toPage(1);
            })
            //上一页
            prepageLi.click(function () {
                toPage(result.extend.pageInfo.pageNum - 1);
            })
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("herf", "#"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("herf", "#"));

        //添加禁止点的标志,被禁用了就不需要绑定事件,没有被警用就绑定事件
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("previous disabled");
            lastPageLi.addClass("previous disabled");
        } else {
            //下一页
            nextPageLi.click(function () {
                toPage(result.extend.pageInfo.pageNum + 1);
            })
            //尾页
            lastPageLi.click(function () {
                toPage(result.extend.pageInfo.pages);
            })
        }
        /*将上一页,下一页,首页,末页,连续显示页码放在ul中*/
        ul.append(firstPageLi).append(prepageLi);
        /*构建分页连续显示的页码 1,2,3,4*/
        $.each(result.extend.pageInfo.navigatepageNums, function (index, navData) {

            var navNum = $("<li></li>").append($("<a></a>").append(navData));
            if (result.extend.pageInfo.pageNum == navData) {
                navNum.addClass("active")
            }
            //将遍历出来的li放入nav中
            ul.append(navNum);
            navNum.click(function () {
                toPage(navData)
            })
        });
        ul.append(nextPageLi).append(lastPageLi);
        //将ul添加到nav中
        var navEle = $("<nav></nav>").append(ul);
        //将nav添加到div分页导航条中
        navEle.appendTo("#pageDataNav");

    }

    /*解析显示表格数据*/
    function getTableData(result) {
        //先将表格数据中的原素清空
        $("#emps_table tbody").empty();
        /*得到json数据中封装的对象*/
        var data = result.extend.pageInfo.list;
        //遍历封装的数据
        $.each(data, function (index, emps) {
            //alert(emps.empName);
            /*[{"empId":1033,"empName":"5d42bc0","gender":"男","email":"5d42bc0@hui.com","dId":2,"department":{"deptId":2,"deptName":"设计部","gender":null,"email":null}}*/
            //创建Td
            var ckeckBoxTd = $("<td><input type='checkbox' class='check_item'/></td>")
            var empIdTd = $("<td></td>").append(emps.empId);
            var empNameTd = $("<td></td>").append(emps.empName);
            var genderTd = $("<td></td>").append(emps.gender);
            var emailTd = $("<td></td>").append(emps.email);
            var deptNameTd = $("<td></td>").append(emps.department.deptName);
            /*<button class="btn btn-primary btn-sm glyphicon glyphicon-pencil ">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"/>
                编辑
            </button>
            <button class="btn btn-danger btn-sm glyphicon glyphicon-trash ">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                删除
            </button>*/
            /*两个buttn按钮占用一个单元格*/
            //编辑按钮
            var editBtn = $("<button></button>").addClass("btn btn-info btn-sm glyphicon glyphicon-pencil").append($("<span></span>")).addClass("glyphicon glyphicon-pencil update_btn")/*.append("编辑");*/
            //添加一个自定义属性,用来存放id
            editBtn.attr("edit-id", emps.empId);
            //删除按钮
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm glyphicon glyphicon-trash").append($("<span></span>")).addClass("glyphicon glyphicon-trash delete_btn")/*.append("删除");*/
            //添加一个自定义属性,用来存放id,和empName
            delBtn.attr("del-id", emps.empId);
            delBtn.attr("del-empName", emps.empName);
            thisEmpId = emps.empName;
            thisEmpId = emps.empId;
            //将两个按钮放在一个td里面
            var Btn = $("<td></td>").append(editBtn).append(delBtn);
            /*创建tr将td放入tr中,在将tr放入tbody中*/
            $("<tr></tr>")
                .append(ckeckBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(Btn)
                //表示将tr添加到tbody中
                .appendTo("#emps_table tbody")
        });
    }

    function reset_form(ele) {
        //清除DOM元素中的数据
        $(ele)[0].reset();
        //清空表单样式,是指添加表单的样式,find("*")表示找到所有,
        // 有has-error has-success样式就清空
        $(ele).find("*").removeClass("has-error has-success");
        //样式选择器,span元素中的文本信息
        $(ele).find(".help-block").text("");
        //清空元素
        //$(ele).empty();

    }

    //点击新增按钮弹出模态框。
    $("#add_emp").click(function () {
        //注意也可以在调用获取下拉列表值的时候清空列表,每次调用下拉列表的方法时清空下拉列表的值
        //在弹出模态框时清除模态框中下拉列表中的数据
        //$("#addEmpModel select").empty();
        //调用清空表单样式的方法
        reset_form("#addEmpModel form");
        //代替了下面的$("#addEmpModel select").empty();和$("#addEmpModel form")[0].reset();
        //在弹出模态框时清除模态框中empName中的数据
        //DOM对象
        //$("#addEmpModel form")[0].reset();
        //在弹出模态框之前获取department部门所有的信息
        getDepts("#addEmpModel select");
        $("#addEmpModel").modal({
            backdrop: "static",
        });

    });

    //获取模态框下拉列表的数据
    function getDepts(ele) {
        //调用之前,清空下拉列表的值
        $(ele).empty();
        $.ajax({
            url: "${pageContext.request.contextPath}/getDepts",
            type: "get",
            success: function (result) {
                //console.log(result);
                //显示部门将部们的信息添加到模态框的下拉列表中
                //先遍历出部门数据,再将数据放入下拉列表中
                $.each(result.extend.list, function () {
                    //this正在遍历的对象
                    var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                })
            }
        })

    }

    //校验前端数据
    function validate_add_form() {
        //   在验证数据之前,需要将输入框中的样式删除

        //   验证姓名
        var empName = $("#empName_add_input").val();
        var validate_name = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        //如果名字的内容输入不正确,return false
        if (!validate_name.test(empName)) {
            //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
            //将框的颜色变成红色
            //$("#empName_add_input").parent().addClass("has-error");
            //$("#empName_add_input").next().text("用户名可以是2-5位中文或者6-16位英文和数字的组合");
            //调用封装的方法
            show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
            return false;
        } else {
            //$("#empName_add_input").parent().addClass("has-success");
            //$("#empName_add_input").next().text("");
            show_validate_msg("#empName_add_input", "success", "");
        }

        //验证邮箱
        var email = $("#email_add_input").val();
        var validate_email = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!validate_email.test(email)) {
            //alert("邮箱不合法");
            //$("#email_add_input").parent().addClass("has-error");
            //$("#email_add_input").next().text("邮箱不合法");
            //调用封装的方法
            show_validate_msg("#email_add_input", "error", "邮箱不合法")
            return false;
        } else {
            //邮箱输入正确
            //$("#email_add_input").parent().addClass("has-success");
            //$("#email_add_input").next().text("");
            show_validate_msg("#email_add_input", "success", "");
        }
        //邮箱和姓名合法,就return true
        return true;
    }

    //将数据验证的方法抽取出来
    function show_validate_msg(ele, status, msg) {
        //调用这个方法之前应该清空样式
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");

        if ("success" == status) {
            //向父类标签添加样式
            $(ele).parent().addClass("has-success");
            //向选中的原素的下一个原素中添加文本信息
            $(ele).next().text(msg);
        } else if ("error") {
            //向父类标签添加样式
            $(ele).parent().addClass("has-error");
            //向选中的原素的下一个原素中添加文本信息
            $(ele).next().text(msg);
        }


    }

    //校验用户名是否可用
    $("#empName_add_input").change(function () {
        //发送ajax请求校验用户名是否可用
        var empName = this.value;
        $.ajax({
            url: "${APP_PATH}/checkuser",
            data: "empName=" + empName,
            type: "POST",
            success: function (result) {
                if (result.code == 100) {
                    show_validate_msg("#empName_add_input", "success", "用户名可用");
                    //方法一,添加一个自定义的属性,给属性设置自定义的值
                    //$("#emp_save_btn").attr("ajax-va","success");
                    //方法二配置全局变量
                    custoTag = true;
                } else {
                    show_validate_msg("#empName_add_input", "error", result.extend.va_msg);
                    //方法一,添加一个自定义的属性,给属性设置自定义的值
                    //$("#emp_save_btn").attr("ajax-va","error");
                    //方法二配置全局变量
                    custoTag = false;
                }
            }
        });
    });
    //点击保存按钮,发送请求,将数据保存
    $("#emp_save_btn").click(function () {
        /*
        * 注意方法一但return就不会执行下面的代码
        * */
        //1.先校验添加的数据是否合法
        if (!validate_add_form()) {
            return false;
        }
        if (custoTag == false) {
            return false;

        }

        //2.在进行ajax请求添加数据
        //console.log($("#addEmpModel form").serialize());
        $.ajax({
            url: "${pageContext.request.contextPath}/emp",
            type: "POST",
            data: $("#addEmpModel form").serialize(),
            beforeSend: function () {
                loadingIndex = layer.msg('处理中', {icon: 16});
            },
            success: function (result) {

                //1.提示保存成功
                //2.关闭模态框
                //$("#addEmpModel").modal("hide");
                //3.来到页面的最后一页,显示自己添加的数据
                //如果页面跳转到的页数大于最后一页,默认跳转到最后一页
                //toPage(totalRecord);
                //alert(result.msg);
                if (result.code == 100) {
                    layer.close(loadingIndex);
                    //员工保存成功；
                    //1、关闭模态框
                    $("#addEmpModel").modal("hide");
                    //2、来到最后一页，显示刚才保存的数据
                    //发送ajax请求显示最后一页数据即可
                    toPage(totalRecord);
                } else {
                    //显示失败信息
                    //console.log(result);
                    //有哪个字段的错误信息就显示哪个字段的；
                    if (undefined != result.extend.errorFields.email) {
                        //显示邮箱错误信息
                        show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);
                    }
                    if (undefined != result.extend.errorFields.empName) {
                        //显示员工名字的错误信息
                        show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName);
                    }
                }
            }
        });

    });

    //为Jquery创建的元素绑定事件
    //1.我们是在按钮之前就绑定了click,所以绑定不上
    //2.我们可以在绑定按钮的时候创建点击事件,绑定.live()方法
    //Jquery新版本没有Live,使用了on方法进行了替代
    //$(document)表示选择了整个文档
    /**
     * 为编辑按钮绑定click事件
     */
    $(document).on("click", ".update_btn", function () {
        //1.弹出模态框之前,获取下拉列表的值
        getDepts("#updateEmpModel select");
        //2.查询员工信息,并且显示在模态框中
        getEmp($(this).attr("edit-id"));
        //3.将查询的员工id传递给编辑按钮
        $("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
        //弹出模态框
        $('#updateEmpModel').modal({
            backdrop: 'static',
            keyboard: true,
        });
    });

    /**
     * 通过id获取员工信息,回显员工信息
     */
    function getEmp(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/emp/" + id,
            type: "GET",
            success: function (result) {
                console.log(result);
                //将数据填充到响应的表单中
                var empData = result.extend.emp;
                //将数据回显到empName栏
                $("#empName_update_input").text(empData.empName);
                //将数据回显到email栏
                $("#email_update_input").val(empData.email);
                //将数据回显到gender栏
                $("#updateEmpModel input[name=gender]").val([empData.gender]);
                //将数据回显到deptName栏
                $("#updateEmpModel select").val([empData.dId]);

            }
        })

    }

    //点击模态框中的更新,更新数据
    $("#emp_update_btn").click(function () {
        //1.验证邮箱是否正确
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validate_msg("#email_update_input", "success", "");
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/emp/" + $(this).attr("edit-id"),
            type: "PUT",
            data: $("#updateEmpModel form").serialize(),
            success: function (reulst) {
                //console.log(reulst);
                //关闭模态框
                $("#updateEmpModel").modal("hide");
                //回到修改的页面
                toPage(thisPage);
            }
        });
    });
    //删除单个员工
    $(document).on("click", ".delete_btn", function () {
        //点击删除时,提出弹出框
        var empId = $(this).attr("del-id");
        layer.confirm('你是否要删除' + $(this).attr("del-empname") + "?", {
            btn: ['是', '否'] //按钮
        }, function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/emp/" + empId,
                type: "DELETE",
                success: function (result) {
                    //console.log(result.msg);
                    layer.msg('删除成功', {icon: 1});
                    //回到当前页
                    toPage(thisPage);
                }
            });
        }, function () {
            // layer.msg('谢谢你的手下留情', {
            //     time: 20000, //20s后自动关闭
            //     btn: ['明白了', '知道了']
            // });
            return;
        });

    });

    //完成全选/全不选的功能
    $("#check_all").click(function () {
        //checked属性是用来判断属性是否被选中
        //var flag = $(this).prop("checked");
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    //所有的单选框被选中,多选框也将被选中
    $(document).on("click", ".check_item", function () {
        //获取单选框的个数 checked是被选中的意思
        var flag = $(".check_item:checked").length == $(".check_item").length;
        //获取所有单选框的个数
        //$(".check_item").length
        //判断是否全选满
        $("#check_all").prop("checked", flag);

    });

    //删除所有delete_emp_all_btn
    $("#delete_emp_all_btn").click(function () {
        //用于保存员工的名字
        var empNames = "";
        var empIds = "";
        $.each($(".check_item:checked"), function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            empIds += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //去除empNames多余的逗号,也可以在后端传递过去的数据去除
        empNames = empNames.substring(0, empNames.length - 1);
        //去除删除的id多余的-
        empIds = empIds.substring(0, empIds.length - 1);
        layer.confirm('你是否要删除' + empNames + "吗?", {
            btn: ['确认', '取消'] //按钮
        }, function () {
            //layer.msg('的确很重要', {icon: 1});
            $.ajax({
                url: "${pageContext.request.contextPath}/emp/" + empIds,
                type: "DELETE",
                success: function (result) {
                    layer.msg('删除成功', {icon: 1});
                    toPage(thisPage);
                }
            });
        }, function () {
            layer.msg('谢谢手下留情', {
                time: 2000, //1s后自动关闭
            });
        });
    })


</script>

</body>

</html>
