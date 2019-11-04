<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="https://www.jq22.com/jquery/bootstrap-4.2.1.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://www.jq22.com/jquery/font-awesome.4.7.0.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/webproject/css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/webproject/css/style.default.css"
          id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/webproject/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/webproject/img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
<div class="page login-page">
    <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
            <div class="row">
                <!-- Logo & Information Panel-->
                <div class="col-lg-6">
                    <div class="info d-flex align-items-center">
                        <div class="content">
                            <div class="logo">
                                <h1>欢迎使用</h1>
                            </div>
                            <p>这个东西的制作人是聂广辉</p>
                        </div>
                    </div>
                </div>
                <!-- Form Panel    -->
                <div class="col-lg-6 bg-white">
                    <div class="form d-flex align-items-center">
                        <div class="content">
                            <form class="form-validate">
                                <div class="form-group">
                                    <input id="register-username" type="text" name="username" required
                                           data-msg="请输入您的用户名" class="input-material">
                                    <label for="register-username" class="label-material">用户名</label>
                                </div>
                                <div class="form-group">
                                    <input id="register-email" type="email" name="email" required
                                           data-msg="请输入一个有效的电子邮件地址" class="input-material">
                                    <label for="register-email" class="label-material">邮箱 </label>
                                </div>
                                <div class="form-group">
                                    <input id="register-password" type="password" name="password" required
                                           data-msg="请输入密码" class="input-material">
                                    <label for="register-password" class="label-material">密码 </label>
                                </div>
                               <%-- <div class="form-group terms-conditions">
                                    <input onclick="dianji()" id="register-agree"  type="checkbox"
                                            class="checkbox-template checkbox_item">
                                    <label for="register-agree">同意条款和政策</label>
                                </div>--%>
                                <div class="form-group">
                                    <button id="regidter" onclick="add_reg()" class="btn btn-primary">注册</button>
                                </div>
                            </form>
                            <small>已经有账户了?</small>
                            <a href="#" onclick="toLogin()" class="signup">登陆</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyrights text-center">
        <p>版权是@辉;2019.公司名称版权所有。更多的模板 <a href="http://www.jq22.com/" target="_blank" title="jq22">jq22</a></p>
    </div>
</div>
<!-- JavaScript files-->
<script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/static/webproject/vendor/popper.js/umd/popper.min.js"></script>
<script src="https://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
<script src="${pageContext.request.contextPath}/static/webproject/vendor/jquery.cookie/jquery.cookie.js"></script>
<script src="https://cdn.bootcss.com/Chart.js/2.7.0/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/static/webproject/vendor/jquery-validation/jquery.validate.min.js"></script>
<!-- Main File-->
<script src="${pageContext.request.contextPath}/static/webproject/js/front.js"></script>
<script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>

</body>
</html>