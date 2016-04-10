<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<%
//    将项目的根取出来，页面中不再使用相对路径
    String path = request.getContextPath();
    String sessionid =  session.getId();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link href="css/public.css" type="text/css" rel="stylesheet">
        <link href="css/houtai.css" type="text/css" rel="stylesheet">
        <link href="css/smartMenu.css" type="text/css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-theme.css">
        <link href="css/bootstrap.css">
        <link href="css/button.css">

<style type="text/css">
.navigation {
	position: absolute;
}

        </style>
       <!-- <script type="text/javascript" src="js/jquery.js"></script>-->
      <!--  <script type="text/javascript" src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>-->
      <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery-smartMenu-min.js"></script>
        <script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/contabs.js"></script>
        <script type="text/javascript" src="js/maintabs.js"></script>
        <script type="text/javascript">
            $(function(){
                $(".ad-menu").niceScroll({cursorborder:"0 none",cursorcolor:"#1a1a19",cursoropacitymin:"0",boxzoom:false});
            });
        </script>
        <title>Guest</title>
        </head>
        <body>
<div id="admin">
          <div class="ad-menu" id="ad-menu">
    <div class="ad-logo"><img src="images/m-logo.png" height="103" width="250"></div>
    <div class="row-fluid">
              <div class="span8"> </div>
            </div>
    <div class="ad-list">
              <ul>
                  ${Courselist}
     
      </ul>
            </div>
  </div>
          <div class="ad-comment-box" id="ad-comment">
    <div class="ad-top-comment">
              <div class="dd-ms">
                
        <div class="dd-top-left">
                  <div class="ad-change-btn"><a id="ad-list" href="#" class="scm ad-list-btn"></a></div>
                  <div class="ad-search-box clear">
            <div class="ad-search-sel">
                      <select>
                <option>计算机科学与技术</option>
                <option>软件工程</option>
                <option>网络工程</option>
              </select>
                    </div>
            <div class="ad-search-cha">
                      <input type="text" class="ad-search-input" placeholder="请输入你要查找的内容">
                      <input type="submit" class="scm ad-search-btn" value="">
                    </div>
          </div>
                </div>
        <div class="dd-top-right">
                  <div class="container-fluid">
            <div class="row-fluid">
           <div class="span12">
                <button class="btn btn-large btn-success" type="button" onclick="window.location.href='login'" >登陆</button>
              <!--  <button class="btn btn-large" type="button" onclick="window.open('login')"onclick="window.open('reg/teacher_register')"><a href="reg/teacher_register">注册</a></button>-->
                <button class="btn btn-large btn-warning" type="button" onclick="window.location.href='reg/student_teacher'">注册</button>
                
              
           <!-- <div id="container">
	<a href="login" class="button05">Login ?</a>
	<a href="reg/teacher_register" class="button05">Register ?</a>
    </div>-->
                    </div>
          </div>
                </div>
      </div>
            </div>
    
      
        <div class="main_content"  >
            
<iframe src="https://www.baidu.com/" id="iframepage" frameborder="0" scrolling="no" marginheight="0"  height="629px" width="100%" name="content" onLoad="iFrameHeight()"></iframe>
<script type="text/javascript" language="javascript">

    function iFrameHeight() {

        var ifm= document.getElementById("iframepage");

        var subWeb = document.frames ? document.frames["iframepage"].document :

ifm.contentDocument;

            if(ifm != null && subWeb != null) {

            ifm.height = subWeb.body.scrollHeight;

            }

    }

</script> 


		</div>	
          
  </div>
        </div>
<footer class="container-fluid" id="tree-footer" >
          <h5> <span class="text-muted stage-section stage-box"> <strong>Copyright ? 2015 ● 河南大学软件学院</strong> </span> </h5>
          <div class="stage-section row placeholders">
    <div class="col-md-4 placeholder">
              <h4>关于我们</h4>
              <span class="text-muted">我们的主页:</span> <span class="text-muted"> </span> </div>
    <div class="col-md-4 placeholder">
              <h4>Feedback</h4>
              <span class="text-muted">Email: </span> <br>
              <span class="text-muted">帮助: <a href="index-help.html">帮助文档</a> </span> </div>
    <div class="col-md-4 placeholder">
              <h4>地址</h4>
              <span class="text-muted">开封市 金明区金明大道</span> <br />
            </div>
  </div>
          <br />
        </footer>
</body>
</html>
