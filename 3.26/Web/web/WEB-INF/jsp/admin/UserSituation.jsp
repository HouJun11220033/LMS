<%
    //    将项目的根取出来，页面中不再使用相对路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<%-- 
    Document   : UserSituation
    Created on : 2016-3-13, 20:45:46
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
        <h1>用户状态表</h1>
        <div class="progress progress-striped">
   <div class="progress-bar progress-bar-success" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 	
      style="width: 90%;">
      <span class="sr-only">90% 完成（成功）</span>90%
   </div>
</div>
<div class="progress progress-">
   <div class="progress-bar progress-bar-info" role="progressbar"
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 	
      style="width: 30%;">
      <span class="sr-only">30% 完成（信息）</span>30%
   </div>
</div>
<div class="progress progress-striped">
   <div class="progress-bar progress-bar-warning" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 	
      style="width: 20%;">
      <span class="sr-only">20% 完成（警告）</span>
      20%
   </div>
</div>
<div class="progress progress-striped">
   <div class="progress-bar progress-bar-danger" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 	
      style="width: 10%;">
      <span class="sr-only">10% 完成（危险）</span>10%
   </div>
</div>

    </body>
</html>
