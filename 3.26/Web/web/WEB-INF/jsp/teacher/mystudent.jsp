<%-- 
    Document   : mystudent
    Created on : 2016-2-27, 13:17:38
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h4 style="text-align: center;color: blue">申请课程学生信息</h4>
        <br><br>
        <div id='xs'>
            <a href="javascript:void(0)" class="easyui-linkbutton" id="dc" data-options="iconCls:'icon-remove',plain:true" onclick="dc_xs()">导出</a>  
        </div>
         <table id="dg_zs_stu"   style="width:800px;height:auto"
               data-options="rownumbers:true,singleSelect:false,pagination:true,toolbar:'#xs',fitColumns:true,method:'get'">
            <thead>
                <tr>
                    <th data-options="field:'ck',checkbox:true"></th>
                    <th data-options="field:'studentSn',width:90,align:'left'">学号</th>
                    <th data-options="field:'studentName',width:60,align:'left'">姓名</th>
                    <th data-options="field:'studentSex',width:50,align:'left',formatter:zs_xs_sex">性别</th>
                    <th data-options="field:'studentIdcard',width:150,align:'left'">身份证号</th>
                    <th data-options="field:'studentCollege',align:'left'">学院</th>
                    <th data-options="field:'studentGrade',width:70,align:'left'">年级</th>
                    <th data-options="field:'studentTel',width:100,align:'left'">手机号</th>
                    <th data-options="field:'studentQq',width:100,align:'left'">qq</th>
                    <th data-options="field:'studentId',hidden:true,width:30,align:'left'" >序号</th>
                    <th data-options="field:'state',width:100,align:'left',formatter:go">状态</th>
                    <th width="80" data-options="field:'aa',formatter:go_xs_by">操作</th>
                </tr>
            </thead>
        </table>   
        <script>
           function go_xs_by(val, row){ 
               if(row.state===1){
                   return '<a href="#" onclick="sc_xs(\'' + row.studentId+ '\')">删除</a> ';     
               }else{
                   return '<a href="#" onclick="pz_xs(\'' + row.studentId+ '\')">批准</a>  ';    
               }
                 
            }
           function go(val, row){
                 if(row.state===1){
                    return '<span> 已批准</span>';
                 }else{
                    return '<span> 未批准</span>';   
                 }  
            }
           function zs_xs_sex(val,row){     
                 if(row.studentSex){
                    return '<span> 男</span>';
                 }else{
                    return '<span> 女</span>';   
                 } 
            }
            
            
           function sc_xs (id){
               if(window.confirm('你确定要删除此学生吗？')){  
                   var node = $('#tt').tree('getSelected');//当前节点
                   var b =$("#tt").tree("getParent", node.target); //父节点
                   var term = $('#sz_xq').val();
                   var stu_id = id;
                    $.ajax({
                        type:'post',
                        url:'teacher/scstu?term='+term+'&fjd_id='+b.id+'&zjd_id='+node.id+'&stu_id='+stu_id,
                        success:function(data){
                            alert(data);
                            $('#dg_zs_stu').datagrid('reload');
                        },
                        error:function(){             
                        }   
                    });              
                   return true;
                }   
           }
           
           function pz_xs(id){
              if(window.confirm('你确定要批准此学生吗？')){   
               var node = $('#tt').tree('getSelected');//当前节点
               var b =$("#tt").tree("getParent", node.target); //父节点
               var term = $('#sz_xq').val();
               var stu_id = id;
               $.ajax({
                   type:'post',
                   url:'teacher/pzstu?term='+term+'&fjd_id='+b.id+'&zjd_id='+node.id+'&stu_id='+stu_id,
                   success:function(data){
                       alert(data);
                       $('#dg_zs_stu').datagrid('reload');
                   }    
               });
             }
           }
           function dc_xs(){
               var node = $('#tt').tree('getSelected');//当前节点
               var b =$("#tt").tree("getParent", node.target); //父节点
               var term = $('#sz_xq').val();
               document.getElementById("dc").href='teacher/xz_xs_xx?term='+term+'&fjd_id='+b.id+'&zjd_id='+node.id;
//               $.ajax({
//                   type:'get',
//                   url:'teacher/xz_xs_xx?term='+term+'&fjd_id='+b.id+'&zjd_id='+node.id,
//                   success:function(data){
//                   }
//               });
           }
           
//           function pl_sc(){
//            var row = $('#dg_zs_stu').datagrid('getChecked');
//               var jssz = new Array();
//               var jssz = [];
//               for (var n = 0; n < row.length; n++) {
//                 jssz[n] = row[n].studentId;
//                 alert(jssz[n]);
//               }
//             
//           } 
//           
//           function pl_pz(){
//               var row = $('#dg_zs_stu').datagrid('getChecked');
//               var jssz = new Array();
//               var jssz = [];
//               for (var n = 0; n < row.length; n++) {
//                 jssz[n] = row[n].studentId;
//                 alert(jssz[n]);
//               }
//           }
    
        </script>
    </body>
</html>
