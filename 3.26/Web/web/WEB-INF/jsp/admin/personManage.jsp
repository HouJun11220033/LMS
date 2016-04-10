<%
    //    将项目的根取出来，页面中不再使用相对路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<%-- 
    Document   : peosonManage
    Created on : 2016-3-12, 16:49:28
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

        


    </head>
    <body>
        <h1>角色管理界面</h1>
        <div>
            <label><input id="hover" type="checkbox" checked=""> hover</label>
    <label><input id="striped" type="checkbox"> striped</label>
    </div>
<table id="table-style" data-url="student" data-search ="true"  data-striped = "true" data-pagination ="true" data-toggle="table" data-height="246">
    <thead>
    <tr>

        <th data-field="sn" data-width ="100" data-align ="center" data-sortable="true" >学号/工号</th>
        <th data-field="name" data-width ="100" data-align ="center" data-sortable="true">姓名</th>
        <th data-field="idCard" data-width ="100" data-align ="center" data-sortable="true">身份证号</th>
        <th data-field="sex" data-width ="100" data-align ="center" data-sortable="true">性别</th>
        <th data-field="position" data-width ="100" data-align ="center" data-sortable="true">职位</th>
        <th data-field="tel" data-width ="100" data-align ="center" data-sortable="true">手机号</th>
        <th data-field="qq" data-width ="100" data-align ="center" data-sortable="true">QQ</th>
    </tr>

    </thead>
</table>
<script>
    

    
    


        $('#hover, #striped').click(function() {
            var classes = 'table';
            if ($('#hover').prop('checked')) {
                classes = 'table table-hover';
            }
            $('#table-style').bootstrapTable('destroy')
                .bootstrapTable({
                    classes: classes,
                    striped: $('#striped').prop('checked')
                });
        });
  
    
</script>
       
    </body>
</html>
