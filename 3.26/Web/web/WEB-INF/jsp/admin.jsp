<%
    //    将项目的根取出来，页面中不再使用相对路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<%-- 
    Document   : admin
    Created on : 2016-3-10, 15:33:24
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
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/easyuicss/easyui.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/easyuicss/icon.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/images/tree_icons.png">
        <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
        <!--<script type="text/javascript" src="<%=path%>/js/jquery-1.7.min.js"></script>-->
        <script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
    </head>
    <style type="text/css">

    </style>
    <body>
        <!-- 导航栏-->
        <div class="container" >
            <div class="row">
                <div class="col-md-12">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a  href='<%=path%>/admin/functionManage' class="btn" target='content'>首页</a>
                        </li>
                        <li class="pull-right">
                            <a href="#"  class="active">退出</a>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container"> </div>
        <br>
        <br>
        <br>
        <!-- 中间内容部分-->
        <div class="container ">
            <div class="row">
                <div class="col-md-3"  >
                    <ul class="nav nav-list">
                        <li class="nav-header">
                            常用管理
                        </li>
                        <li>
                            <a href='<%=path%>/admin/functionManage' target='content'>功能管理</a>
                        </li>
                        <li>
                            <a href='<%=path%>/admin/personManage' target='content'>用户管理</a>
                        </li>
                        <li class="nav-header">
                            系统信息查看
                        </li>
                        <li>
                            <a href='<%=path%>/admin/ServerInformation' target='content'>服务器情况</a>
                        </li>
                        <li>
                            <a href='<%=path%>/admin/UserSituation' target='content'>用户情况</a>
                        </li>
                        <li class="divider">
                        </li>
                    </ul>
                </div>
                <div class="col-md-9">
                    <iframe src="<%=path%>/admin/functionManage" frameborder="0" scrolling="no" height="900px" width="100%" name="content" ></iframe>
                </div>
            </div>
        </div>
        <!-- footer-->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                </div>
            </div>
        </div>
    </body>
</html>
