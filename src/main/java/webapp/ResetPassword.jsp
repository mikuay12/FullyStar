<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>重置密码</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            background-image: url("BookImage/book3.jpg");
        }
        .card {
            width: 460px;
            height: 540px;
            margin: auto;
            margin-top: 100px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            border-radius: 20px;

        }
        .submit-btn {
            background-color: #28a745;
            color: #fff;
            margin-top: 10px;
        }
        .error-message {
            color: #dc3545;
            font-size: 14px;
            margin-top: 10px;
        }

        #pwd1Span{

            color: red;
        }

        #pwd2Span{
            color: red;
        }


    </style>
</head>
<body>
<div class="container">
    <div class="card card">
        <h1 class="text-center" style="margin-bottom: 50px">重置密码</h1>

        <form id="Form" action="ResetPassword" method="post" class="form-horizontal">

            <div class="form-group">
                <label for="oldpassword" class="col-md-3 control-label">旧密码:</label>
                <div class="col-md-9">
                    <input type="text" class="form-control" id="oldpassword" name="old_password" placeholder="请输入旧密码">
                </div>
            </div>

            <div class="form-group">
                <label for="newpassword" class="col-md-3 control-label">新密码:</label>
                <div class="col-md-9">
                    <input type="password" class="form-control" id="newpassword" name="new_password" onblur="isPwd()"  placeholder="请输入新密码">
                    <span id="pwd1Span" class="text-center"></span>
                </div>
            </div>


            <div class="form-group">
                <label for="password" class="col-md-3 control-label">确认密码:</label>
                <div class="col-md-9">
                    <input type="password" class="form-control" id="password" onblur="isCom()" placeholder="请确认密码">
                    <span id="pwd2Span" class="text-center"></span>
                </div>
            </div>


            <div class="form-group">
                <div class="col-md-12 text-center">
                    <button type="button" class="btn btn-primary submit-btn" onclick="validateForm()">重置密码</button>
                    <div class="error-message" id="error-message"></div>

                </div>
            </div>
        </form>


        <div class="text-center">
            <a href="Host.jsp" class="d-block">返回主页</a>
        </div>




    </div>

</div>

<!-- 引入jQuery -->
<script type="text/javascript" src="./js/jquery-3.7.1.js"></script>
<!-- 引入Bootstrap的JavaScript -->
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script>
    // 验证成功后再提交
    function validateForm() {
        var oldpwd = $("#oldpassword").val();
        var password = $("#password").val();
        var newpassword = $("#newpassword").val();
        var errorMessage = $("#error-message");

        if (oldpwd==="" || password==="" || newpassword==="") {
            // 显示错误消息
            errorMessage.text("还有未填写的项目!");
        } else {
            // 隐藏错误消息
            errorMessage.text("");
            if(isPwd()){
                if(isCom()){
                    // 提交表单
                    $("#Form").submit();
                }
            }
        }
    }

    //密码校验
    function isPwd(){
        var text= $("#newpassword").val();
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



    //确认密码
    function isCom(){
        var text1= $("#newpassword").val();
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
</body>
</html>


