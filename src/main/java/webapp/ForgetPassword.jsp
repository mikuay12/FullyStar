<%--
  Created by IntelliJ IDEA.
  User: Rin
  Date: 2023/12/1
  Time: 8:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>忘记密码</title>
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
    <h1 class="text-center" style="margin-bottom: 50px">找回密码</h1>
    <form id="loginForm" action="ForgetPassword" method="post" class="form-horizontal">

      <div class="form-group">
        <label for="username" class="col-md-3 control-label">账号:</label>
        <div class="col-md-9">
          <input type="text" class="form-control" id="username" name="Username" placeholder="请输入账号">
        </div>
      </div>

      <div class="form-group">
        <label for="phone" class="col-md-3 control-label">手机号:</label>
        <div class="col-md-9">
          <input type="text" class="form-control" id="phone" name="user_phone" placeholder="请输入手机号">
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
          <button type="button" class="btn btn-primary login-btn" onclick="validateForm()">重置密码</button>
          <div class="error-message" id="error-message"></div>

        </div>
      </div>
    </form>


    <div class="text-center">
      <a href="Login.jsp" class="d-block">返回登录</a>
    </div>




  </div>

</div>

<!-- 引入jQuery -->
<script type="text/javascript" src="./js/jquery-3.7.1.js"></script>
<!-- 引入Bootstrap的JavaScript -->
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script>
  function validateForm() {
    var username = $("#username").val();
    var password = $("#password").val();
    var newpassword = $("#newpassword").val();
    var phone = $("#phone").val();

    var errorMessage = $("#error-message");

    if (username==="" || password==="" || newpassword===""||phone==="") {
      // 显示错误消息
      errorMessage.text("还有未填写的项目!");
      return;
    } else {
      // 隐藏错误消息
      errorMessage.text("");
      if(isPwd()){
        if(isCom()){
          // 提交表单
          $("#loginForm").submit();
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


