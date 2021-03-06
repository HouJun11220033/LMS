<%--
    Document   : console-dean
    Created on : 2015-11-1, 15:52:30
    Author     : loki
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//  将项目的根取出来，页面中不再使用相对路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + path + "/";

%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>教务员</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="<%=path%>/css/buttons.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/stylesheet-base.css" />
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/stage.css" />
        <script src="<%=path%>/js/jquery.js"></script>
        <script src="<%=path%>/js/bootstrap.js"></script>
        <script src="<%=path%>/js/stage.js"></script>
        <script type="text/javascript" src="<%=path%>/js/jquery-1.7.min.js"></script>

        <style media="screen">

            #console-nav {
                position: fixed;
                top: 0;
                bottom: 0;
                right: 0px;
                width: 75px;
                height: inherit;
                background-color: #575757;
            }
            #console-nav ul{
                padding: 0;
                margin-top: 0;
                margin-bottom: 0;
                color: gray;
            }
            #console-nav li{
                display: block;
                padding:50px 30px;
            }
            #console-nav li:hover{
                background-color: #2B2B2B;
                color: wheat;
            }
            #console-nav a{
                text-decoration: none;
                color: gray;
            }
            .console-sections{
                background-color: rgba(0,0,0,0.9);
            }
            .console-section{

            }
            #tmp-guide{
                padding: 50px;
                margin: 50px auto;
                border-left: 3px solid rgba(255, 0, 0, 0.5);
                background-color: #fff;
                color: rgba(255, 0, 0, 0.5)
            }
            #tree-header{
                margin-left: -20px;
                margin-top: -20px;
                margin-right: 55px;
            }
            #tree-footer{
                margin-left: -20px;
            }
            #tree-body{
                 width: 85%;
                 margin-left: 5%;
                 margin-right: 10%;
            }
        </style>
        <style media="screen">
            .lead_for_u{
                border-left: 3px solid #222;
                background-color: #fff;
                color: #222;
                padding: 50px;
                margin: 50px auto;
            }
            .li_side-body{
                padding: 25px;
                border-left: 3px solid #20ba6b;
                background-color: #eee;
            }
            .li_side-foot{}
            .li_side-iteml{
                margin-top: 20px;
            }
            .li_side-iteml a{
                text-decoration: none;
            }
            .li_side-iteml li{

                border-radius: 2px;
                padding: 10px 10px;
                list-style: disc;
            }
            .li_side-iteml li:hover{
                background-color: #eee;
            }
        </style>
    </head>
    <body id="tree-frame">
        <!-- 背景 底部 -->
        <header class=" section-nav" id="tree-header">
            <!-- 顶部 导航栏   -->

            <div class="navbar-header">
                <button type="button" class="navbar-toggle " data-toggle="collapse" data-target="#navbar-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="index.html" class="navbar-brand " >
                    <b>教务系统</b><span class="hidden-xs"> :&nbsp;&nbsp; <span id="idom" class="idom">There are no shortcuts to any place worth going .</span>&nbsp;&nbsp;:)  </span>
                </a>
            </div>
            <div class="collapse navbar-collapse" id="navbar-1">
                <ul class="nav navbar-nav navbar-right box-none">
                    <li><a href="javascript(0);" class="btn-forline forline-active">
                            教务员
                        </a></li><li>
                        <a href="index-tree.jsp" class="btn-forline"  id="tree-hole">
                            学树
                        </a></li><li >
                        <!--<a href="#" class="btn-forline">时间:<span id=tick2></span>周六</a>-->
                        <a href="<%=path%>/logout" class="btn-forline">登出</a>
                        <!--//   <a href="#" class="btn-forline">时间:8:00 am 周六</a>-->
                    </li>

                </ul>
            </div>


        </header>

        <div id="console-nav">
            <ul >
                <a href="#nav_to_personal" data-toggle="tab"><li>个人信息</li></a>
                <a href="#nav_to_lessons" data-toggle="tab"><li>学期课程</li></a>
                <a href="#nav_to_teachers" data-toggle="tab"><li>教师管理</li></a>
                <a href="#nav_to_students" data-toggle="tab"><li>学生管理</li></a>
            </ul>
        </div>
        <div class="container stage-content box-none"  id="tree-body">
            <!-- 主页 开始 -->
            <div id="tree-main"  class="row" >
             <!-- 封面 开始 -->

                <div class="col-sm-11 tab-content" id=" console-sections">
                    <div class="console-section tab-pane fade in active" id="nav_to_help">

                        <ul id="tmp-guide">
                            <li class="li_side-head"><h3>页面说明</h3></li>
                            <li class="li_side-body">
                                本指导界面将会存在一段时间, 直到大部分教务员都熟悉新的教务系统之后.<br>
                                同时欢迎您能够提出宝贵的意见反馈给我们,页面底部留有我们的联系方式和邮箱~
                                祝您使用愉快
                            </li>
                            <li>
                                <div style="display:none" id = "szjsxxdiv"><jsp:include page="acdemic/szlsjsxx.jsp"  /></div></li>
                            <!--教师信息管理-->
                            <li>
                                <div style="display:none;" id="szbjxxdiv" >  <jsp:include page="acdemic/ckbjxx.jsp"/>  </div>
                                <!--设置教学班级-->
                            </li>
                            <li>
                                <div style="display:none;" id="szxsxx_div" >  <jsp:include page="acdemic/szxsxx.jsp"/>  </div>
                                <!--学生信息管理-->
                            </li>
                            <li> <div style="display:none;" id="sz_zs_xsxx_div" >  <jsp:include page="acdemic/zs_stu.jsp"/>  </div>
                                <!--正式学生信息管理-->
                            </li>
                            <li>
                                <div style="display:none;" id="sz_zs_js_div" >  <jsp:include page="acdemic/zs_js.jsp"/> </div>
                                    <!--正式教师信息管理-->
                            </li>
                            <li>
                                <div style="display:none;" id="sz_zs_kc_div" >  <jsp:include page="acdemic/course.jsp"/> </div>
                                    <!--正式教师信息管理-->
                            </li>
                            <li> 
                                <div  style="display:none;" id="sz_zs_kc_all">   <jsp:include page="acdemic/set_all.jsp"/> </div>
                            </li>
                        </ul>        

                    </div>
                    <div class="console-section tab-pane fade" id="nav_to_personal">
                        <div class="container forstage-x bg-content stage-box">
                            <div class="regard ">
                                <h1> &nbsp;个人设置 <small>中心</small></h1>
                            </div>
                            <ul class="nav nav-tabs">
                                <li class="active pull-right">
                                    <a href="#myBaseInformation" data-toggle="tab">
                                        基本资料
                                    </a>
                                </li>
                                <li class="pull-right">
                                    <a href="#Password" data-toggle="tab" onclick="zl()">
                                        修改密码
                                    </a>
                                </li>
                            </ul>
                            <div class="row">
                                <div class="  tab-content form-box">

                                    <div id="myBaseInformation" class="tab-pane fade in active">
                                        <div style="padding-left:11%" class=" tab-pane fade in active">
                                        工号：<span id="teacher_sn"> </span><br>
                                        姓名：<span id="teacher_name"> </span><br>
                                        性别：<span id="teacher_sex"></span><br>
                                        学院：<span id="teacher_collage"></span><br>
                                        职称：<span id="teacher_zc"></span><br>
                                        身份证号：<span id="teacher_idcard"> </span><br>
                                        </div>
                                    </div>
                                    <!--密码页面开始-->
                                    <div id="Password" class=" tab-pane fade in active" style="display: none">
                                        <form class=" form-horizontal" role="form">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">旧密码：</label>
                                                <div class=" col-sm-8">
                                                    <input type="password" class="form-control" placeholder="请输入您的旧密码">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">新密码：</label>
                                                <div class=" col-sm-8">
                                                    <input type="password" class="form-control" placeholder="请输入您的新密码">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-labe"> </label>
                                                <div class=" col-sm-8">
                                                    <div class=" input-group ">
                                                        <input type="password" class="form-control" placeholder="请输入您的新密码">
                                                        <span class="input-group-addon btn btn-default">确定</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!--密码页面结束-->

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="console-section tab-pane fade" id="nav_to_lessons">
                        <ul class="lead_for_u">
                            <li class="li_side-head"><h3> 学期课程 <small> 提供教务员对 </small></h3></li> <br>
                            <li class="li_side-body">
                                1. 教学班级,教学课程的管理 <br>
                                2. 学期课程的安排与微调 <br>
                                <br>
                                说明:
                                <br>
                            </li> <br>
                            <li class="li_side-foot">
                                <h3><small> 转到: </small></h3>
                                <ul class="li_side-iteml">

                                    <a href="" data-toggle="tab" onclick="szjsxx_con()" id="szbjxx"><li>设置教学班级</li></a>
                                    <a href="" data-toggle="tab" onclick="sz_course()" id="sz_course"><li>设置教学课程</li></a>
                                    <a href="" data-toggle="tab" onclick="sz_all_course()" id="sz_course_all"><li>教学安排</li></a>
                                   
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="console-section tab-pane fade" id="nav_to_teachers">
                        <ul class="lead_for_u">
                            <li class="li_side-head"><h3> 教师管理 <small> 提供教务员对 </small></h3></li> <br>
                            <li class="li_side-body">
                                1. 教学班级,教学课程的管理 <br>
                                2. 学期课程的安排与微调 <br>
                                <br>
                                说明:
                                <br>
                            </li> <br>
                            <li class="li_side-foot">
                                <h3><small> 转到: </small></h3>
                                <ul class="li_side-iteml">
                                    <a href="" data-toggle="tab" onclick="szjsxx()" id="szjsxx"><li>设置教师信息</li></a>
                                    <a href="" data-toggle="tab" onclick="sz_zs_jsxx()" id="sz_zs_jsxx"><li>已批准教师信息</li></a>
                                    <!--                                    <a href=""><li>设置教学班级</li></a>
                                                                        <a href=""><li>设置教学课程</li></a>
                                                                        <a href=""><li>本学期课程微调</li></a>
                                                                        <a href=""><li>下学期课程安排</li></a>-->

                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="console-section tab-pane fade" id="nav_to_students">
                        <ul class="lead_for_u">
                            <li class="li_side-head"><h3> 学期课程 <small> 提供教务员对 </small></h3></li> <br>
                            <li class="li_side-body">
                                1. 教学班级,教学课程的管理 <br>
                                2. 学期课程的安排与微调 <br>
                                <br>
                                说明:
                                <br>
                            </li> <br>
                            <li class="li_side-foot">
                                <h3><small> 转到: </small></h3>
                                <ul class="li_side-iteml">
                                    <a href="" data-toggle="tab" onclick="szxsxx()" id="szxsxx"><li>设置学生信息</li></a>
                                    <a href="" data-toggle="tab" onclick="ypz_szxsxx()" id="ypz_szxsxx"><li>已批准学生信息管理</li></a>


                                </ul>
                            </li>
                        </ul>

                    </div>
                </div>
                <!-- 封面 结束 -->
                <!-- 导航图 开始 -->
                <div class="col-sm-1">

                </div>

                <!-- 导航图 结束 -->
            </div>
            <!-- 主页 结束 -->

        </div>
        <!--  主页页尾 开始 -->
        <footer class="container-fluid" id="tree-footer" >
            <h5 id="tree-copyright">
                <span class="text-muted stage-section stage-box" >
                    <strong>Copyright © 2015 ● 河南大学软件学院</strong>
                </span>
            </h5>

            <div class="row stage-section placeholders">
                <div class="col-md-4 placeholder">
                    <h4>关于我们</h4>
                    <span class="text-muted">我们的主页:</span>
                    <span class="text-muted">
                        <a href="about_us">LongYeh</a>
                    </span>
                </div>

                <div class="col-md-4 placeholder">
                    <h4>Feedback</h4>
                    <span class="text-muted">Email:
                        <a href="mailto:llgtgx1@hotmail.com">llgtgx1@hotmail.com</a>
                    </span>
                    <br>
                    <span class="text-muted">帮助:
                        <a href="index-help.html">帮助文档</a>
                    </span>
                </div>

                <div class="col-md-4 placeholder">
                    <h4>地址</h4>
                    <span class="text-muted">开封市 金明区金明大道</span>
                    <br />
                </div>
            </div>
            <br />
        </footer>
        <!--  主页页尾 结束 -->

        <!-- 背景 顶部 -->

        <script type="text/javascript">
            //板块高度设计
            $(function () {

                $("#tree-hole").click(function () {
                    $("#tree-body").css({
                        'paddingBottom': '0',
                        'paddingTop': '0'
                    });
                });

                var treeFrame = $("#tree-frame").height();
                var treeHeader = $("#tree-header").height();
                var treeCopyright = $("#tree-copyright").height();
                var treeContent = treeFrame - treeHeader;

                $("#intro-frame").css({
                    'min-height': treeContent - treeCopyright
                });
                $("#tree-body").css({
                    'min-height': treeContent - treeCopyright
                });

            });

            function szjsxx() {

                document.getElementById("szjsxx").href = "#nav_to_help";
                $("#szjsxxdiv").show();
                $("#szbjxxdiv").hide();
                $("#szxsxx_div").hide();
                $("#sz_zs_xsxx_div").hide();
                $("#sz_zs_js_div").hide();
                $("#sz_zs_kc_div").hide();
                $("#sz_zs_kc_all").hide();
            }
            function szjsxx_con() {
                document.getElementById("szbjxx").href = "#nav_to_help";
                $("#szbjxxdiv").show();
                $("#szxsxx_div").hide();
                $("#sz_zs_xsxx_div").hide();
                $("#sz_zs_js_div").hide();
                $("#sz_zs_kc_div").hide();
                $("#szjsxxdiv").hide();
                $("#sz_zs_kc_all").hide();

            }
            function szxsxx() {

                document.getElementById("szxsxx").href = "#nav_to_help";
                $("#szxsxx_div").show();
                $("#szbjxxdiv").hide();
                $("#sz_zs_xsxx_div").hide();
                $("#sz_zs_js_div").hide();
                $("#sz_zs_kc_div").hide();
                $("#szjsxxdiv").hide();
                $("#sz_zs_kc_all").hide();
            }
            function ypz_szxsxx() {

                document.getElementById("ypz_szxsxx").href = "#nav_to_help";
                $("#sz_zs_xsxx_div").show();
                $("#szbjxxdiv").hide();
                $("#szxsxx_div").hide();
                $("#sz_zs_js_div").hide();
                $("#sz_zs_kc_div").hide();
                $("#szjsxxdiv").hide();
                $("#sz_zs_kc_all").hide();
            }
            function sz_zs_jsxx() {

                document.getElementById("sz_zs_jsxx").href = "#nav_to_help";
                $("#sz_zs_js_div").show();
                $("#szbjxxdiv").hide();
                $("#szxsxx_div").hide();
                $("#sz_zs_xsxx_div").hide();
                $("#sz_zs_kc_div").hide();
                $("#szjsxxdiv").hide();
                $("#sz_zs_kc_all").hide();
            }
            function sz_course() {

                document.getElementById("sz_course").href = "#nav_to_help";
                $("#sz_zs_kc_div").show();
                $("#szbjxxdiv").hide();
                $("#szxsxx_div").hide();
                $("#sz_zs_xsxx_div").hide();
                $("#sz_zs_js_div").hide();
                $("#szjsxxdiv").hide();
                $("#sz_zs_kc_all").hide();
            }
           function sz_all_course(){
               document.getElementById("sz_course_all").href = "#nav_to_help";
                $("#sz_zs_kc_div").hide();
                $("#szbjxxdiv").hide();
                $("#szxsxx_div").hide();
                $("#sz_zs_xsxx_div").hide();
                $("#sz_zs_js_div").hide();
                $("#szjsxxdiv").hide();
                $("#sz_zs_kc_all").show();
            }
                
//          $(function () {
//              ckbjxx(); 
//              ckkcxx();
//              ckls_jsxx();
//              sj_stu();
//              ck_zs_jsxx();
//              sj_zs_stu();
//          });
           //加载个人资料
           $(function(){
               $.ajax({
                   type:"get",
                   url:"getAcdemic",
                   success:function(data){
                    document.getElementById("teacher_sn").innerHTML = data[0]; 
                    document.getElementById("teacher_name").innerHTML = data[1]; 
                    document.getElementById("teacher_sex").innerHTML = data[2]; 
                    document.getElementById("teacher_collage").innerHTML = data[3]; 
                    document.getElementById("teacher_zc").innerHTML = data[4]; 
                    document.getElementById("teacher_idcard").innerHTML = data[5];    
                   },
                   error:function(){
                       alert("获取个人资料失败！");
                   }
               });
           });
        function zl(){
            $("#Password").show();
        }
        </script>


    </body>


</html>
