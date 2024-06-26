<%@ page import="com.xuyuanchang.entity.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.xuyuanchang.entity.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%
    String KeyWord = request.getParameter("KeyWord");
    String BookType  = request.getParameter("BookType");
%>
<head>
  <title>书籍查找</title>
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




  <h1>书籍查找</h1>
  <br>

  <div class="row">
    <div class="col-md-10">
      <form action="BookSearch.jsp" method="get" class="form-inline">
        <div class="form-group">
          <input type="text" name="KeyWord" class="form-control" value="<%=KeyWord%>" placeholder="搜索...">
        </div>
        <div class="form-group">
          <select name="BookType" id="BookType" class="form-control">
            <option value="">筛选类型</option>
            <option value="外国文学">外国文学</option>
            <option value="中国文学">中国文学</option>
            <option value="悬疑/推理">悬疑/推理</option>
            <option value="玄幻">玄幻</option>
            <option value="生活">生活</option>
            <option value="儿童读物">儿童读物</option>
          </select>
        </div>
        <div class="form-group">
          <button class="btn btn-default" type="submit" id="book-search-button"><span class="glyphicon glyphicon-search"></span>搜索</button>
        </div>
      </form>
    </div>
  </div>


  <br>


  <table class="table table-hover">
    <tbody>
    <tr>
      <th>书籍ID</th>
      <th>书名</th>
      <th>作者</th>
      <th>出版社</th>
      <th>类型</th>
      <th>操作</th>
    </tr>

<%
  if(KeyWord != null || !KeyWord.equals("")){
    ArrayList<Book>books;
    if(BookType == null||BookType.equals(""))
      books = Book.SelectBookByName(KeyWord);
    else
      books = Book.SelectBookByName(KeyWord,BookType);
    if(books.isEmpty()){
      out.println("<div class=\"row\"><h3>未查询到结果</h3></div>");
    }
    else {
      int i=0;
      for(Book book : books){
        if(book.book_state.equals("上架中")){
          i++;
          out.println("<tr>");
          out.println("<td>"+book.book_ID+"</td>");
          out.println("<td>"+book.book_name+"</td>");
          out.println("<td>"+book.book_author+"</td>");
          out.println("<td>"+book.book_publisher+"</td>");
          out.println("<td>"+book.book_type+"</td>");
          out.println("<td><button class=\"btn btn-success\" onclick=\"Details("+book.book_ID+")\">查看详情</button></td>");
        }
        else {
          continue;
        }
        if(i==0){
          out.println("<div class=\"row\"><h3>未查询到结果</h3></div>");
        }
      }
    }

  }
%>
<%--    <tr>--%>
<%--      <td>1001</td>--%>
<%--      <td>红楼梦</td>--%>
<%--      <td>曹雪芹</td>--%>
<%--      <td>中国人民出版社</td>--%>
<%--      <td>中国文学</td>--%>
<%--      <td><button class="btn btn-success" onclick="Details(1001)">查看详情</button></td>--%>
<%--    </tr>--%>

    </tbody>
  </table>



</div>
</body>
<script src="js/jquery-3.7.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="./js/bootstrap.min.js"></script> 
<script type="text/javascript">
  function Details(id){
    window.open("http://localhost:8080/JavaWebProject/BookDetails.jsp?book_ID="+id);
  }

</script>
</html>