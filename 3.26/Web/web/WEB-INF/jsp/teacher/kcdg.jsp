
<%@page contentType="text/html" pageEncoding="UTF-8"%>
         <h3 style="text-align: center;color: blue" id="kcdg_kcm" ></h3><br>
         
    <div style="border:0px solid #CCC;"><span  id = "DGText"></span></div>
    <script type="text/plain" id="myCourseDaGangEditor" style="width: 800px;height:50px;">
    <p>在此处编辑课程大纲</p>
    </script>
    <br>
    <button  class="button button-raised button-royal" onclick="getContentDG()">预览</button>
    <button  class="button button-raised button-royal" onclick="QXDG()">撤销</button>
    <button id="DG" class="button button-raised button-royal" onclick="updateDG()">提交</button>
    <button class="button button-raised button-royal" onclick="lookcourseDG()">查看</button>
<script type="text/javascript">
    
        var ue = UM.getEditor('myCourseDaGangEditor');
         function getContentDG(){
         var arr = [];     
         arr.push(UM.getEditor('myCourseDaGangEditor').getContent());
         var value = UM.getEditor('myCourseDaGangEditor').getContent();
         //页面显示ueditor的内容
         UM.getEditor("myCourseDaGangEditor").setContent(value);
         document.getElementById("DGText").innerHTML=value;
        }
        
        
        function updateDG(){
            var node = $('#tt').tree('getSelected');//当前节点  
            var courseid = node.id;
            var term = $("#sz_xq").val();
           $.ajax({
               type:"post",
               data:{courseid:courseid,term:term},
               url:"teacher/lookisCourseMaster",
               success: function (data) {
                         if(data==="0"){
                            alert("你不是课程负责人，不能在此编辑课程大纲!");
                         }else{
                            if(window.confirm('你确定要更新课程大纲吗？')){  
                                var arr = [];     
                                arr.push(UM.getEditor('myCourseDaGangEditor').getContent());
                                addcourseoutlino(arr);
                                return true;
                            } 
                         }
                    },
                    error: function () {
                        CourseMaster();
                    }
           });   
            
        }
        
        //更新课程大纲
        function addcourseoutlino(arr){
             var arrinfor; 
             arrinfor = arr+"";
             var node = $('#tt').tree('getSelected');
             var courseid = node.id;
             var term = $("#sz_xq").val();
             $.ajax({
                    type: "post",
                    url: "teacher/addcourseoutline", 
                    data: {arrinfor: arrinfor,courseid:courseid,term:term}, 
                    success: function (data) {
                      if(data==="1"){
                          alert("更新成功!");
                          lookcourseDG();
                      }
                    },
                    error: function () {
                        alert("出错了，未知原因！");
                    }
                });
            
        }
        
         //返回课程大纲
        function lookcourseDG(){
            var node = $('#tt').tree('getSelected');
            var courseid = node.id;
            var term = $("#sz_xq").val();
            $.ajax({
                    type: "post",
                    url: "teacher/lookcourseDG", 
                    data: {courseid:courseid,term:term}, 
                    success: function (data) {
                        if(data==="null"){
                            document.getElementById("DGText").innerHTML="课程大纲暂未更新，等待课程负责人添加";
                        }else{
                            document.getElementById("DGText").innerHTML=data[0];
                        }    
                    },
                    error: function () {
                        lookcourseDG();
                    }
                });
        }
        
        function QXDG(){
            document.getElementById("DGText").innerHTML=""; 
            lookcourseDG();
        }
        
 </script>