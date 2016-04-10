<%-- 
    Document   : stu_course
    Created on : 2016-2-27, 11:15:12
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
    <title></title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.css" />
    <link rel="stylesheet" href="<%=path%>/css/buttons.css">
    <link rel="stylesheet" href="<%=path%>/css/navbar.css">
    <script src="<%=path%>/js/jquery.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <script  src="<%=path%>/js/md5.js"></script>
    <script src="<%=path%>/js/ie-emulation-modes-warning.js"></script><style type="text/css"></style>
     <script src="<%=path%>/js/ie10-viewport-bug-workaround.js"></script>
   	<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyuicss/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyuicss/icon.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/images/tree_icons.png">
	<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
<%-- <link href="<%=path%>/ueditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/umeditor.config.js"></script>
        <script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/umeditor.min.js"></script>
        <script type="text/javascript" src="<%=path%>/ueditor/lang/zh-cn/zh-cn.js"></script>  --%>      
        
     <script>
          $(function () {
//              var description=${CourseDescription};
//              if(description==""){
//                    $("#CourseDescription")[0].innerHTML="课程介绍暂未更新等待添加"; 
//              }else{
//                    $("#CourseDescription")[0].innerHTML=description; 
//              } 
//              var syllabu=${syllabus};
//              if(syllabu==""){
//                    $("#syllabusspan")[0].innerHTML="课程大纲暂未更新等待添加"; 
//              }else{
//                    $("#syllabusspan")[0].innerHTML=syllabu; 
//              }
            
         });
        }
     </script>
     <style type="text/css">

	</style>

    </head>  
<body>
	<div class="tabbable" id="tabs-974895">
				<ul class="nav nav-tabs settabs">
					<li class="active"><a href="#panel-236368" data-toggle="tab">课程介绍</a></li>
					<li><a href="#panel-86366" data-toggle="tab">课程大纲</a></li>
                                        <li><a href="#panel-86367" data-toggle="tab">课程内容</a></li>
                                        <li style="float:right"><a href="#panel-86369" data-toggle="tab">退出该课程</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-236368">
                                               ${syllabusspan}
						</p>
					</div>
					<div class="tab-pane" id="panel-86366">
                                                ${CourseDescription}
						</p>
					</div>
                                        <div class="tab-pane" id="panel-86367">
						<%--  data:'kcgs?scid='+${scid}, --%>
                                             <div style="width: 20%;float: left;">
                                            <ul id="tt1"  class="easyui-tree" data-options="
                                                                url:'kcgs?scid='+${scid},
                                                                    method: 'get',
                                                                    animate: true ">
                                                                        
                                            </ul>
                                            </div>  
                                            
                                            
						</p>
					</div>
                                         <div class="tab-pane" id="panel-86369">
						<div class="hero-unit">
				<h1 style="font-color:red;">
					请慎重操作！
				</h1>
				<p style="font-color:red;">
					退出该课程着您的所有作业及其他与该课程相关的内容均会被删除。
				</p>
				<p>
					<a class="btn btn-primary btn-large" href="quitcourse?scid=${scid}">我知道了，我要继续删除»</a>
				</p>
			</div>
					</div>
				</div>
			</div>
 
</body>
</html>
