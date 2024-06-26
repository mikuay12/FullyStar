<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>欢迎注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta charset="utf-8">
    <link rel="stylesheet" href="./css/bootstrap.css">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            width: 500px;
            margin: auto;
            margin-top: 50px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #0085ff;
        }

        .form-group {
            margin-bottom: 20px;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #6c757d;
        }

        #pwd1Span{
            color: red;
        }

        #pwd2Span{
            color: red;
        }

        .error-message{
            color: red;
        }

        #BirthSpan{
            color: red;
        }

    </style>
</head>

<body>
<div class="container">
    <h1 class="mb-4">欢迎注册</h1>
    <form id="RegisterForm" action="Register" method="post">
        <div class="form-group">
            <label for="username">账号:</label>
            <input type="text" class="form-control" id="username" name="Username">
        </div>
        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" class="form-control" id="password" name="Password" onblur="isPwd()">
            <span id="pwd1Span" class="text-center"></span>
        </div>
        <div class="form-group">
            <label for="confirmPassword">确认密码:</label>
            <input type="password" class="form-control" id="confirmPassword" name="ConfirmPassword" onblur="isCom()">
            <span id="pwd2Span" class="text-center"></span>
        </div>
        <div class="form-group">
            <label for="user_name">姓名:</label>
            <input type="text" class="form-control" id="user_name" name="user_name">
        </div>
        <div class="form-group">
            <label for="user_age">年龄:</label>
            <input type="text" class="form-control" id="user_age" name="user_age">
        </div>
        <div class="form-group">
            <label style="margin-right: 15px">性别:</label>
            <!--            <input type="text" class="form-control" id="user_sex" name="user_sex">-->
            <label for="sex_male">男</label>
            <input type="radio" class="form-inline radio-inline" id="sex_male" name="user_sex" checked value="男" style="margin-right: 15px">
            <label for="sex_female">女</label>
            <input type="radio" class="form-inline radio-inline" id="sex_female" name="user_sex" value="女">
        </div>
        <div class="form-group">
            <label for="user_phone">手机号:</label>
            <input type="text" class="form-control" id="user_phone" name="user_phone">
        </div>
        <div class="form-group">
            <label for="user_birth">生日:</label>
            <input type="text" class="form-control" id="user_birth" name="user_birth" onblur="isDate()">
            <span id="BirthSpan" class="text-center"></span>

        </div>
        <button type="button" class="btn btn-success btn-block" onclick="validateForm()">注册</button>
        <div class="error-message text-center" id="error-message"></div>

    </form>
    <a href="Login.jsp">已有账号？点我登录</a>
</div>

</body>
<script type="text/javascript" src="./js/jquery-3.7.1.js"></script>
<!-- 引入Bootstrap的JavaScript -->
<script type="text/javascript" src="./js/bootstrap.js"></script>
<script>


    function validateForm() {
        var username = $("#username").val();
        var password = $("#password").val();
        var pwd = $("#confirmPassword").val();
        var name = $("#user_name").val();
        var age = $("#user_age").val();
        // var sex = $("#user_sex").val();
        var phone = $("#user_phone").val();
        var birth = $("#user_birth").val();

        var errorMessage = $("#error-message");

        if (username==="" || password==="" || pwd==="" || name===""||age===""||phone===""||birth==="") {
            // 显示错误消息
            errorMessage.html("还有未填写的项目!");
            return false;
        } else {
            // 隐藏错误消息
            errorMessage.html("");
            // 提交表单
            if(isPwd()) {
                if(isCom()){
                    if(isDate()){
                        $("#RegisterForm").submit();
                    }
                }
            }
        }
    }

    //密码校验
    function isPwd(){
        var text= $("#password").val();
        var re =/^(?=.*[a-z])(?=.*\d)[^]{8,16}$/;
        var result =  re.test(text);
        if(!result) {
            $("#pwd1Span").html("密码必须包含数字,字母,且不少于8位");
            return false;
        }else {
            $("#pwd1Span").html("");
            return true;
        }
    };

    // 生日校验
    function isDate(){
        var text = $("#user_birth").val();
        var dateReg = /(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)/;
        var result = dateReg.test(text);
        if(!result){
            $("#BirthSpan").html("该日期格式应为YYYY-MM-DD");
            return false;
        }
        else {
            $("#BirthSpan").html("");
            return true;
        }
    }


    //确认密码
    function isCom(){
        var text1= $("#confirmPassword").val();
        var text2= $("#password").val();
        if (text2 == text1){
            $("#pwd2Span").html("");
            return true;
        }else {
            $("#pwd2Span").html("两次输入的密码不一致");
            return false;
        }
    }

</script>
</html>