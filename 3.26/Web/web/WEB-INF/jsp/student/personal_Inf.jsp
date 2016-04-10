<%-- 
    Document   : personal_Inf
    Created on : 2016-2-25, 19:29:38
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
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/stylesheet-base.css" />
    <link rel="stylesheet" href="<%=path%>/css/navbar.css">
    <script src="<%=path%>/js/jquery.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <script  src="<%=path%>/js/md5.js"></script>
    <script src="<%=path%>/js/ie-emulation-modes-warning.js"></script><style type="text/css"></style>
     <script src="<%=path%>/js/ie10-viewport-bug-workaround.js"></script>
       <link rel="stylesheet" href="<%=path%>/css/flat-ui.css">
     <script>
          $(function () {
                        $.ajax({
                            type: "get", //提交方式
                            url: "../reg/hq_xy", //提交的页面，方法名
                            success: function (data) {
                                $("#szxy").empty();
                                for (var i = 0; i < data.length; i++) {
                                     $("#szxy").append("<option value='"+data[i]+"'>"+data[i]+"</option>");  
                                };  
                                 $("#szxy option[value="+${StudentCollege2}+"]").attr("selected", "true"); 
                                 
                            },
                            error: function () {
                                alert("error!！");
                            }
                        });
                         $.ajax({
                              type: "get", //提交方式
                              url: "../reg/fhnj", //提交的页面，方法名
                              success: function (data) {
                                  $("#fhnj").empty();
                                  for (var i = 0; i < data.length; i++) {
                                      $("#fhnj").append("<option value='"+data[i]+"'>"+data[i]+"</option>");  
                                  };
                                  $("#fhnj option[value='"+${StudentGrade}+"']").attr("selected","true"); 
                                  
                              },
                              error: function () {
                                  alert("error!！");
                              }
                          });
                      
                                  
                    });
     </script>
     <style type="text/css">
		body{	}
		.sidebar{width:25%;float:left;font-size: 125%;text-align:right;height:200px;line-height: 38px}
                .main_content{width:75%;height: 350px;float:right;clear:right;height:200px;}
	        
                .button_sub{float: none;top: 360px;left:15%;position: absolute}
	</style>

    </head>  
<body>
    <div class="sidebar">
学号：<br>
姓名：<br>
身份证号：<br>
年级：<br>
学院：<br>
性别：<br>
手机号：<br>
QQ：<br>

  </div>
     <div class="main_content">
<input type="text" value="${StudentId}" class="span3" /><br>
<input type="text" value="${StudentName}" class="span3" /><br>
<input type="text" value="${StudentIdcard}" class="span3" /><br>

<select value="${StudentGrade}" id="fhnj" style="font-size: 125%;margin-top:10px;">
</select><p>
<select value="${StudentCollege}"  id="szxy" style="font-size: 125%;margin-top:10px;">
</select><p>

<input type="text" value="${StudentSex}" class="span3" /><br>
<input type="text" value="${StudentTel}" class="span3" /><br>
<input type="text" value="${StudentQq}" class="span3" /><br>

   
</div>
<div class="button_sub">  
          <a href="#" class="button button-3d button-primary button-rounded">保存修改</a>
           <a href="<%=path%>/student/resetpw" target="content" class="button button-3d button-primary button-rounded">修改密码</a>
           　
 </div>
 
         
 
</body>
</html>
