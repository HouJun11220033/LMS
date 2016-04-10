<%-- 
    Document   : easyuify
    Created on : 2015-11-26, 16:00:58
    Author     : Administrator
--%>
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
        <meta charset="UTF-8">
        <title>Custom DataGrid Pager - jQuery EasyUI Demo</title>
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/easyuicss/easyui.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/easyuicss/icon.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/easyuicss/demo.css">
        <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=path%>/js/easyuijs/jquery.easyui.min.js"></script>
    </head>
    <body>
        <h2>未批准的教师信息</h2>
        <p>你可以批准删除临时教师信息.</p>
        <div  id='ls_js_xy1' style="padding:5px;height:auto">
            选择学院:<select  id="ls_js_xy" class="ls_js" style="width: 100px"></select>
            From: <input class="easyui-textbox" style="width:80px" id="min_ls_js">
            To: <input class="easyui-textbox" style="width:80px" id = "max_ls_js">
            <a  class="easyui-linkbutton" iconCls="icon-search" onclick="xh_lsjs_search()">Search</a>  
            <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit_lsjs_xuehao()">批量删除</a>  
        </div>
        <table id="dg" title="临时教师信息" style="width:900px;height:auto"
               data-options="rownumbers:true,singleSelect:false,pagination:true,toolbar:'#ls_js_xy1',fitColumns:true,method:'get'">
            <thead>
                <tr>
                    <th data-options="field:'ck',checkbox:true"></th>
                    <th data-options="field:'teacherSn',width:90,align:'left'">工号</th>
                    <th data-options="field:'teacherName',width:60,align:'left'">姓名</th>
                    <th data-options="field:'teacherSex',width:50,align:'left',formatter:ls_js_sex">性别</th>
                    <th data-options="field:'teacherIdcard',width:150,align:'left'">身份证号</th>
                    <th data-options="field:'teacherCollege',width:150,align:'left'">学院</th>
                    <th data-options="field:'teacherPosition',width:40,align:'left'">职称</th>
                    <th data-options="field:'teacherTel',width:100,align:'left'">手机号</th>
                    <th data-options="field:'teacherQq',width:100,align:'left'">qq</th>
                    <th data-options="field:'teacherId',hidden:'true',width:30,align:'left'" >序号</th>
                    <th width="80" data-options="field:'aa',formatter:go_ls_js_by">操作</th>
                </tr>
            </thead>
        </table>
        <br>

        <a  class="easyui-linkbutton" onclick="getSelected_js()">查看选中的信息</a>
        <a  class="easyui-linkbutton" onclick="getSelections_js()">查看选中的多个信息</a>
        <a class="easyui-linkbutton" onclick="ckls_jsxx()">加载所有学院教师信息</a>
        <a  class="easyui-linkbutton" onclick="pzjs()">批准选中的教师</a>
        <a class="easyui-linkbutton" onclick="scjs()">删除选中的教师</a>

        <script type="text/javascript">
            function ls_js_sex(val, row) {
                if (row.teacherSex) {
                    return '<span> 男</span>';
                } else {
                    return '<span> 女</span>';
                }
            }
            function go_ls_js_by(val, row) {
                return '<a href="#" onclick="sc_ls_js_by(\'' + row.teacherId + '\')">删除</a> ' + '<a href="#" onclick="pz_ls_js_by(\'' + row.teacherId + '\')">批准</a>  ';
            }
            function sc_ls_js_by(teacherId) {
                var jssz = new Array();
                var jssz = [];
                jssz[0] = teacherId;
                $.ajax({
                    type: "post", //提交方式
                    url: "sc", //提交的页面，方法名
                    data: {jssz: jssz}, //参数，如果没有，可以为null
                    success: function (data) {
                        alert("删除成功");
                        $('#dg').datagrid('reload'); // 重新载入当前页面数据  
                        ckls_jsxx();// 重新载入当前页面数据  
                    },
                    error: function () {
                        alert("未选择，请重新选择！");
                    }
                });
            }
            function pz_ls_js_by(teacherId) {
                var jssz = new Array();
                var jssz = [];
                jssz[0] = teacherId;
                $.ajax({
                    type: "post", //提交方式
                    url: "pzscjs", //提交的页面，方法名
                    data: {jssz: jssz}, //参数，如果没有，可以为null
                    success: function (data) {
                        alert("批准成功");
                        $('#dg').datagrid('reload'); // 重新载入当前页面数据  
                        ckls_jsxx();// 重新载入当前页面数据  
                    },
                    error: function () {
                        alert("未选择，请重新选择！");
                    }
                });
            }
