<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>欢迎登录</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            background-image: url("BookImage/book3.jpg");
        }
        .login-card {
            width: 460px;
            height: 540px;
            margin: auto;
            margin-top: 100px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            border-radius: 20px;

        }
        .login-btn {
            background-color: #28a745;
            color: #fff;
            margin-top: 10px;
        }
        .error-message {
            color: #dc3545;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card login-card">
        <h1 class="text-center" style="margin-bottom: 50px">欢迎登录</h1>
        <form id="loginForm" action="Login" method="post" class="form-horizontal">
            <div class="form-group">
                <label for="username" class="col-md-2 control-label">账号:</label>
                <div class="col-md-10">
                    <input type="text" class="form-control" id="username" name="Username" placeholder="请输入账号">
                </div>
            </div>


            <div class="form-group">
                <label for="password" class="col-md-2 control-label">密码:</label>
                <div class="col-md-10">
                    <input type="password" class="form-control" id="password" name="Password" placeholder="请输入密码">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-md-10">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="remain">7天免密登录
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12 text-center">
                    <button type="button" class="btn btn-primary login-btn" onclick="validateLoginForm()">登录</button>
                    <div class="error-message" id="error-message"></div>

                </div>
            </div>
        </form>


        <div class="text-center" style="margin-top: 50px;">
            <a href="ForgetPassword.jsp" class="d-block">忘记密码</a>
        </div>
        <div class="text-center">
            <a href="Register.jsp" class="d-block">没有账号？点我注册</a>
        </div>




    </div>

</div>

<!-- 引入jQuery -->
<script type="text/javascript" src="./js/jquery-3.7.1.js"></script>
<!-- 引入Bootstrap的JavaScript -->
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script>
    function validateLoginForm() {
        var username = $("#username").val();
        var password = $("#password").val();
        var errorMessage = $("#error-message");

        if (username === "" || password === "") {
            // 显示错误消息
            errorMessage.text("请输入账号和密码");
            // 将输入框边缘变红
            $("#username, #password").css("border-color", "#dc3545");
        } else {
            // 隐藏错误消息
            errorMessage.text("");
            // 恢复输入框边缘颜色
            $("#username, #password").css("border-color", "");
            // 提交表单
            $("#loginForm").submit();
        }
    }
</script>
</body>
</html>


