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
                            <form method="post" class="form-validate">
                                <div class="form-group">
                                    <input id="login-username" type="text" name="loginUsername" value="聂广辉" required
                                           data-msg="Please enter your username" class="input-material">
                                    <label for="login-username" class="label-material">用户名</label>
                                </div>
                                <div class="form-group">
                                    <input id="login-password" type="password" name="loginPassword" required
                                           data-msg="Please enter your password" class="input-material">
                                    <label for="login-password" class="label-material">密码</label>
                                </div>
                                <a id="login" onclick="doLogin()" class="btn btn-primary">Login</a>
                                <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                            </form>
                            <a class="forgot-pass">忘记密码</a><br>
                            <small>注册</small>
                            <a href="#" onclick="reg()" class="signup">Signup</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyrights text-center">
        <p>Design by <a href="#" class="external">Bootstrapious</a>
            <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
        </p>
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


<script type="text/javascript">
    $(function () {
        //doLogin();
    });

    function doLogin() {
        var username = $("#login-username").val();
        if (username == "") {
            //alert("用户登录账号不能为空，请输入");
            layer.msg("用户登录账号不能为空，请输入", {time: 2000, icon: 5, shift: 6}, function () {

            });
            return;
        }
        var password = $("#login-password").val();
        if (password == "") {
            layer.msg("用户的密码不能为空,请输入", {time: 2000, icon: 3, shift: 6}, function () {

            });
            return;
        }
        var loadingIndex = null;
        //提交表单
        $.ajax({
            url: "${pageContext.request.contextPath}/doLogin",
            type: "post",
            data: {"username": username, "password": password},
            beforeSend: function () {
                loadingIndex = layer.msg('处理中', {icon: 16});
            },
            success: function (result) {
                layer.close(loadingIndex);
                //console.log(result)
                if (result.code == 100) {
                    window.location.href = "toindex";
                    //toIndex();
                } else {
                    layer.msg("用户登录账号或密码不正确，请重新输入", {time: 2000, icon: 3, shift: 6}, function () {

                    });
                }
            }
        });
    }

    /**
     * 注册页面跳转
     */
    function reg() {
        window.location.href = "toregister";
    }


</script>
</body>
</html>