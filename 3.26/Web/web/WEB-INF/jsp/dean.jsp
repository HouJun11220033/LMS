<%
    //    将项目的根取出来，页面中不再使用相对路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<%-- 
    Document   : dean
    Created on : 2016-3-17, 23:49:48
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
        <div class="container">
	<div class="row">
		<div class="col-md-12">
			<ul class="nav nav-tabs nav-active">
				<li class="active">
					<a href="#">首页</a>
				</li>
				<li class="">
					<a href="#">资料</a>
				</li>
				<li>
					<a href="#">信息</a>
				</li>
				<li class="dropdown pull-right">
					 <a href="#" data-toggle="dropdown" class="dropdown-toggle">下拉<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li>
							<a href="#">操作</a>
						</li>
						<li>
							<a href="#">设置栏目</a>
						</li>
						<li>
							<a href="#">更多设置</a>
						</li>
						<li class="divider">
						</li>
						<li>
							<a href="#">分割线</a>
						</li>
					</ul>
				</li>
			</ul>
			<div class="row">
				<div class="col-md-3">
					<ul class="nav nav-list">
						<li class="nav-header">
							列表标题
						</li>
						<li class="active">
                                                    <a href="<%=path%>/dean/MyInfo" target="content">我的个人资料</a>
						</li>
						<li>
							<a href="<%=path%>/dean/szlsjsxx" target="content">教师信息管理</a>
						</li>
						<li>
							<a href="#">学生信息管理</a>
						</li>
						<li class="nav-header">
							功能列表
						</li>
						<li>
							<a href="#">班级信息查看</a>
						</li>
						<li>
							<a href="#">本学期课程</a>
						</li>
                                                <li>
							<a href="#">新学期课程</a>
						</li>
                                                <li>
							<a href="<%=path%>/dean/deanButton" target='content'>院长按钮</a>
						</li>
						<li class="divider">
						</li>
						<li>
							<a href="#">帮助</a>
						</li>
					</ul>
				</div>
				<div class="col-md-9">
					<iframe src="<%=path%>/dean/MyInfo" frameborder="0" scrolling="no" height="900px" width="100%" name="content" ></iframe>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				</div>
			</div>
		</div>
	</div>
</div>
                                
<script>
    

    
    //导航栏设置
    $(document).ready(function(){
        $('.nav-active li').click(function(){
            $ ('.nav-active li').removeClass("active");
            $(this).addClass("active");
        });
    });
    
</script>
        
    </body>
</html>
