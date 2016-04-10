<%
    //    将项目的根取出来，页面中不再使用相对路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <title>个人中心</title>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap-pingendo.css" />
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/LongYeh-main.css" />
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/LongYeh-ree.css" />
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/buttons.css">
        <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
        <script type="text/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
 	<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyuicss/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyuicss/icon.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/images/tree_icons.png">
	<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
        <!--<script type="text/javascript" src="<%=path%>/js/jquery-1.7.min.js"></script>-->
	<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
        <script  src="<%=path%>/js/md5.js"></script>      
        <link href="<%=path%>/ueditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/umeditor.config.js"></script>
        <script type="text/javascript" charset="utf-8" src="<%=path%>/ueditor/umeditor.min.js"></script>
        <script type="text/javascript" src="<%=path%>/ueditor/lang/zh-cn/zh-cn.js"></script>
      
        <style media="screen">
            .bg-dym{
                background-image: url(<%=path%>/images/night.jpg);
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
                background-position: center center;
                min-height: 100%;
            }
        </style>
    </head>

    <body>

        <!-- 背景 顶部 -->
        <div class="bg-dym">

            <div class="container">
                <!-- 标题 开始 -->
                <div class="section bg-magin">
                    <div class="regard">
                        <h1 style="color:#eee; margin-top:1%;">个人设置 <small>中心</small></h1>
                    </div>
                </div>
                <!-- 标题 结束 -->

                <!-- 一级菜单开始   -->
                <div>
                    <a href="#Imformation" data-toggle="tab">
                        <div class="btn btn-m section-trans">
                            个人资料
                        </div>
                    </a>
                    <a href="#CoursesSetting" data-toggle="tab"  onclick="kcdz()">
                        <div class="btn btn-m section-trans">
                            课程定制
                        </div>
                    </a>
                    <a href="kczy" >
                        <div class="btn btn-m section-trans ">
                                 课程主页
                        </div>
                    </a>
                    <a href="<%=path%>/logout">
                        <div class="btn btn-m section-trans pull-right">
                            退出
                            <!-- 返回到主页 -->
                        </div>
                    </a>
                </div>
                <!-- 一级菜单结束   -->
                <br />
                <!-- 页面内容 开始 -->
                <div id="mySetting" class="tab-content">
                    <!-- 个人资料 的内容开始 -->
                    <div id="Imformation" class="tab-pane fade in active row">
                        <!--补充开始 -->
                        <!-- 列表栏 开始 -->
                        <div class="section bg-content bg-magin col-md-8 tab-content">
                            <div id="myBaseInformation" class="tab-pane fade in active">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">工号：</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" placeholder="请输入您的工号" id="gh">
                                        </div>
                                        <label class="col-sm-2 control-label">姓名：</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" placeholder="请输入您的姓名" id="name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >身份证号：</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" placeholder="请输入您的身份证号" id="idCard">
                                        </div>
                                        <label class="col-sm-2 control-label" >院系：</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" placeholder="请输入您所在院系" id="collage">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">姓别：</label>
                                        <div class="col-sm-3">
                                            <select class="form-control" id="sex">
                                                <option>女</option>
                                                <option>男</option>   
                                            </select>
                                        </div>
                                        <label class=" col-sm-2 control-label" >手机号：</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" placeholder="请输入您的手机号" id="phone">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">QQ：</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" placeholder="请输入您的QQ号" id="qq">
                                        </div>
                                        <label class="col-sm-2 control-label">职称：</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control"  id="postion">
                                        </div>
                                    </div>	
                                    <div class="form-group">
                                        <div>
                                            <button class="btn btn-default col-sm-offset-3 col-sm-2" onclick="bcxg()">保存修改</button>
                                        </div>
                                        <a href="#Password" data-toggle="tab">
                                            <button type="submit" class="btn btn-default col-sm-offset-2 col-sm-2">修改密码</button>
                                        </a>
                                    </div>
                                </form>
                            </div>
                            <!--密码页面开始-->
                            <div id="Password" class="tab-pane fade in">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label col-sm-offset-2">旧密码：</label>
                                        <div class="col-sm-3">
                                            <input type="password" class="form-control" placeholder="请输入您的旧密码" id="passPassward">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label col-sm-offset-2">新密码：</label>
                                        <div class="col-sm-3">
                                            <input type="password" class="form-control" placeholder="请输入您的新密码"  id="newPassward">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label col-sm-offset-2">再次输入：</label>
                                        <div class="col-sm-3">
                                            <input type="password" class="form-control" placeholder="请重复输入您的新密码"  id="newPassward1">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div>
                                            <button onclick="make()" class="btn btn-default col-sm-offset-3 col-sm-2">确认修改</button>
                                        </div>
                                        <a href="#myBaseInformation" data-toggle="tab">
                                            <button type="reset" class="btn btn-default col-sm-offset-1 col-sm-2">取消</button>
                                        </a>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- 列表栏 结束 -->
                        <!-- 侧边栏 开始 -->
                        <div class="section bg-content bg-magin col-md-4">
                            <ul class="nav nav-pills nav-stacked">
                                <li class="active">
                                    <a href="#myBaseInformation" data-toggle="tab">
                                        基本资料
                                    </a>
                                </li>
                                <li>
                                    <a href="#Password" data-toggle="tab">
                                        修改密码
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- 侧边栏 结束 -->
                        <!--密码页面结束-->
                        <!--补充结束 -->
                    </div>
                    <!-- 个人资料 的内容结束-->
                    <!-- 课程定制 的内容开始 -->
                    <div class="tab-pane fade in " id="CoursesSetting">
                        <div class="section bg-content bg-magin "background: url(<%=path%>/images/4.png)>
                             <div class="row">
                                 <div class="col-md-4" style="width: 15% ">
                                     <span style="color:red"> 我的开课课程</span><br><br>
                                     学期:<select id="sz_xq" class="test"></select><br><br>
                                      <!--课程树-->
                                            <ul id="tt" class="easyui-tree" data-options="method:'get',animate:true"></ul>
                                      <!--课程树结束-->
                                </div>
                                 <div class=" col-md-8 " id="tree-frame" style="margin-left: 1%;width: 84%;display: none">
                                     <a  data-toggle="tab" class="active btn-o" onclick="kcjs()">课程介绍</a>
                                     <a  data-toggle="tab" class="btn-o" onclick="kcdg()">课程大纲</a>
                                     <a  data-toggle="tab" class="btn-o" onclick="kcnr()">课程内容</a>
                                     <a  data-toggle="tab" class="btn-o" onclick="kcxs()">交流区</a>
                                     <hr />
                                     <div class="tab-pane fade in active" id="Artical">
                                         <!--课程介绍jsp-->
                                         <jsp:include page="teacher/kcjs.jsp"  />
                                     </div>
                                     <div class="tab-pane fade in " id="Treeline" style="display:none">
                                          <!--课程大纲jsp-->
                                         <jsp:include page="teacher/kcdg.jsp"  />
                                     </div>
				     <div class="tab-pane fade in " id="Web" style="display:none">
                                         <!--课程内容jsp-->
                                         <jsp:include page="teacher/kcnr.jsp"  /> 
                                     </div>
                                 </div>
                                     <!--学生信息div-->
                                 <div  class=" col-md-8 " id="student-message" style="margin-left:40px;display: none">
                                       <jsp:include page="teacher/mystudent.jsp"  /> 
                                 </div>    
                            </div>
                        </div>
                    </div>
                    <!-- 课程定制 的内容结束-->
                    <!-- 课程主页 的内容开始 -->
