<%@ page import="com.xuyuanchang.entity.Book" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.xuyuanchang.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Rin
  Date: 2023/11/25
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>书籍管理</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
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

    <h1>书籍管理</h1>
    <table class="table table-hover">
        <tbody>
        <tr>
            <th>书籍ID</th>
            <th>书名</th>
            <th>作者</th>
            <th>出版日期</th>
            <th>类型</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <%
            try {
                ResultSet rs = Book.SelectAllBook();
                while (rs.next()){
                    out.println("<tr>");
                    String ID = rs.getString("book_ID");
                    for(int i=1;i<7;i++){
                        out.println("<td><div class='"+ID+"'>" + rs.getString(i) + "</div></td>");
                    }
                    if(rs.getString("book_state").equals("上架中"))
                        out.println("<td><div><button type='button' class='btn btn-danger' id='"+ID+"' onclick='ChangeState("+ID+")'>下架书籍</button></div></td>");
                    else
                        out.println("<td><div><button type='button' class='btn btn-success' id='"+ID+"' onclick='ChangeState("+ID+")'>通过审核</button></div></td>");
                    out.println("</tr>");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        %>
        </tbody>
    </table>
</div>
</body>
<script src="js/jquery-3.7.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>

<script type="text/javascript">

    function ChangeState(id) {
        if($("#"+id).html() == "通过审核"){
            method = "上架中";
        }
        else{
            method = "待审核";
        }
        $.ajax({
            type: "GET", // 或者使用 "GET"
            url: "http://localhost:8080/JavaWebProject/BookManage", // 你的Servlet的URL
            data: {
                book_ID:id,
                method:method
            },
            success: function (response) {
                var btn = $("#"+id);
                // 请求成功时的处理
                alert("操作成功!"+response);
                if(btn.html() == "通过审核"){
                    btn.html("下架书籍");
                    btn.removeClass("btn-success");
                    btn.addClass("btn-danger");
                }
                else{
                    btn.html("通过审核");
                    btn.removeClass("btn-danger");
                    btn.addClass("btn-success");
                }
                $("."+id).last().html(method);
            },
            error: function (error) {
                // 请求失败时的处理
                alert("操作失败!请联系管理员"+error);
            }
        });
    }

</script>
</html>
