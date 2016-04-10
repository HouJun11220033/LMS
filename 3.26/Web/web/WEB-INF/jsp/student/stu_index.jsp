<%-- 
    Document   : stu_index
    Created on : 2016-2-25, 16:30:38
    Author     : 刘昱
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%
//    将项目的根取出来，页面中不再使用相对路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>学生页面</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.css" />
    <link rel="stylesheet" href="<%=path%>/css/buttons.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/stylesheet-base.css" />
    <link rel="stylesheet" href="<%=path%>/css/navbar.css">
    <script src="<%=path%>/js/jquery.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <script  src="<%=path%>/js/md5.js"></script>
    <script src="<%=path%>/js/ie-emulation-modes-warning.js"></script><style type="text/css"></style>
     <script src="<%=path%>/js/ie10-viewport-bug-workaround.js"></script>
     	<script type="text/javascript">
            $(function(){
                    
                    //$("#cou").append("");
                $("#cou").append("<li><a href='<%=path%>/student/stu_listwpzcourse' target='content'>查看未批准课程</a></li>");
                $("#cou").append("<li><a href='<%=path%>/student/stu_addcourse' target='content'>加入其他课程</a></li>");

            })
			
		
		</script>
     <style type="text/css">
		body{	}
                
		.sidebar{width:17%;float:left;}
                .main_content{width:80%;height:85%;margin:auto 0;float:right;clear:right;}
	        .setheight{height:100%}
	</style>

    </head>  
<body>
    <div class="container setheight">

      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=path%>/student">学生页面</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="<%=path%>/student">我的主页</a></li>
              <li><a href="<%=path%>">课程主页</a></li>
              <li><a href="<%=path%>/stu_index">使用帮助</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多操作 <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">1</a></li>

                  <li role="separator" class="divider"></li>
                  <li class="dropdown-header">菜单标题</li>
                  <li><a href="#">2</a></li>
                </ul>
              </li>
            </ul>
             
            <ul class="nav navbar-nav navbar-right">
               <li><a href="<%=path%>/logout">登出系统</a></li>
            </ul>
              <div><p class="navbar-text navbar-right">欢迎您：${username}&nbsp;&nbsp;</p> </div>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
        
       
      </nav>
             
       <div class="sidebar">
                    	<ul class="nav nav-list na" id="cou">
				<li class="active">
				<a href="<%=path%>/student/personal_Inf" target="content">我的个人资料</a>
				</li>
				<li class="nav-header">我的课程</li>
				${stucou}
                                
			</ul>
		</div>
       <div class="main_content">
            
<iframe src="<%=path%>/student/personal_Inf" frameborder="0" scrolling="no" height="100%" width="100%" name="content" ></iframe>


		</div>	
  
</body>
</html>
