<%@ page import="com.xuyuanchang.entity.User" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.xuyuanchang.entity.Book" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>主页</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <style>
        #BigScreen{
            background-image: url("BookImage/book1.jpg");
        }

        .img1{
            width: 200px;
            height: 200px;
            max-width: 200px;
            max-height: 200px;
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
                    <li><a href="UpLoad.html">书籍投稿</a></li>
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


    <!--巨幕-->
    <div class="jumbotron" id="BigScreen">
        <h1><%="下午好,"+session.getAttribute("user_name")%></h1>
        <p>一日无书，百日荒芜</p>
        <p><a class="btn btn-success btn-lg" href="BookDetails.jsp?book_ID=200201" role="button">随机读一本书</a></p>
    </div>

    <br>



    <br>

<div class="row">
<%
    try {
        ResultSet rs = Book.SelectAllBook();
        while (rs.next()){
            if(rs.getString("book_state").equals("上架中")){
                String ID = rs.getString("book_ID");
                String name = rs.getString("book_name");
                String author = rs.getString("book_author");
                String publisher = rs.getString("book_publisher");
                String imgpath = rs.getString("book_ImagePath");
                out.println("<div class=\"col-md-3\">");
                out.println("<div class=\"thumbnail\">");
                out.println("<img src=\""+imgpath+"\" class=\"img1\" alt=\"img\">");
                out.println("<div class=\"caption\">");
                out.println("<h3>"+name+"</h3>");
                out.println("<p>"+author+"</p>");
                out.println("<p>"+publisher+"</p>");
                out.println("<p><button class=\"btn btn-success\" onclick=\"Details("+ID+")\">了解更多</button></p>");
                out.println("</div></div></div>");
            }
            else{
                continue;
            }
        }
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>
</div>

<%--        <div class="col-md-3">--%>
<%--            <div class="thumbnail">--%>
<%--                <img src="BookImage/西游记.jpg" alt="img">--%>
<%--                <div class="caption">--%>
<%--                    <h3>西游记</h3>--%>
<%--                    <p>吴承恩</p>--%>
<%--                    <p>浙江大学出版社</p>--%>
<%--                    <p>--%>
<%--                        <button class="btn btn-success" onclick="Details(200201)">了解更多</button>--%>
<%--                    </p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>


</div>

<br>
<br/>
</body>
<script src="js/jquery-3.7.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript">


        function Details(id){
        window.open("http://localhost:8080/JavaWebProject/BookDetails.jsp?book_ID="+id);
    }


</script>
</html>