//各个功能添加，删除
            $(function () {
                var pager = $('#dg').datagrid().datagrid('getPager'); // get the pager of datagrid
                pager.pagination({
                    buttons: [{
                            iconCls: 'icon-search',
                            handler: function () {
                                alert('search');
                            }
                        }, {
                            iconCls: 'icon-add',
                            handler: function () {
                                alert('add');
                            }
                        }, {
                            iconCls: 'icon-edit', handler: function () {
                                alert('edit');
                            }
                        }]
                });
            });
//                    < !--//add for 批量批准删除2015年11月26日 22:24:19-- >
            function getSelected_js() {
                var row = $('#dg').datagrid('getSelected');
                if (row) {
                    $.messager.alert('Info', row.teacherSn + ":" + row.teacherName + ":" + row.teacherCollege);
                }
            }
            function getSelections_js() {
                var ss = [];
                var rows = $('#dg').datagrid('getChecked');
                for (var i = 0; i < rows.length; i++) {
                    var row = rows[i];
                    ss.push('<span>' + row.teacherSn + ":" + row.teacherName + ":" + row.teacherCollege + '</span>');
                }
                $.messager.alert('Info', ss.join('<br/>'));
            }

            function ckls_jsxx() {
                $('#dg').datagrid({
                    url: 'fhjsxx',
                    loadMsg: '临时教师数据加载中请稍后……'
                });
            }
            //批量批准教师信息 
            function pzjs() {
                var rows = $('#dg').datagrid('getChecked');
                var jssz = new Array();
                var jssz = [];
                for (var n = 0; n < rows.length; n++) {
                    jssz[n] = rows[n].teacherId;
                }
                $.ajax({
                    type: "post", //提交方式
                    url: "pzscjs", //提交的页面，方法名
                    data: {jssz: jssz}, //参数，如果没有，可以为null
                    success: function (data) {
                        alert("批准成功");
                        ckls_jsxx();// 重新载入当前页面数据  
                    },
                    error: function () {
                        alert("未选择，请重新选择！");
                    }
                });
            }
            //批量删除教师信息 
            function scjs() {
                var rows = $('#dg').datagrid('getChecked');
                var jssz = new Array();
                var jssz = [];
                for (var n = 0; n < rows.length; n++) {
                    jssz[n] = rows[n].teacherId;
                }
                $.ajax({
                    type: "post", //提交方式
                    url: "sc", //提交的页面，方法名
                    data: {jssz: jssz}, //参数，如果没有，可以为null
                    success: function (data) {
                        alert("删除成功");
                        ckls_jsxx();// 重新载入当前页面数据  
                    },
                    error: function () {
                        alert("未选择，请重新选择！");
                    }
                });

            }

            $(function () {
                $.ajax({
                    type: "get",
                    url: "reg/hq_xy",
                    success: function (data) {
                        document.getElementById("ls_js_xy").options.length = 0;
                        for (var i = 0; i < data.length; i++) {
                            document.getElementById("ls_js_xy").options.add(new Option(data[i], data[i]));
                        }
                    },
                    error: function () {
                        alert("error!！");
                    }
                });
            });

            $(function () {
                $('.ls_js').change(function () {
                    var a = document.getElementById("ls_js_xy").value;
                    $('#dg').datagrid({
                        url: 'ls_js_xy_search?min=' + a,
                        loadMsg: '加载中请稍后……'
                    });
                });
            });
            function xh_lsjs_search() {
                //  alert( $('#min_ls_js').val()+"="+ $('#max_ls_js').val())
                $('#dg').datagrid({
                    url: 'ls_js_search?min=' + $('#min_ls_js').val() + "&max=" + $('#max_ls_js').val(),
                    loadMsg: '加载中请稍后……'
                });
            }

        </script>
    </body>
</html>