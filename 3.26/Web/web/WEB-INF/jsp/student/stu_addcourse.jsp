<%-- 
    Document   : stu_addcourse
    Created on : 2016-2-27, 16:11:12
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
    <script src="<%=path%>/js/jquery.js"></script>
    <script src="<%=path%>/js/bootstrap.js"></script>
    <script src="<%=path%>/js/bootstrap-treeview.js"></script>
    <script  src="<%=path%>/js/md5.js"></script>
    <script>
         $(function () {
            $("#subcor").hide(0);
            $('#tree').treeview({
                data: ${Course},
                onNodeSelected: function(event, node) {
                    var p1=$('#tree').treeview('getParent', $('#tree').treeview('getParent', node)).text;
                    var p2=$('#tree').treeview('getParent', node).text;
                    if(p2.length==1 || p1.length==1){
                   //('#tree').treeview('expandNode', [ node, { levels:1, silent:true }]);
                    $("#submas")[0].innerHTML="";
                    $("#cidinput").val("-1");
                    $("#subcor").hide(0);
                    return flase;
                    }
                    $("#submas")[0].innerHTML="您选择的科目："+p1+"<br> 您选择的任课教师："+p2+"<br> 您选择的所在班级："+node.text+"<br>课程id："+node.coid;
                    $("#cidinput").val(node.coid);
                    $("#subcor").show(1000);
                    
                }      
            }); 
            
             $("#subcor").click(function(){ 
                 $.post("<%=path%>/student/subcourse", { cid: $("#cidinput").val() },
                function(data){
                    if(data=="0"){alert("出错了，可能的原因：重复选课（如果您已经提交申请 请等待来时的确认）\n或者提交的数据有误，请尝试重新登录后再试。\n")};
                    if(data=="1"){alert("ok,您的选课信息已被系统接收，等待任课老师确认。");
                    window.location.href="<%=path%>/student/stu_addcourse";
                    };
                 });
               
                 
              
	       
            });
           
         });
     </script>
     <style type="text/css">
      .setwidth{width:75%; }
	</style>

    </head>  
<body>
    
    <div style="width:25%;float: left;">
    <div id="tree"></div>     
	</div>
    <div style="width:72%;float: right;">
    <div class="tabbable" id="tabs-974895 setwidth">
				<ul class="nav nav-tabs settabs">
					<li class="active"><a href="#panel-236368" data-toggle="tab">课程说明</a></li>
					<li><a href="#panel-86366" data-toggle="tab">课程大纲</a></li>
                                     
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-236368">
                                           
						课程介绍内容.</p>
                                                 <label  id="submas"> </label>
                                                   <p><a class="btn btn-primary btn-large" id="subcor">提交选课申请»</a>
                                                <input type="hidden" id="cidinput" value="-1">
						</p>
					</div>
					<div class="tab-pane" id="panel-86366">
						课程大纲内容.
						</p>
					</div>
                                       
				</div>
			</div>
        </div>
</body>
</html>
