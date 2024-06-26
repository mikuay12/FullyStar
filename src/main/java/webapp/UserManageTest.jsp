<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.xuyuanchang.entity.User" %>
<%--
  Created by IntelliJ IDEA.
  User: Rin
  Date: 2023/11/21
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <style>

        .sd{
            margin-left: 5px;
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
                    <li><a href="#">添加书籍</a></li>
                    <li class="dropdown" style="display: <%=state%>">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理员选项 <span class="caret"></span></a>
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


    <h1>用户列表:</h1>
    <br>
    <br>
    <table class="table table-hover">
        <tr>
            <th>用户名</th>
            <th>用户密码</th>
            <th>用户ID</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>手机号</th>
            <th>生日</th>
            <th>操作</th>
        </tr>
        <%
            try {
                ResultSet rs = User.SelectAllUser();

                while (rs.next()){
                    out.print("<tr>");
                    String user_ID = rs.getString("user_ID");
                    String Username = rs.getString("Username");
                    for(int i=1;i<9;i++){
                        out.print("<td><div class='"+Username+"'>" + rs.getString(i) + "</div></td>");
                    }
                    out.print("<td><div><input type='submit' value='修改信息' id='"+Username+"' class='btn btn-primary sd' onclick=EditUserInfo('"+Username+"')>");
                    if(rs.getString("user_power").equals("ban"))
                        out.print("<button type='button' id='b"+Username+"' class='btn btn-success sd' onclick=SetState('"+Username+"')>解除封禁</button></div></td>");
                    else
                        out.print("<button type='button' id='b"+Username+"' class='btn btn-danger sd' onclick=SetState('"+Username+"')>封禁用户</button></div></td>");
                    out.print("</tr>");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        %>
    </table>


</div>
</body>
<script src="js/jquery-3.7.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript">


    function EditUserInfo(id){
        var divs=document.getElementsByClassName(id);
        for(var i=0;i<divs.length;i++){
            var input = document.createElement('input')
            input.className = "info_input";
            input.setAttribute("type","text");
            input.setAttribute("value",divs[i].innerHTML);
            input.style.width='80px';
            divs[i].innerHTML = "";
            divs[i].appendChild(input);
        }
        var submit=document.getElementById(id);
        submit.setAttribute("value","完成");
        submit.setAttribute("onclick","Finish("+id+")");
    }

    function Finish(id){
        var inputs=document.getElementsByClassName("info_input");
        var divs=document.getElementsByClassName(id);
        for(let i =0;i < divs.length;i++){
            divs[i].innerHTML=inputs[0].value;
        }
        var submit=document.getElementById(id);
        submit.setAttribute("value","修改信息");
        submit.setAttribute("onclick","EditUserInfo("+id+")");
        var Username = divs[0].innerHTML;
        var Password = divs[1].innerHTML;
        var user_ID = divs[2].innerHTML;
        var user_name = divs[3].innerHTML;
        var user_age = divs[4].innerHTML;
        var user_sex = divs[5].innerHTML;
        var user_phone = divs[6].innerHTML;
        var user_birth = divs[7].innerHTML;
        var dataToSend = {
            Username: Username,
            Password: Password,
            user_ID: user_ID,
            user_name: user_name,
            user_age: user_age,
            user_sex: user_sex,
            user_phone: user_phone,
            user_birth: user_birth
        };

        $.ajax({
            type: "POST", // 或者使用 "GET"
            url: "http://localhost:8080/JavaWebProject/UserManage",
            data: dataToSend,
            success: function (response) {
                // 请求成功时的处理
                console.log("Servlet返回的数据：" + response);
                alert("修改成功!")
            },
            error: function (error) {
                // 请求失败时的处理
                console.log("发生错误：" + error);
                alert("修改失败，请联系管理员");
            }
        });
    }



    function SetState(username) {
        $.ajax({
            type: "POST", // 或者使用 "GET"
            url: "http://localhost:8080/JavaWebProject/BanUser",
            data: {
                Username : username
            },
            success: function (response) {
                var ban = $("#b"+username);
                // 请求成功时的处理
                console.log("Servlet返回的数据：" + response);
                alert(response);
                // var state = $("#b"+username).html();
                // if(state=="封禁用户"){
                //     $("#b"+username).html("解除封禁");
                // }
                // else{
                //     $("#b"+username).html("封禁用户");
                // }
                if(response=="解除封禁成功!"){
                    ban.html("封禁用户");
                    ban.removeClass("btn-success");
                    ban.addClass("btn-danger");
                }
                else if(response=="封禁用户成功!"){
                    ban.html("解除封禁");
                    ban.removeClass("btn-danger");
                    ban.addClass("btn-success");
                }
            },
            error: function (error) {
                // 请求失败时的处理
                alert("操作失败!检查输入")
                console.log("发生错误：" + error);
            }
        });
    }

</script>
</html>
