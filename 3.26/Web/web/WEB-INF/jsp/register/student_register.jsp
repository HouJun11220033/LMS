<%-- 
    Document   : index-acount-3
    Created on : 2015-10-16, 10:57:34
    Author     : Administrator
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
//    将项目的根取出来，页面中不再使用相对路径
    String path = request.getContextPath();
    //request.setAttribute("Error", "密码错误"); 
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>注册</title>
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/stylesheet-base.css" />
        <script src="<%=path%>/js/jquery.js"></script>
        <script src="<%=path%>/js/bootstrap.js"></script>
        <script  src="<%=path%>/js/md5.js"></script>
        <style media="screen">
            .btn-default{
                color: gray;
            }
        </style>
    </head>
    <body  class="hidden-x">
        <div class="container ">
            <div class="row">
                <div class="col-md-3"></div>

                <div class="col-md-6">
                    <form class="form-horizontal tab-content" method="post" name="form_login" action="student_register_message" >
                        <div class="" id="account-title">
                            <h1 class="page-header stage-box">
                                注册<span></span>
                            </h1>

                            <p id="yc">${requestScope.Error}</p> 
                        </div>
                        <div  class="tab-pane fade in active" id="login-0">
                            <div>

                                <!-- 学号 -->
                                <div class="input-group">
                                    <span class="input-group-addon">学号：</span>
                                    <input type="text" id="idcard" name="idCard" class="form-control" placeholder="请输入您的学号 " maxlength="16" onblur="verifyText('idcard', 'idcardMsg');">
                                </div>      
                                <span id="idcardMsg" class="fontTips"></span>


                                <!-- 姓名 -->
                                <div class="input-group">
                                    <span class="input-group-addon">姓名：</span>
                                    <input type="text" id="name" name="name" class="form-control" placeholder="请输入您的姓名" maxlength="16" onblur="verifyText('name', 'nameMsg');" onfocus="initMessage('nameMsg');" />
                                </div>
                                <span id="nameMsg" class="fontTips"></span>

                                <!-- 身份证号 -->
                                <div class="input-group">
                                    <span class="input-group-addon">身份证号：</span>
                                    <input type="text" id="myIDNum" name="myIDNum" class="form-control" placeholder="请再次输入您的身份证号" me="pn" onblur="verifyText('myIDNum', 'myIDNumMsg');
                                           " >
                                </div>
                                <span id="myIDNumMsg" class="fontTips"></span>
                                <div class="input-group">
                                    <span class="input-group-addon">性别：</span>
                                    <select class="form-control" required="required" name="xingbie" >                                       
                                        <option value="女" type='hide'>女</option>
                                        <option value="男" type='hide' selected="">男</option>                                     
                                    </select>
                                </div>
                                <span id="myIDNumMsg" class="fontTips"></span>
                                <!-- 年级 -->
                                <div class="input-group">
                                    <span class="input-group-addon">年级：</span>
                                    <select class="form-control" required="required" name="niji" id="fhnj">
                                        <option value="">
				          请选择
                                        </option>
                                    </select>
                                </div>
                                <span class="fontTips"></span>

                                <!-- 院系 -->
                                <div class="input-group">
                                    <span class="input-group-addon">院系：</span>
                                    <select class="form-control" name="xueyuan" id="szxy">
                                        <option value="">
				          请选择
                                        </option>
                                    </select>
                                </div>
                                <span class="fontTips"></span>

                                <!-- 手机号码 -->
                                <div class="input-group">
                                    <span class="input-group-addon">手机：</span>
                                    <input type="text" id="myPhone" name="myPhone" class="form-control" placeholder="请输入您常用的手机号码" me="pn" onblur="verifyText('myPhone', 'myPhoneMsg');" >
                                </div>
                                <span id="myPhoneMsg" class="fontTips"></span>
                                <!-- QQ -->
                                <div class="input-group">
                                    <span class="input-group-addon">扣扣：</span>
                                    <input type="text" id="myQq" name="myQq" class="form-control" placeholder="请输入您的QQ号" me="qq" onblur="verifyText('myQq', 'myQqMsg');">
                                </div>
                                <span id="myQqMsg" class="fontTips"></span>

                                <!-- 密码 -->
                                <div class="input-group">
                                    <span class="input-group-addon">密码：</span>
                                    <input type="password" name="password_plain" id="passwFrist" class="form-control" placeholder="请输入密码" me="psw" onblur="verifyText('passwFrist', 'passwFristMsg');
                                           " onfocus="initMessage('passwFristMsg');">
                                    <input type="hidden" name="password_md5">
                                </div>
                                <span id="passwFristMsg" class="fontTips"></span>


                                <br>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <a id="fornext" onclick="fornext()" data-toggle="tab" href="#"><div class="btn-card btn-danger col-md-6">下一步</div></a>
                                        <a href="student_teacher" class="btn-card btn-default col-md-3" >
                                            重新选择角色
                                        </a>
                                        <a href="index1" class="btn-card btn-default col-md-3" >
                                            返回登陆界面
                                        </a>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="login-1">

                            <!-- 学号 -->
                            <div class="input-group">
                                <span class="input-group-addon">学号：</span>
                                <input type="text" id="idcardCheck" class="form-control" placeholder="请再次输入您的学号 " maxlength="16" onblur="verifyText('idcardCheck', 'idcardCheckMsg');">
                            </div>
                            <span id="idcardCheckMsg" class="fontTips"></span>


                            <!-- 姓名 -->
                            <div class="input-group">
                                <span class="input-group-addon">姓名：</span>
                                <input type="text" id="nameCheck" class="form-control" placeholder="请再次输入您的姓名" width="180px" height="30px" size="25" maxlength="16" onblur="verifyText('nameCheck', 'nameCheckMsg');">
                            </div>
                            <span id="nameCheckMsg" class="fontTips"></span>

                            <!-- 手机号码 -->
                            <div class="input-group">
                                <span class="input-group-addon">身份证号：</span>
                                <input type="text" id="myIDNumCheck" class="form-control" placeholder="请再次输入您的身份证号" me="pn" onblur="verifyText('myIDNumCheck', 'myIDNumCheckMsg');
                                       ">
                            </div>
                            <span id="myIDNumCheckMsg" class="fontTips"></span>

                            <!-- 密码 -->
                            <div class="input-group">
                                <span class="input-group-addon">密码：</span>
                                <input type="password" id="passwLast" class="form-control" placeholder="请再次输入您的密码" me="psw" onblur="verifyText('passwLast', 'passwLastMsg');
                                       ">
                            </div>
                            <span id="passwLastMsg" class="fontTips"></span>


                            <!-- 验证码 -->
                            <div class="input-group">
                                <span class="input-group-addon">验证码：</span>
                                <td class="content">
                                    <input id="ccd" name="ccd" class="ui-widget-content easyui-validatebox" type="text" maxlength="4"  
                                           data-options="required:true,validType:'chk_code',missingMessage:'请输入验证码',tipPosition:'left' "
                                           title="验证码区分不大小写，看不清楚请单击图片" >
                                    <img id="ccdImage" style="border:0" title="看不清楚请单击图片" onclick="reload()" >

                                    <!--</td>-->
                            </div>
                            <span id="checkcodeMsg" class="fontTips"></span>
                            <br>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div onclick="mysubmit()" type="submit" class="btn-card btn-danger col-md-9">注册</div>
                                    <a href="#login-0" data-toggle="tab" class="btn-card btn-default col-md-3" >
                                        上一步
                                    </a>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
                <div class="col-md-3"></div>
                <script>
                    $('#ccdImage').attr("src", "<%=path%>/reg/createImage?dt=" + Math.random()); //随机生成验证码

                    function reload() {
                        $('#ccdImage').attr("src", "<%=path%>/reg/createImage?dt=" + Math.random()); //随机生成验证码
                    }

                    var statusBase = [0, 0, 0, 0, 0, 0];
                    var statusCheck = [0, 0, 0, 0, 0];
                    function checknull() {
                        var s = 0;
                        for (var t in statusCheck) {
                            if (statusCheck[t] === 1) {
                                s++;
                            }
                        }
                        if (s === 4)
                            return true;
                        else
                            return false;
                    }
                    //加密代码
                    function fornext()
                    {
                        var k = 0;
                        for (var i in statusBase) {
                            if (statusBase[i] === 1) {
                                k++;
                            }
                        }
                        if (k === 6) {
                            $('#fornext').attr("href", "#login-1");
                        } else {
                            $('#fornext').attr("href", "#");
                            alert("请填写完成并且检查无误后再行下一步");
                        }

                    }
                    function mysubmit()
                    {

                        if (checknull()) {
                            document.form_login.password_md5.value = hex_md5(document.getElementById('passwLast').value);
                            var jssz = document.getElementById("idcard").value;
                            $.ajax({
                                type: "get", //提交方式
                                url: "cjxh", //提交的页面，方法名
                                data: {jssz: jssz}, //参数，如果没有，可以为null
                                success: function (data) {
                                    if (parseInt(data) === 1) {
                                        if (window.confirm("你是否要注册? 注册后带着你的注册信息找教务员!!!")) {
                                            document.form_login.submit();
                                        }
                                    } else {
                                        document.form_login.submit();
                                    }
                                },
                                error: function () {
                                    alert("error!！");
                                }
                            });

                        } else {
                            alert("请填写完成并且检查无误后再行提交");
                        }

                    }
                    /**构造&&实例化*********************************************************************************************************/
                    /*验证和提示*/
                    function verifyObject(targetParm) { //targetParm为待验证的消息
                        this.target = targetParm;
                    }
                    ;
                    verifyObject.prototype.trim = function () {
                        var pattern = /(^\s*)|(\s*$)/g;
                        this.target = this.target.replace(pattern, "");
                    };
                    verifyObject.prototype.isEqual = function (anyParm) {
                        if (this.target === anyParm) {
                            return true;
                        } else {
                            return false;
                        }
                    };
                    verifyObject.prototype.isPattern = function (patternParm) {
                        var pattern = new RegExp(patternParm);
                        var flag = pattern.test(this.target);
                        if (flag) {
                            return true;
                        } else {
                            return false;
                        }
                    };

                    function verifyText(checkText, checkMessage) {
                        var text = document.getElementById(checkText).value;
                        var verifyObj = new verifyObject(text); //实例化对象
                        verifyObj.trim();
                        if (checkText === "name") {
                            $('#yc').hide();//jQuery 代码该方法隐藏所有 <p> 元素
                            if (!(verifyObj.isPattern(/^[a-z A-Z 0-9 \u4e00-\u9fa5]{2,16}$/))) {
                                document.getElementById(checkMessage).innerHTML = "用户名有误";
                                statusBase[0] = 0;
                            } else {
                                statusBase[0] = 1;
                                document.getElementById(checkMessage).innerHTML = "";
                            }
                        } else if (checkText === "nameCheck") {
                            if (!(verifyObj.isEqual(document.getElementById("name").value))) {
                                document.getElementById(checkMessage).innerHTML = "用户名前后不一致";
                            } else {
                                statusCheck[0] = 1;
                                document.getElementById(checkMessage).innerHTML = "";
                            }
                        } else if (checkText === "idcard") {
                            if (!(verifyObj.isPattern(/^[0-9 _]{6,18}$/))) {
                                document.getElementById(checkMessage).innerHTML = "学号有误";
                                statusBase[1] = 0;
                            } else {
                                statusBase[1] = 1;
                                document.getElementById(checkMessage).innerHTML = "";
                            }
                        } else if (checkText === "idcardCheck") {
                            if (!(verifyObj.isEqual(document.getElementById("idcard").value))) {
                                document.getElementById(checkMessage).innerHTML = "学号前后不一致";
                            } else {
                                statusCheck[1] = 1;
                                document.getElementById(checkMessage).innerHTML = "";
                            }
                        } else if (checkText === "myIDNum") {
                            if (!(verifyObj.isPattern(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/g))) {
                                document.getElementById(checkMessage).innerHTML = "身份证号有误";
                                statusBase[2] = 0;
                            } else {
                                statusBase[2] = 1;
                                document.getElementById(checkMessage).innerHTML = "";
                            }
                        } else if (checkText === "myIDNumCheck") {
                            if (!(verifyObj.isEqual(document.getElementById("myIDNum").value))) {
                                document.getElementById(checkMessage).innerHTML = "身份证号前后不一致";
                            } else {
                                statusCheck[2] = 1;
                                document.getElementById(checkMessage).innerHTML = "";
                            }
                        } else if (checkText === "passwFrist") {
                            if (!(verifyObj.isPattern(/^[a-z A-Z 0-9 _]{6,18}$/))) {
                                document.getElementById(checkMessage).innerHTML = "密码有误";
                                statusBase[3] = 0;
                            } else {
                                statusBase[3] = 1;
                                document.getElementById(checkMessage).innerHTML = "";
                            }
                        } else if (checkText === "passwLast") {
                            if (!(verifyObj.isEqual(document.getElementById("passwFrist").value))) {
                                document.getElementById(checkMessage).innerHTML = "密码前后不一致";
                            } else {
                                statusCheck[3] = 1;
                                document.getElementById(checkMessage).innerHTML = "";
                            }
                        } else if (checkText === "myPhone") {
                            if (!(verifyObj.isPattern(/^1\d{10}$/g))) {
                                document.getElementById(checkMessage).innerHTML = "手机号有误";
                                statusBase[4] = 0;
                            } else {
                                statusBase[4] = 1;
                                document.getElementById(checkMessage).innerHTML = "";
                            }
                        } else if (checkText === "myQq") {
                            if (!(verifyObj.isPattern(/^[0-9]{6,12}$/))) {
                                document.getElementById(checkMessage).innerHTML = "Qq号有误";
                                statusBase[5] = 0;
                            } else {
                                statusBase[5] = 1;
                                document.getElementById(checkMessage).innerHTML = "";
                            }
                        } else if (checkText === "email") {
                            if (!(verifyObj.isPattern(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/))) {
                                document.getElementById(checkMessage).innerHTML = "邮箱格式不对";
                            } else {
                                document.getElementById(checkMessage).innerHTML = "";
                            }
                        } else if (checkText === "checkcodeText") {
                            if (!(verifyObj.isEqual(document.getElementById("checkcode").value))) {
                                document.getElementById(checkMessage).innerHTML = "验证码输入错误";
                            } else {
                                statusCheck[4] = 1;
                                document.getElementById(checkMessage).innerHTML = "";
                            }
                        }


                    }

                    function initMessage(objId) {
                        var obj = document.getElementById(objId); //实例化对象obj
                        if (objId == "nameMsg") {
                            obj.innerHTML = "<span style='color:green'>用户名必须为2-16位的字母,数字或汉字构成</span>";
                        } else if (objId == "passwFristMsg") {
                            obj.innerHTML = "<span style='color:green'>密码必须为6-18位的字母,数字或下划线构成</span>";
                        }
                    }
                    $(function () {
                        $.ajax({
                            type: "get", //提交方式
                            url: "hq_xy", //提交的页面，方法名
                            success: function (data) {
                                document.getElementById("szxy").options.length = 0;
                                for (var i = 0; i < data.length; i++) {
                                    document.getElementById("szxy").options.add(new Option(data[i], data[i]));
                                }
                            },
                            error: function () {
                                alert("error!！");
                            }
                        });
                         $.ajax({
                              type: "get", //提交方式
                              url: "fhnj", //提交的页面，方法名
                              success: function (data) {
                                  document.getElementById("fhnj").options.length = 0;
                                  for (var i = 0; i < data.length; i++) {
                                      document.getElementById("fhnj").options.add(new Option(data[i], data[i]));
                                  }
                              },
                              error: function () {
                                  alert("error!！");
                              }
                          });
                    });
                </script>

            </div>
        </div>
    </body>
</html>