<!--                    <div class="tab-pane fade in " id="AccessSetting">
                        <div class="section bg-content bg-magin style" background: url(<%=path%>/images/4.png)>
                             <div class="row">
                                <div class="col-md-4">
                                    课程主页1

                                </div>

                                <div class=" col-md-8 " id="tree-frame">
                                    课程主页2
                                </div>
                            </div>
                        </div>
                    </div>-->
                    <!-- 课程主页 的内容结束-->
                </div>
                <!-- 页面内容 结束 -->

            </div>

            <br />
            <br />

            <!-- - -->
            <footer class="" style="color:#fff;">
                <div class="row">
                    <div class="col-md-12">
                        <h5 class="page-header">
                            <span class="text-muted">
                                <strong>Copyright © 2015 ● 河南大学软件学院</strong>
                            </span>
                        </h5>
                        <div class="row placeholders">
                            <div class="col-md-4 placeholder">
                                <h4>关于我们</h4>
                                <span class="text-muted">我们的主页:</span>
                                <span class="text-muted">
                                    <a href="index-us.html">LongYeh</a>
                                </span>
                            </div>

                            <div class="col-md-4 placeholder">
                                <h4>Feedback</h4>
                                <span class="text-muted">Email:
                                    <a href="mailto:llgtgx1@hotmail.com">llgtgx1@hotmail.com</a>
                                </span>
                                <br>
                                <span class="text-muted">帮助:
                                    <a href="#">帮助文档</a>
                                </span>
                            </div>

                            <div class="col-md-4 placeholder">
                                <h4>地址</h4>
                                <span class="text-muted">开封市 金明区金明大道</span>
                                <br />
                                <br />

                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
            </footer>
        </div>
    </body>
    <script>
        function bcxg(){
            alert("暂未开放!");
        }
        function kcdg(){
             $("#Web").hide();
             $("#Treeline").show();
             $("#student-message").hide();
             $("#Artical").hide();
             lookcourseDG();
        }
        function kcnr(){
             $("#Web").show();
             $("#Treeline").hide();
             $("#student-message").hide();
             $("#Artical").hide();
        }
        function kcjs(){
             $("#Web").hide();
             $("#Treeline").hide();
             $("#student-message").hide();
             $("#Artical").show(); 
             lookcourseJS();
        }
        
        function nolook(){
             $("#tree-frame").hide();
             $("#student-message").hide();
        }
        
        function look(){
            $("#tree-frame").show();
        }
        
        //学期下拉框
        function kcdz(){
             $.ajax({
                     type: "get",
                     url: "fhxq", 
                     success: function (data) {
                     document.getElementById("sz_xq").options.length = 0;
                     for (var i = 1; i < data.length; i++) {
                          document.getElementById("sz_xq").options.add(new Option(data[i], data[i]));
                        }
                      },
                      error: function () {
                         alert("学期加载失败!！请刷新页面!");
                       }
                });
        }
        var courseName;//课程name,初始化后在课程介绍课程大纲显示
        $(function(){
           $('.test').change(function(){
                 nolook();
                 var xueqi=document.getElementById("sz_xq").value;
                 $('#tt').tree({
                    url:'teacher/courselist?xueqi='+xueqi,
                    onClick: function(node){
                       
                        var a = node.children+"1";
                        var b = "undefined1";
                        if(a===b){
                           // alert("叶子节点");
                            //班级学生信息管理
                            $("#tree-frame").hide();
                            $("#student-message").show(); 
                             var b =$("#tt").tree("getParent", node.target); //父节点
                             classstudent(node.text,node.id,b.id,$("#sz_xq").val());
                        }else{
                           //alert("父节点");
                           //课程设置
                            look();
                            $("#student-message").hide(); 
                            $("#tree-frame").show(); 
                            courseName = node.text;
                            document.getElementById("kcdg_kcm").innerHTML = node.text+"课程大纲";
                            document.getElementById("kcdg_kcnr").innerHTML = node.text+"课程内容";
                            document.getElementById("kcdg_kcjs").innerHTML = node.text+"课程介绍";
                            lookcourseJS();
                            lookcourseDG();
                            lookmu();
                        }
                  }
               });
            });   
        });
         
         function lookmu(){
             var xueqi=document.getElementById("sz_xq").value;
             $.ajax({
                   type:"post",
                   url:'teacher/lookMulu?term='+xueqi+'&courseName='+courseName, 
                   success:function(data){
                         if(data==="1"){   
                               $('#tt1').tree({url:'teacher/scTree?term='+xueqi+'&courseName='+courseName});
                         }else{
                               $('#tt1').tree({url:'teacher/kcgs'});
                         }
                    }
               });
         }
        
         function classstudent(a,b,c,term){
               $('#dg_zs_stu').datagrid({
                title:" "+a,
                url: 'teacher/mystudent?classid='+b+'&course_id='+c+'&term='+term,
                loadMsg:'数据加载中请稍后……'
              });   
            }
        $(function(){
               grzl();
        });
    
        function grzl(){  
            $.ajax({
                     type: "post",
                     url: "teacher/tecme", 
                     success: function (data) {
                       $("#gh").attr("value",data[0]); 
                       $("#name").attr("value",data[1]); 
                       $("#idCard").attr("value",data[5]);
                       $("#collage").attr("value",data[3]); 
                       $("#postion").attr("value",data[4]);
                       $("#phone").attr("value",data[7]); 
                       $("#qq").attr("value",data[6]); 
                       if(data[2]==="男"){
                           document.getElementById("sex").options[1].selected="selected";
                       }else{
                           document.getElementById("sex").options[0].selected="selected"; 
                       } 
                      },
                     error: function () {
                        grzl();
                     }
                });  
        }
 
        function make(){
            var passPassward =hex_md5($("#passPassward").val());
            var passward= hex_md5($("#newPassward").val());
            var passward1=hex_md5($("#newPassward1").val());
            $.ajax({
                type:"get",
                url:"teacher/teaPassward",
                data:{passPassward:passPassward,passward:passward,passward1:passward1},
                success:function(data){
                    
                    
                },
                error:function(){
                    
                }
            });
        }
        
    </script>
</html>




