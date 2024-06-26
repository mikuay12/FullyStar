<%@ page import="com.xuyuanchang.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人主页</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <meta charset="UTF-8">
    <style>
        .back{
            background-color: #9acfea;
            padding-bottom: 50px;
            border-radius: 10px;

        }

        .title1{
            margin-left: 100px;
            font-style: italic;
            font-family: fantasy;
            font-variant: all-petite-caps;
            color: #0085ff;
        }


        .profile-card {
            height: 120px;
            width: 300px;
            background-color: #5bc0de;
            border-radius: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            margin-bottom: 40px;
            margin-left: 120px;
            margin-right: 50px;

            padding-top: 20px;
            padding-left: 10px;
        }

        .card-top{
            height: 40px;
            width: 280px;
            background-color: #5bc0de;
            padding: 0 0 0 0;
        }

        .info{
            height: 54px;
            width: 280px;
            background-color: #fff;
            border-radius: 30px;

        }

        p{
            font-size: 18px;
            font-style: italic;
            font-family: 宋体,serif;
            font-weight: bolder;
            color: #5d00ff;
        }

        .user_info{
            height: 54px;
            width: 280px;
            background-color: #fff;
            border-radius: 30px;
            font-size: 18px;
            font-style: italic;
            font-family: 宋体,serif;
            font-weight: bolder;
        }

        .info_input{
            height: 54px;
            width: 280px;
            background-color: #fff;
            border-radius: 30px;
            font-size: 18px;
            font-style: italic;
            font-weight: bolder;
        }

        .username{
            height: 54px;
            width: 280px;
            background-color: #fff;
            border-radius: 30px;
            font-size: 18px;
            font-style: italic;
            font-weight: bolder;
        }


        #edit-button{
            margin-left: 38%;
        }

        .sdb1{
            margin-left: 2%;
        }

        .sdb2{
            margin-left: 38%;
        }

        #BirthSpan{
            color: red;
        }
    </style>
</head>
<body>

    <div class="container">
        <%--    导航栏--%>
        <%
            String username = (String)session.getAttribute("Username");
            User user = new User(username);
            String state = "none";
            if("operator".equals(user.user_power)){
                state = "block";
            }
        %>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Host.jsp"><span class="glyphicon glyphicon-home"></span></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="Host.jsp">首页 <span class="sr-only">(current)</span></a></li>
                        <li><a href="UpLoad.html">添加书籍</a></li>
                        <li class="dropdown" style="display: <%=state%>">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color: red">管理员选项 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="UserManage.jsp">修改用户信息</a></li>
                                <li><a href="UserManage.jsp">封禁管理</a></li>
                                <%--                            <li><a href="#">Something else here</a></li>--%>
                                <li role="separator" class="divider"></li>
                                <li><a href="BookManage.jsp">审核书籍</a></li>
                                <%--                            <li role="separator" class="divider"></li>--%>
                                <li><a href="BookManage.jsp">下架书籍</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form action="BookSearch.jsp" method="get" class="navbar-form navbar-left">
                        <div class="form-group">
                            <input type="text" name="KeyWord" class="form-control" placeholder="请输入书籍关键词...">
                        </div>
                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span>搜索</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="UserPersonal.jsp">个人主页</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("user_name")%> <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="UserPersonal.jsp">修改个人信息</a></li>
                                <li><a href="#">作者认证</a></li>
                                <li><a href="ResetPassword.jsp">修改密码</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="Logout">退出登录</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <%--    导航栏--%>


<div class="row back">

    <h1 class="title1">用户<%=username%>的信息:</h1>


        <div class="row">
            <div class="col-md-6 profile-card">
                <div class="card-top text-center">
                    <p>用户名:</p>
                </div>
                <div class="text-center username">
                    <%=username%>
                </div>
            </div>


            <div class="col-md-6 profile-card">
                <div class="card-top text-center">
                    <p>姓名:</p>
                </div>
                <div class="text-center user_info">
                    <%=user.user_name%>
                </div>
            </div>
        </div>



        <div class="row">
            <div class="col-md-6 profile-card">
                <div class="card-top text-center">
                    <p>性别:</p>
                </div>
                <div class="text-center user_info">
                    <%=user.user_sex%>
                </div>
            </div>


            <div class="col-md-6 profile-card">
                <div class="card-top text-center">
                    <p>年龄:</p>
                </div>
                <div class="text-center user_info">
                    <%=user.user_age%>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-md-6 profile-card">
                <div class="card-top text-center">
                    <p>生日:</p>
                </div>
                <div class="text-center user_info" id="user_birth">
                    <%=user.user_birth%>
                </div>
            </div>


            <div class="col-md-6 profile-card">
                <div class="card-top text-center">
                    <p>电话:</p>
                </div>
                <div class="text-center user_info">
                    <%=user.user_phone%>
                </div>
            </div>
        </div>


        <button type="button" id="edit-button" class="btn btn-primary" onclick="EditInfo(<%=username%>)">编辑个人资料</button>
        <span id="BirthSpan" class="text-center"></span>



        </div>
    </div>
</body>
<script src="js/jquery-3.7.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript">

    function EditInfo(Username){
        var divs = $(".user_info");

        for(var i=0;i<divs.length;i++){
            var input = $("<input type='text'>");
            var div = $(divs[i]);
            input.attr("value",div.html().trim());
            input.attr("class","info_input")
            div.html("");
            div.append(input);
        }
        $("<button type='button' class='btn btn-danger sdb1' onclick='Cancel()'>取消</button>").insertAfter($("#edit-button"));
        $("<button type='button' class='btn btn-success sdb2' onclick='Confirm("+Username+")'>确定</button>").insertAfter($("#edit-button"));
        $("#edit-button").hide();
        $("#reset-button").hide();

    }


    function Cancel(){
        var divs = $(".user_info");

        for(var i=0;i<divs.length;i++){
            var input = divs.children().first();
            $(divs[i]).html(input.attr("value"));
            input.remove();
        }
        $("#edit-button").show();
        $("#reset-button").show();
        $("#edit-button").next().remove();
        $("#edit-button").next().remove();

    }


    function Confirm(Username){

        var divs = $(".user_info");
        var inputs = $(".info_input");
        var dataToSend = {
            Username : Username,
            user_name : inputs[0].value,
            user_sex : inputs[1].value,
            user_age : inputs[2].value,
            user_birth : inputs[3].value,
            user_phone : inputs[4].value
        }

        if(isDate()){
            $.ajax({
                type: "POST", // 或者使用 "GET"
                url: "http://localhost:8080/JavaWebProject/UserManage", // 你的Servlet的URL
                data: dataToSend,
                success: function (response) {
                    // 请求成功时的处理
                    alert("修改成功!"+response);
                    for(var i=0;i<divs.length;i++){
                        $(divs[i]).html(inputs[i].value);
                    }
                    $("#edit-button").show();
                    $("#reset-button").show();
                    $("#edit-button").next().remove();
                    $("#edit-button").next().remove();
                },
                error: function (error) {
                    // 请求失败时的处理
                    alert("修改失败，请检查服务器或联系管理员"+error);
                }
            });



        }
    }

    // 生日校验
    function isDate(){
        var text = $("#user_birth").children("input").val();
        var dateReg = /(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)/;
        var result = dateReg.test(text);
        if(!result){
            $("#BirthSpan").html("日期格式应为YYYY-MM-DD");
            return false;
        }
        else {
            $("#BirthSpan").html("");
            return true;
        }
    }




</script>

</html>
