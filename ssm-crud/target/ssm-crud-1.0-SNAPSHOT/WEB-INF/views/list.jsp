<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>
    <%--引入bootstrap样式--%>
    <!-- web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
    http://localhost:3306/crud
    -->
    <link href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <%--引入js样式--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

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
            <button class="btn btn-primary glyphicon glyphicon-pencil">添加</button>
            <button class="btn btn-danger glyphicon glyphicon-trash">删除</button>
        </div>
    </div>
    <!-- 表格中的数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="list">
                    <tr>
                        <td>${list.empId}</td>
                        <td>${list.empName}</td>
                        <td>${list.gender}</td>
                        <td>${list.email}</td>
                        <td>${list.department.deptName}</td>
                        <td>
                            <button class="btn btn-primary btn-sm glyphicon glyphicon-pencil ">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"/>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm glyphicon glyphicon-trash ">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
    <!-- 分页信息 -->
    <div class="row">
        <!-- 分页文字信息 -->
        <div class="col-md-6">
            <h4 class="text-center">当前${pageInfo.pageNum}页,共有${pageInfo.pages}页,一共有${pageInfo.total}条数据</h4>
        </div>
        <!-- 分页条信息 -->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <%--首页--%>
                    <li>
                        <a href="${pageContext.request.contextPath}/emps?pn=1">首页</a>
                    </li>
                    <%--上一页--%>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pageNum-1}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <%--var表示迭代变量--%>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="nav">
                        <c:if test="${pageInfo.pageNum==nav}">
                            <li class="active"><a href="#">${nav}</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum!=nav}">
                            <li><a href="${pageContext.request.contextPath}/emps?pn=${nav}">${nav}</a></li>
                        </c:if>
                    </c:forEach>

                    <%--下一页--%>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pageNum+1}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <%--末页--%>
                    <li>
                        <a href="${pageContext.request.contextPath}/emps?pn=${pageInfo.pages}">尾页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="row"></div>
    <div class="row"></div>
</div>

</body>
</html>
