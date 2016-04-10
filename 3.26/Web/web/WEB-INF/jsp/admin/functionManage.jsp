<%
    //    将项目的根取出来，页面中不再使用相对路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<%-- 
    Document   : functionManage
    Created on : 2016-3-12, 15:12:24
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
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/easyuicss/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/easyuicss/icon.css">
        <link rel="stylesheet" type="text/css" href="<%=path%>/css/images/tree_icons.png">
	<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
        <!--<script type="text/javascript" src="<%=path%>/js/jquery-1.7.min.js"></script>-->
	<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<table class="table">
				<thead>
					<tr>
						<th>
							全选
						</th>
						<th>
							功能编号
						</th>
						<th>
							功能名称
						</th>
						<th>
							功能url
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							1
						</td>
						<td>
							0001
						</td>
						<td>
							学生添加
						</td>
						<td>
							Default
						</td>
					</tr>
					<tr class="">
						<td>
							1
						</td>
						<td>
							0002
						</td>
						<td>
							学生删除
						</td>
						<td>
							Approved
						</td>
					</tr>
					<tr class="">
						<td>
							2
						</td>
						<td>
							0003
						</td>
						<td>
							教师删除
						</td>
						<td>
							Declined
						</td>
					</tr>
					<tr class="warning">
						<td>
							3
						</td>
						<td>
							0004    
						</td>
						<td>
							教师添加
						</td>
						<td>
							Pending
						</td>
					</tr>
					<tr class="info">
						<td>
							4
						</td>
						<td>
							0005
						</td>
						<td>
							教师更新
						</td>
						<td>
							Call in to confirm
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
    </body>
</html>
