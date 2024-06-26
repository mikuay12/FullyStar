<%@ page import="java.util.ArrayList" %>
<%@ page import="com.xuyuanchang.entity.Book" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.xuyuanchang.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setContentType("text/html;charset=utf-8");
    String book_ID = request.getParameter("book_ID");
    Book book = new Book(book_ID);
    book.EditInfo("book_recommend", String.valueOf(book.book_recommend+1));
    book.book_recommend+=1;
%>
<html>
<head>
    <title><%=book.book_name%></title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <style>
        .comment{
            font-size: 17px;
            margin-top: 8px;
        }


        .comment-box{
            height: 80px;
            margin-bottom: 20px;
            padding: 12px;
            border: 1px dotted #0f0f0f;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            border-radius: 10px;

        }


    </style>
</head>
<body>
<div class="container">
    <%--    导航栏--%>
    <%
        String username = (String)session.getAttribute("Username");
        User u = new User(username);
        String state = "none";
        if("operator".equals(u.user_power)){
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
    <div class="jumbotron row">
        <div class="col-md-6">
            <img src="<%=book.book_ImagePath%>" style="height: 400px;width: 400px">
        </div>
        <div class="col-md-6 row">
            <div class="row">
                <div class="col-md-6">
                    <h2><b><%=book.book_name%></b></h2>
                </div>
                <div class="col-md-6">
                    <h4>作者:<%=book.book_author%></h4>
                    <h5>出版社:<%=book.book_publisher%></h5>
                    <h5>出版时间:<%=book.book_PublishDate%></h5>
                </div>
            </div>
            <div class="row">
                <div class="text-small"><%=book.book_describe%></div>
            </div>
            <div class="row col-md-offset-5">
                <a class="btn btn-success btn-lg" href="#" role="button">阅读</a>
            </div>
        </div>
    </div>
    <!--巨幕-->


    <%
        ResultSet rs = book.SelectCommentsByBookID();
        while (rs.next()){
            User user = new User(rs.getString("comment_user"));
            out.println("<div class=\"col-md-12 comment-box\">");
            out.println("<div>"+user.user_name+"的评论:</div>");
            out.println("<div class=\"col-md-offset-1 comment\">"+rs.getString("comment_content")+"</div>");
            out.println("</div>");
        }

    %>


<%--    <div class="col-md-12 comment-box">--%>
<%--        <div>1001003的评论:</div>--%>
<%--        <div class="col-md-offset-1 comment">非常好看，爱来自瓷器</div>--%>
<%--    </div>--%>



    <form action="Comment" method="post" class="form-control" style="border: none">
        <input type="hidden" name="book_ID" value="<%=book_ID%>">
        <textarea name="comment" class="form-control" rows="3" placeholder="我也评论一下"></textarea>
        <button class="btn btn-primary" type="submit" style="margin-top: 8px;margin-bottom: 200px">评论</button>
    </form>
</div>
</body>
<script src="js/jquery-3.7.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript">


</script>
</html>
