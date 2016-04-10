<%
    //    将项目的根取出来，页面中不再使用相对路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<%-- 
    Document   : teacherManager
    Created on : 2016-3-22, 22:02:29
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
        <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
 	<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyuicss/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyuicss/icon.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/images/tree_icons.png">
	<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
        <!--<script type="text/javascript" src="<%=path%>/js/jquery-1.7.min.js"></script>-->
	<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
        
    </head>
    <body>
        <jsp:include page="../acdemic/zs_js.jsp"></jsp:include>
        
   
        
    </body>
</html>
