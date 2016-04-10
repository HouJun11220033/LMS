<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <h3 style="text-align: center;color: blue" id="kcdg_kcnr" ></h3>
        
        
        <div id="kcupload" class="easyui-window" title="课程内容或作业上传" closed="true" style="width:500px;height:300px">
             <div style="padding-left: 10%;padding-right: 10%;padding-top: 15%">
                    请选择左边目录，否则不能上传<br> 你可以上传word,pdf!<br><br>
                    <form  method="POST" enctype="multipart/form-data"  id="zlkc">
                        <input type="file"  name="file" id="sckc"><br>
                         课件  <input type="radio" name="teacher" value="1"/>      
                         作业  <input type="radio" name="teacher" value="2"  />   
                        <br><br>
                         描述:  <input type="text"  name="desc">
                        <input type="button" class="easyui-linkbutton" value="课程内容或作业上传" onclick="kc_submit()">
                    </form><br>
	    </div>  
            
        </div>
        
        
        <div style="width: 20%;float: left;">
        <ul id="tt1"  class="easyui-tree" data-options="
                                url:'teacher/kcgs',
				method: 'get',
				animate: true,                          
                                onContextMenu: function(e,node){
                                    e.preventDefault();
                                    $(this).tree('select',node.target);
                                    $('#menu').menu('show',{
                                       left: e.pageX,
                                       top: e.pageY
                                 });
                                }
	"></ul>
        </div>  
        
        <div id="menu" class="easyui-menu" style="width: 200px;">
            <div  onclick="bj_dqjd()">编辑当前节点名称</div>
            <div class="menu-sep"></div>
            <div id="m-closeother" onclick="gjd()">增加根节点</div>
            <div id="m-closeother" onclick="zj_zjds()">增加子节点</div>
            <div class="menu-sep"></div>
            <div id="m-close" onclick="save()">保存全部节点设置</div>
            <div id="m-closeother" onclick="rm()">查看节点id</div>
        </div>
        
        
        <div style="float: left;width: 80%;height: auto;">
        <div   style="min-height: 50px;border:1px solid #b8dcff" >div1</div>
        <br>
        <a class="easyui-linkbutton" style="padding-left: 2%;padding-right: 2%;margin-left: 10%" onclick="kcsc()">课件或作业上传</a>
        <a class="easyui-linkbutton"  style="padding-left:2%;padding-right: 2%;margin-left: 10%" onclick="kcdg_xz()">课件或作业下载</a>
        <a class="easyui-linkbutton" style="padding-left: 2%;padding-right: 2%;margin-left: 10%" onclick="kcdg_sc()">课件或作业删除</a>
     
        <div   style="min-height: 100px;margin-top: 50px;border:1px solid #b8dcff" >div2</div>
        </div>
        
        
        <script>

          function bj_dqjd(){ 
                $.messager.prompt('自定义界面', '输入课程的自定义章节', function(r){
                    var node = $('#tt1').tree('getSelected');
                    if (node){
                            $('#tt1').tree('update', {
                                    target: node.target,
                                    text: r
                            });
                    }
		});
          }
          
          function gjd(){
              alert("暂未开放!");
//              var node = $('#tt1').tree('getRoots');
//              if (node){
//                        $('#tt1').tree('insert', {
//                                before: node.target,
//                                data: {
//                                        attributes:'1',
//                                        text: 'node'
//                                }
//                        });
//                }
          }

          
  
          function zj_zjds(){
              var selected = $('#tt1').tree('getSelected');
              if(selected.attributes==="1"){//第一级菜单
                  $('#tt1').tree('append', {
                    parent: selected.target,
                    data: [{
                            attributes:'2',
                            text: '节点'
                           }]
                   });  
               }  
               if(selected.attributes==="2"){//第二级菜单
                   $('#tt1').tree('append', {
                    parent: selected.target,
                    data: [{
                            attributes:'3',
                            text: '节点'
                           }]
                   }); 
               }
               var a =selected.attributes+"",b = "undefined";
               if(a==="3"||a===b){
                   alert("已经不能添加了");
               }
             }
          
          function save(){
                var root=new Array();
                var saveDataAry=[];  
                var roots=$('#tt1').tree('getRoots'),children,i,j,m = 1, n = 1;
                for(i=0;i<roots.length;i++){
                    roots[i].id = i;//最外层id定义 
                    saveDataAry.push(roots[i]);  
                }
                for(i=0;i<roots.length;i++){
                   children=$('#tt1').tree('getChildren',roots[i].target);
                   for(j=0;j<children.length;j++){
                       var a = children[j].id+"",b = "undefined"; 
                       if(a===b){
                           children[j].id = children[j-1].id+1;
                       }
                   }   
                 }
                var node = $('#tt').tree('getSelected');  
                var courseName = node.text;
                var term = $("#sz_xq").val();
                 $.ajax({
                     type:"post",
                     url:'teacher/saveTree?term='+term+'&courseName='+courseName,
                     dataType:"json",
                     contentType:"application/json", 
                     data:JSON.stringify(saveDataAry), 
                     success:function(){
                         alert("保存成功!");
                     },
                     error:function(){
                         alert("ERROR!"); 
                     }
                 });
         }
          function rm(){
              var selected = $('#tt1').tree('getSelected');
              alert(selected.attributes+" id="+" "+selected.id);  
          }
          
          
           //课程上传课程提示框窗口
            function kcsc(){    
                 $('#kcupload').window('open');
            }
            
           //课程上传 
          function kc_submit(){
              if(checkfile()===true){
              }else{
                  return false;
              }
            var a1=null,a2="undefined",a3="undefined";
            var selected = $('#tt1').tree('getSelected'); 
            if(selected.id!==null){
                var a =selected.attributes+"",b = "undefined";
                if(a===""||a==="3"||a===b){
                    parent=$('#tt1').tree('getParent',selected.target);
                    root=$('#tt1').tree('getParent',parent.target);
                    a1 = root.id;
                    a2 = parent.id;
                    a3 = selected.id;
                    upload(a1,a2,a3);
                }else if(a==="2"){
//                    parent=$('#tt1').tree('getParent',selected.target);
//                    a1 = parent.id;
//                    a2 = selected.id;
//                    upload(a1,a2,a3);
                      alert("此节点不能上传，请选择第3节点");
                }else if(a==="1"){
//                    a1 = selected.id;
//                    upload(a1,a2,a3);
                      alert("此节点不能上传，请选择第3节点");
                }
            }     
          }
          
          function upload(a1,a2,a3){
             var chk = 3;
             var chkObjs = document.getElementsByName("teacher");
                for(var i=0;i<chkObjs.length;i++){
                    if(chkObjs[i].checked){
                        chk = i;
                        break;
                    }
            }
            if(chk===3){
                   alert("你没有选择上传类型!"); 
                   return true;
            } 
             var type;
             if(chk===0){
                 type = "课件";
             }else{
                 type = "作业";
             }
              var formData = new FormData($("#zlkc")[0]);
              var oFile = document.getElementById('sckc');
              var term = $("#sz_xq").val();
              var node = $('#tt').tree('getSelected');//当前节点  
              var courseName = node.text;
              $.ajax({
                        url: 'teacher/kcnr_submit?term='+term+'&courseName='+courseName+'&node1='+a1+'&node2='+a2+'&node3='+a3+'&type='+type,
                        type: 'POST',
                        data:formData,
                        async: false,
                        cache: false,
                        contentType: false,
                        processData: false,
                        success: function (returndata) {
                            if(returndata==="0"){
                                 alert("上传失败!只能上传word!");
                            }else{
                                  alert("上传成功!");
                            }                          
                        },
                        error: function (returndata) {
                            alert("上传失败!");
                        }
              });
          }
          
          
        //判断文件大小是否符合要求
        var maxsize = 2*1024*1024;//2M  
        var errMsg = "上传的附件文件不能超过2M！！！";  
        var tipMsg = "您的浏览器暂不支持计算上传文件的大小，确保上传文件不要超过2M，建议使用IE、FireFox、Chrome浏览器。";  
        var  browserCfg = {};  
        var ua = window.navigator.userAgent;  
        if (ua.indexOf("MSIE")>=1){  
            browserCfg.ie = true;  
        }else if(ua.indexOf("Firefox")>=1){  
            browserCfg.firefox = true;  
        }else if(ua.indexOf("Chrome")>=1){  
            browserCfg.chrome = true;  
        }  
        function checkfile(){  
            try{  
                var obj_file = document.getElementById("sckc");  
                if(obj_file.value===""){  
                    alert("请先选择上传文件");  
                    return;  
                }  
                var filesize = 0;  
                if(browserCfg.firefox || browserCfg.chrome ){  
                    filesize = obj_file.files[0].size;  
                }else if(browserCfg.ie){  
                    var obj_img = document.getElementById('tempimg');  
                    obj_img.dynsrc=obj_file.value;  
                    filesize = obj_img.fileSize;  
                }else{  
                    alert(tipMsg);  
                return;  
                }  
                if(filesize===-1){  
                    alert(tipMsg);  
                    return;  
                }else if(filesize>maxsize){  
                    alert(errMsg);  
                    return;  
                }else{  
                    return true;  
                }  
            }catch(e){  
                alert(e);  
            }  
        }  

          
          
          
</script>
