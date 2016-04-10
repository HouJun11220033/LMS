<%
    //    将项目的根取出来，页面中不再使用相对路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<%-- 
    Document   : deanButton
    Created on : 2016-3-21, 15:14:01
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap-pingendo.css" />
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/LongYeh-main.css" />
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/LongYeh-ree.css" />
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/buttons.css">
        <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
        <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=path%>/js/bootstrap-table.js"></script>
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap-table.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/images/tree_icons.png">
        
    </head>
    <body>
        <h1>院长按钮界面</h1>
          
          <div class="container">
              <br>
              <br>
              <br>
              <br>
              <div class="row">
                  <div class="col-sm-5">
                      <button class="btn btn-primary btn-lg" style ="padding: 60px 40px; font-size: 20px; line-height: 20px; border-radius: 10px" type="button">本学期胜利结束</button> 
                  </div>
                  <div class="col-sm-2"></div>
                  <div class="col-sm-5">
                      <button class="btn btn-primary btn-lg" style ="padding: 60px 40px; font-size: 20px; line-height: 20px; border-radius: 10px" type="button">新学期就要开始</button> 
                  </div>
              </div>
          </div>
          
    </body>
</html>
