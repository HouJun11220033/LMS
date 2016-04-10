/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.henu.rjxy.lms.controller;

import cn.edu.henu.rjxy.lms.dao.StudentDao;
import static cn.edu.henu.rjxy.lms.dao.StudentDao.getStudentById;
import cn.edu.henu.rjxy.lms.dao.TeacherDao;
import cn.edu.henu.rjxy.lms.dao.TermCourseDao;
import cn.edu.henu.rjxy.lms.dao.TermCourseInfoDao;
import cn.edu.henu.rjxy.lms.model.AutoCourseNode;
import cn.edu.henu.rjxy.lms.model.Mystudent;
import cn.edu.henu.rjxy.lms.model.NewClass;
import cn.edu.henu.rjxy.lms.model.PageBean;
import cn.edu.henu.rjxy.lms.model.StuSelectResult;
import cn.edu.henu.rjxy.lms.model.Student;
import cn.edu.henu.rjxy.lms.model.Teacher;
import cn.edu.henu.rjxy.lms.model.TeacherCourseResult;
import cn.edu.henu.rjxy.lms.model.TeacherMyclassstudent;
import cn.edu.henu.rjxy.lms.model.Tree3;
import cn.edu.henu.rjxy.lms.server.DocConverter;
//import com.jacob.activeX.ActiveXComponent;
//import com.jacob.com.Dispatch;
//import com.jacob.com.Variant;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import static org.apache.poi.hssf.usermodel.HeaderFooter.file;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


/**
 *
 * @author Name : liubingxu Email : 2727826327qq.com
 */
@Controller
@RequestMapping("/teacher/")
public class Tea_Controller {
       
    
     //教师课程树
       @RequestMapping(value = "courselist",method = RequestMethod.GET)
     public @ResponseBody List<TeacherCourseResult> courselist(HttpServletRequest request,@RequestParam ("xueqi") String xueqi) throws UnsupportedEncodingException{
      request.setCharacterEncoding("utf-8");
       String sn=getCurrentUsername();
       Teacher tec = TeacherDao.getTeacherBySn(sn);
       System.out.println(tec.getTeacherSn());
       return  TeacherDao.getTeacherCourseByTermSn(Integer.parseInt(xueqi), tec.getTeacherSn());          
    }
     
     
      //个人信息显示
      @RequestMapping("tecme")
      public @ResponseBody String[] teccme(){
         String [] a = new String [8];
         String sn=getCurrentUsername();
         Teacher tec = TeacherDao.getTeacherBySn(sn);
         a[0] = tec.getTeacherSn();
         a[1] = tec.getTeacherName();
         a[2] = tec.getTeacherSex()?"男":"女";
         a[3] = tec.getTeacherCollege();
         a[4] = tec.getTeacherPosition();
         a[5] = tec.getTeacherIdcard();
         a[6] = tec.getTeacherQq();
         a[7] = tec.getTeacherTel();
         return a;
      }
      
      //修改密码
       @RequestMapping("teaPassward")
      public @ResponseBody String teaPassward(HttpServletRequest request){
           System.out.println("uri："+getFileFolder(request)); 
         return "1";
      }
      
      //班级学生信息显示
      @RequestMapping("mystudent")
      public @ResponseBody JSONObject mystudent(HttpServletRequest request,HttpServletResponse response){
          int pc = Integer.parseInt(request.getParameter("page"));
          int ps = Integer.parseInt(request.getParameter("rows"));
          int classid = Integer.parseInt(request.getParameter("classid"));
          int course_id = Integer.parseInt(request.getParameter("course_id"));
          int term = Integer.parseInt(request.getParameter("term"));
          String sn=getCurrentUsername();
          Teacher tec = TeacherDao.getTeacherBySn(sn);
          int tec_id = tec.getTeacherId();
          System.out.println("classid="+classid+"\n"+"course_id="+course_id+"\n"+"term="+term+"\n"+"tec_id="+tec_id);
          int trem_courseid = TermCourseDao.getTermCourseId(term, course_id, classid, tec_id);
          System.out.println(trem_courseid+"trem_courseid");
        
          PageBean<StuSelectResult> mystudent =TeacherDao.getStuSelectByTermCourseId(trem_courseid,pc,ps);
          List<Mystudent> beanList =  new LinkedList();
          for(int i = 0;i<mystudent.getBeanList().size();i++){   
           StuSelectResult a = (StuSelectResult)mystudent.getBeanList().get(i);
           Mystudent student = new Mystudent();
           student.setState(a.getState());
           student.setStudentCollege(getStudentById(a.getStuid()).getStudentCollege());
           student.setStudentGrade(getStudentById(a.getStuid()).getStudentGrade());
           student.setStudentId(a.getStuid());
           student.setStudentName(getStudentById(a.getStuid()).getStudentName());
           student.setStudentIdcard(getStudentById(a.getStuid()).getStudentIdcard());
           student.setStudentQq(getStudentById(a.getStuid()).getStudentQq());
           student.setStudentSex(getStudentById(a.getStuid()).getStudentSex());
           student.setStudentSn(getStudentById(a.getStuid()).getStudentSn());
           student.setStudentTel(getStudentById(a.getStuid()).getStudentTel());
           beanList.add(student);
          }
          //创建需要的类型     
          TeacherMyclassstudent b = new TeacherMyclassstudent();
          b.setPc(pc);
          b.setPs(ps);
          b.setTr(mystudent.getTr());
          b.setBeanList(beanList);
          Map<String,Object> jg = new HashMap<>();
          jg.put("total", b.getTr()); 
          jg.put("rows",b.getBeanList());
          System.out.println("mystudent");
          return JSONObject.fromObject(jg);
      }
      //删除班级学生
      @RequestMapping("scstu")
      public @ResponseBody String[] scstu(HttpServletRequest request,HttpServletResponse response){
          String [] a =new String [1];
          a[0] = "删除成功";
          int term = Integer.parseInt(request.getParameter("term"));
          int classid = Integer.parseInt(request.getParameter("zjd_id"));
          int course_id = Integer.parseInt(request.getParameter("fjd_id"));
          int Stu_id = Integer.parseInt(request.getParameter("stu_id"));
          System.out.println("term = "+term+" classid=" + classid+" course_id="+course_id+" stu_id = "+Stu_id);
          String sn=getCurrentUsername();
          Teacher tec = TeacherDao.getTeacherBySn(sn);
          int tec_id = tec.getTeacherId();
          int trem_courseid = TermCourseDao.getTermCourseId(term, course_id, classid, tec_id);
          System.out.println("term_courseid= "+trem_courseid);
          //学生ｉd和termcourseid
          TeacherDao.updateStudentCourse(Stu_id, trem_courseid, true);
          return a;
      }
      //批准班级学生
       @RequestMapping("pzstu")
      public @ResponseBody String[] pzstu(HttpServletRequest request,HttpServletResponse response){
          String [] a =new String [1];
          a[0] = "批准班级学生成功";
          int term = Integer.parseInt(request.getParameter("term"));
          int classid = Integer.parseInt(request.getParameter("zjd_id"));
          int course_id = Integer.parseInt(request.getParameter("fjd_id"));
          int Stu_id = Integer.parseInt(request.getParameter("stu_id"));
          System.out.println("term = "+term+" classid=" + classid+" course_id="+course_id+" stu_id = "+Stu_id);
          String sn=getCurrentUsername();
          Teacher tec = TeacherDao.getTeacherBySn(sn);
          int tec_id = tec.getTeacherId();
          int trem_courseid = TermCourseDao.getTermCourseId(term, course_id, classid, tec_id);
          System.out.println("term_courseid= "+trem_courseid);
          //学生ｉd和termcourseid
          TeacherDao.updateStudentCourse(Stu_id, trem_courseid, false);
          return a;
      }
      
        //导出学生信息,getStuSelectByTermCourseId(trem_courseid,1,300);1表示第一页．300表示最大学生数
    @RequestMapping("xz_xs_xx")
    public @ResponseBody String daochuxuesheng(HttpServletRequest request, HttpServletResponse response) throws IOException{
          int classid = Integer.parseInt(request.getParameter("zjd_id"));
          int course_id = Integer.parseInt(request.getParameter("fjd_id"));
          int term = Integer.parseInt(request.getParameter("term"));
          String sn=getCurrentUsername();
          Teacher tec = TeacherDao.getTeacherBySn(sn);
          int tec_id = tec.getTeacherId();
          int trem_courseid = TermCourseDao.getTermCourseId(term, course_id, classid, tec_id);
          System.out.println(trem_courseid+"trem_courseid");
          PageBean<StuSelectResult> mystudent =TeacherDao.getStuSelectByTermCourseId(trem_courseid,1,300);
        HttpSession session = request.getSession();
        session.setAttribute("state", null);
        // 生成提示信息，  
        response.setContentType("application/vnd.ms-excel");
        String codedFileName;
        codedFileName = "正式学生信息";
        OutputStream fOut = null;
        try {
            // 进行转码，使其支持中文文件名  
            codedFileName = java.net.URLEncoder.encode("中文", "UTF-8");
            response.setHeader("content-disposition", "attachment;filename=" + "student_messsage" + ".xls");
            HSSFWorkbook wb = new HSSFWorkbook();
            // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
            HSSFSheet sheet = wb.createSheet("导出的表");
            // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
            HSSFRow row = sheet.createRow((int) 0);
            // 第四步，创建单元格，并设置值表头 设置表头居中  
            HSSFCellStyle style = wb.createCellStyle();
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式 
            HSSFCell cell = row.createCell((short) 0);
            cell.setCellValue("学号");
            cell.setCellStyle(style);
            cell = row.createCell((short) 1);
            cell.setCellValue("姓名");
            cell.setCellStyle(style);
            cell = row.createCell((short) 2);
            cell.setCellValue("身份证号");
            cell.setCellStyle(style);
            cell = row.createCell((short) 3);
            cell.setCellValue("年级");
            cell.setCellStyle(style);
            cell = row.createCell((short) 4);
            cell.setCellValue("性别");
            cell.setCellStyle(style);
            cell = row.createCell((short) 5);
            cell.setCellValue("学院");
            cell.setCellStyle(style);
            cell = row.createCell((short) 6);
            cell.setCellValue("电话");
            cell.setCellStyle(style);
            cell = row.createCell((short) 7);
            cell.setCellValue("qq");
            cell.setCellStyle(style);
            for (int i = 0; i < mystudent.getBeanList().size(); i++) {
                StuSelectResult a = (StuSelectResult)mystudent.getBeanList().get(i);
                System.out.println(getStudentById(a.getStuid()).getStudentSn());
                row = sheet.createRow((int) i + 1);
                row.createCell((short) 0).setCellValue(getStudentById(a.getStuid()).getStudentSn());
                row.createCell((short) 1).setCellValue(getStudentById(a.getStuid()).getStudentName());
                row.createCell((short) 2).setCellValue(getStudentById(a.getStuid()).getStudentIdcard());
                row.createCell((short) 3).setCellValue(getStudentById(a.getStuid()).getStudentGrade());
                row.createCell((short) 4).setCellValue((getStudentById(a.getStuid()).getStudentSex())?("男"):("女"));
                row.createCell((short) 5).setCellValue(getStudentById(a.getStuid()).getStudentCollege());
                row.createCell((short) 6).setCellValue(getStudentById(a.getStuid()).getStudentTel());
                row.createCell((short) 7).setCellValue(getStudentById(a.getStuid()).getStudentQq());

            }

            fOut = response.getOutputStream();
            wb.write(fOut);
        } catch (UnsupportedEncodingException e1) {
        } catch (Exception e) {
        } finally {
            fOut.flush();
            fOut.close();
            session.setAttribute("state", "open");
        }
        System.out.println("学生文件生成...");
        return "1";
    
    }
    

//    
//       //上传
// @RequestMapping(value = "course_submit",method = RequestMethod.POST)
//  public @ResponseBody String course_submit(HttpServletRequest request,@RequestParam("desc") String desc,@RequestParam("file") MultipartFile file ) throws IOException, Exception {
//      String sn=getCurrentUsername();
//      Teacher tec = TeacherDao.getTeacherBySn(sn);
//      String tec_sn= tec.getTeacherSn();
//      String tec_name = tec.getTeacherName();
//      String collage = tec.getTeacherCollege();
//      String term = request.getParameter("term");
//      String courseName = request.getParameter("courseName");
//      System.out.println(courseName +" "+collage+" "+term);
//      System.out.println("file.getContentType():"+file.getContentType());
//      System.out.println("file.getName():"+file.getName());
//      System.out.println("file.getOriginalFilename():"+file.getOriginalFilename());
//      System.out.println("file.getInputStream:s"+file.getInputStream());
//      System.out.println("file size:"+file.getSize());
//      System.out.println("desc : "+desc);//课程介绍描述
//      String []a = new String[1];
//      a[0] = "课程介绍";
//      String fineName = file.getOriginalFilename();
//      String prefix=fineName.substring(fineName.lastIndexOf(".")+1);
//      System.out.println(prefix);
//      if(!prefix.endsWith("docx")){
//          return "0";
//      }
//      //教师目录   .../学期/学院／教师工号／教师姓名／课程名称 
//      File f = new File(getFileFolder(request)+term +"/"+collage+"/"+tec_sn+"/"+tec_name+"/"+courseName+"/"+a[0]+"/");
//      //判断目录是否存在，不存在则创建
//      if(!f.exists()&&!f.isDirectory()){
//          System.out.println("不存在");
//          f.mkdirs();
//      }else{
//          System.out.println("存在");
//      }
//      //以字节输出文件
//      if(!file.isEmpty()){         
//            try {  
//                InputStream in;  
//                try (FileOutputStream os = new FileOutputStream(f+"/"+file.getOriginalFilename())) {
//                    in = file.getInputStream();
//                    int b=0;
//                    while((b=in.read())!=-1){
//                        os.write(b);
//                    }   os.flush();
//                }  
//                in.close();  
//            } catch (FileNotFoundException e) {  
//                // TODO Auto-generated catch block  
//                e.printStackTrace();  
//            }  
//      }
//        System.out.println("上传课程介绍 路径："+f+"\\"+file.getOriginalFilename());
//        DocConverter dc=new DocConverter(f+"\\"+file.getOriginalFilename());
//        boolean res=dc.conver();
//        String swftmp=(f+"\\"+file.getOriginalFilename()).replace(getFileFolder(request), "");
//        swftmp=swftmp.substring(0,swftmp.lastIndexOf("."))+".swf";
//        if (res){
//            System.out.println("转换为flash成功。网页引用地址:http://localhost:8080/Web/getswf?uri="+swftmp);
//        }
//      return "1";
//
//  }
//  

  
  //教师课程设置格式
  @RequestMapping("kcgs")
  public @ResponseBody List<AutoCourseNode> kcgs(){
     List<AutoCourseNode> list = new LinkedList();
     AutoCourseNode node1 = new AutoCourseNode();
     AutoCourseNode node2 = new AutoCourseNode();
     AutoCourseNode node3 = new AutoCourseNode();
     AutoCourseNode node4= new AutoCourseNode();
     node1.setId(1);
     node1.setState("open");
     node1.setText("第一部分");
     node1.setAttributes("1");
     node2.setId(2);
     node2.setState("open");
     node2.setText("第二部分");
     node2.setAttributes("1");
     node3.setId(3);
     node3.setState("open");
     node3.setText("第三部分");
     node3.setAttributes("1");
     node4.setId(4);
     node4.setState("open");
     node4.setText("第四部分");
     node4.setAttributes("1");
     TeacherCourseResult kcsz = new TeacherCourseResult();
     TeacherCourseResult kcsz1 = new TeacherCourseResult();
     TeacherCourseResult kcsz2 = new TeacherCourseResult();
     TeacherCourseResult kcsz3 = new TeacherCourseResult();
     NewClass children1 = new NewClass(1000,"第一节");
     NewClass children2 = new NewClass(2000,"第二节");
     NewClass children3 = new NewClass(3000,"第一节");
     NewClass children4 = new NewClass(4000,"第二节");
     NewClass children5 = new NewClass(5000,"第一节");
     NewClass children6 = new NewClass(6000,"第二节");
     NewClass children7 = new NewClass(7000,"第一节");
     NewClass children8 = new NewClass(8000,"第二节");
     kcsz.setId(1);
     kcsz.setState("open");
     kcsz.setText("第一章");
     kcsz.setAttributes("2");
     kcsz.getChildren().add(children1);
     kcsz.getChildren().add(children2);
     kcsz1.setId(2);
     kcsz1.setState("open");
     kcsz1.setText("第二章");
     kcsz1.setAttributes("2");
     kcsz1.getChildren().add(children3);
     kcsz1.getChildren().add(children4);
     kcsz2.setId(3);
     kcsz2.setState("open");
     kcsz2.setText("第二章");
     kcsz2.setAttributes("2");
     kcsz2.getChildren().add(children5);
     kcsz2.getChildren().add(children6);
     kcsz3.setId(4);
     kcsz3.setState("open");
     kcsz3.setText("第二章");
     kcsz3.setAttributes("2");
     kcsz3.getChildren().add(children7);
     kcsz3.getChildren().add(children8);
     node1.getChildren().add(kcsz);
     node2.getChildren().add(kcsz1);
     node3.getChildren().add(kcsz2);
     node4.getChildren().add(kcsz3);
     list.add(node1);
     list.add(node2);
     list.add(node3);
     list.add(node4);
     return list;
  }

 //存成josn文件保存到教师目录
  @RequestMapping(value = "saveTree",method = RequestMethod.POST)
  public @ResponseBody String saveTree(HttpServletRequest request,@RequestBody Tree3[] users) throws Exception{
      String sn=getCurrentUsername();
      Teacher tec = TeacherDao.getTeacherBySn(sn);
      String tec_sn= tec.getTeacherSn();
      String tec_name = tec.getTeacherName();
      String collage = tec.getTeacherCollege();
      String term = request.getParameter("term");
      String courseName = request.getParameter("courseName");
      // .../学期/学院／教师工号／教师姓名／课程名称 //课程目录结构
      File f = new File(getFileFolder(request)+term +"/"+collage+"/"+tec_sn+"/"+tec_name+"/"+courseName+"/"+"课程目录结构"+"/");
      //判断目录是否存在，不存在则创建
      if(!f.exists()&&!f.isDirectory()){
          System.out.println("不存在");
          f.mkdirs();
      }else{
          System.out.println("存在");
      }
    String ff = getFileFolder(request)+term +"/"+collage+"/"+tec_sn+"/"+tec_name+"/"+courseName+"/"+"课程目录结构"+"/";
    List list =new LinkedList();
    String ss = "",aa;
    for(int i =0;i < users.length-1;i++){
        list.add(users[i]); 
        aa = JSONObject.fromObject(users[i])+"";
        ss +=aa+',';
    }
    aa = JSONObject.fromObject(users[3])+"";
    ss = ss+aa;
    ss= '['+ss+']';
    System.out.println(ss);
    PrintStream ps =null;
    OutputStreamWriter pw = null;//定义一个流
    pw = new OutputStreamWriter(new FileOutputStream(new File(ff+File.separator+"test.json")),"GBK");
    pw.write(ss);
    pw.close();
    return "1";
  }
  
  //解析josn文件生成树
  @RequestMapping("scTree")
  public @ResponseBody String scTree(HttpServletRequest request) throws FileNotFoundException, IOException{
      String sn=getCurrentUsername();
      Teacher tec = TeacherDao.getTeacherBySn(sn);
      String tec_sn= tec.getTeacherSn();
      String tec_name = tec.getTeacherName();
      String collage = tec.getTeacherCollege();
      String term = request.getParameter("term");
      String courseName = request.getParameter("courseName");
      String ff = getFileFolder(request)+term +"/"+collage+"/"+tec_sn+"/"+tec_name+"/"+courseName+"/"+"课程目录结构"+"/"+"test.json";
      String fileContent = "";    
       try{      
        File f = new File(ff);     
        if(f.isFile()&&f.exists()){      
            InputStreamReader read = new InputStreamReader(new FileInputStream(f),"gbk");      
            BufferedReader reader=new BufferedReader(read);      
            String line;      
            while ((line = reader.readLine()) != null)  
            {       
                fileContent += line;      
            }        
            read.close();     
        }    
      } catch (Exception e){        
        e.printStackTrace();    
      }    
      System.out.println(fileContent);   
      return fileContent;
  }
  
  
  //检查老师是否设置过课程目录
  @RequestMapping("lookMulu")
  public @ResponseBody String lookMulu(HttpServletRequest request){
      String sn=getCurrentUsername();
      Teacher tec = TeacherDao.getTeacherBySn(sn);
      String tec_sn= tec.getTeacherSn();
      String tec_name = tec.getTeacherName();
      String collage = tec.getTeacherCollege();
      String term = request.getParameter("term");
      String courseName = request.getParameter("courseName");
      String ff = getFileFolder(request)+term +"/"+collage+"/"+tec_sn+"/"+tec_name+"/"+courseName+"/"+"课程目录结构"+"/"+"test.json";
      File f =new File(ff);
      if(!f.exists()){
          return "0";//不存在
      }
      return "1";
  }
  
  //上传课程内容
  @RequestMapping("kcnr_submit")
  public @ResponseBody String kcnr_submit(HttpServletRequest request,@RequestParam("desc") String desc,@RequestParam("file") MultipartFile file) throws IOException{
     String sn=getCurrentUsername();
     Teacher tec = TeacherDao.getTeacherBySn(sn);
     String tec_sn= tec.getTeacherSn();
     String tec_name = tec.getTeacherName();
     String collage = tec.getTeacherCollege();
     String term = request.getParameter("term");
     String courseName = request.getParameter("courseName");
     String node1 = request.getParameter("node1");
     String node2 = request.getParameter("node2");
     String node3 = request.getParameter("node3");
     String type = request.getParameter("type");
     System.out.println(type);
     System.out.println(node1 + " "+ node2+"  "+node3+"  "+term+"  "+courseName);
     String ff = getFileFolder(request)+term +"/"+collage+"/"+tec_sn+"/"+tec_name+"/"+courseName+"/"+"课程内容"+"/";
     if(node2.equals("undefined")&&node3.equals("undefined")){//1
         ff = ff+node1;
      }else if(node3.equals("undefined")&&(!node2.equals("undefined"))){//2
         ff = ff+"/"+node1+"/"+node2+"/"; 
      }else if((!node1.equals("undefined"))&&(!node2.equals("undefined"))&&(!node3.equals("undefined"))){//3
         ff = ff+"/"+node1+"/"+node2+"/"+node3+"/"; 
      }
      File f = new File(ff);
      //判断目录是否存在，不存在则创建
      if(!f.exists()&&!f.isDirectory()){
          System.out.println("不存在");
          f.mkdirs();
      }
      
      //如果上传类型是作业，则在最底层目录生成作业文件夹
      if(type.endsWith("作业")){
           ff = ff+"/"+"作业"+"/";
           File fwork = new File(ff);
           if(!fwork.exists()&&!fwork.isDirectory()){
             System.out.println("作业文件夹不存在");
             fwork.mkdirs();
          }
      }
       //以字节输出文件
      if(!file.isEmpty()){         
            try {  
                InputStream in;  
                try (FileOutputStream os = new FileOutputStream(f+"/"+file.getOriginalFilename())) {
                    in = file.getInputStream();
                    int b=0;
                    while((b=in.read())!=-1){
                        os.write(b);
                    }   os.flush();
                }  
                in.close();  
            } catch (FileNotFoundException e) {  
                // TODO Auto-generated catch block  
                e.printStackTrace();  
            }  
      }
//        System.out.println("上传课程内容 路径："+file.getOriginalFilename());
//        DocConverter dc=new DocConverter(f+"/"+file.getOriginalFilename());
//        boolean res=dc.conver();
//        String swftmp=(f+"/"+file.getOriginalFilename()).replace(getFileFolder(request), "");
//        swftmp=swftmp.substring(0,swftmp.lastIndexOf("."))+".swf";
//        if (res){
//            System.out.println("转换为flash成功。网页引用地址:http://localhost:8080/Web/getswf?uri="+swftmp);
//        }
      return "1";
  }
  
  
  //更新课程介绍
  @RequestMapping("addcourseinfo")
  public @ResponseBody String addcourseinfo(HttpServletRequest request,HttpServletResponse response){
     String term = request.getParameter("term");
     String courseid = request.getParameter("courseid");
     String info = request.getParameter("arrinfor");
     System.out.println("term="+term+"\n"+"courseid="+courseid+"\n"+info);
     TermCourseInfoDao.addCourseInfo(Integer.parseInt(term), Integer.parseInt(courseid), info,1);
     return "1";
  }
  
  //更新课程大纲
  @RequestMapping("addcourseoutline")
  public @ResponseBody String addcourseoutline(HttpServletRequest request,HttpServletResponse response){
     String term = request.getParameter("term");
     String courseid = request.getParameter("courseid");
     String info = request.getParameter("arrinfor");
     System.out.println("term="+term+"\n"+"courseid="+courseid+"\n"+info);
     TermCourseInfoDao.addCourseInfo(Integer.parseInt(term), Integer.parseInt(courseid), info,0);
     return "1";
  }
  
  
  //返回课程大纲
  @RequestMapping("lookcourseDG")
  public @ResponseBody String[] lookcourseDG(HttpServletRequest request,HttpServletResponse response){
     String term = request.getParameter("term");
     String courseid = request.getParameter("courseid");
     System.out.println(term+" "+courseid);
     String []a = new String[1];
     a[0]=  TermCourseInfoDao.getCourseInfo(Integer.parseInt(term), Integer.parseInt(courseid), 0);
     System.out.println(a[0]);
     return a;
  }
  //返回课程介绍
   @RequestMapping("lookcourseline")
  public @ResponseBody String[] lookcourseline(HttpServletRequest request,HttpServletResponse response){
     String term = request.getParameter("term");
     String courseid = request.getParameter("courseid");
     System.out.println(term+" "+courseid);
     String []a = new String[1];
     a[0]  =  TermCourseInfoDao.getCourseInfo(Integer.parseInt(term), Integer.parseInt(courseid), 1);
     System.out.println(a[0]+" "+"DG");
      return a;
  }
  
  
  //查看是否为课程负责人
  @RequestMapping("lookisCourseMaster")
  public @ResponseBody String lookisCourseMaster(HttpServletRequest request,HttpServletResponse response){
     String term = request.getParameter("term");
     String courseid = request.getParameter("courseid");
     String sn=getCurrentUsername();
     Teacher tec = TeacherDao.getTeacherBySn(sn);
     if(TeacherDao.isCourseMaster(Integer.parseInt(term), Integer.parseInt(courseid),tec.getTeacherId())==false){
       return "0";//不是课程负责人
     }
     return "1";//是课程负责人
  }
  
    public String getCurrentUsername() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }
  
    public String getFileFolder(HttpServletRequest request) {
        String uri=request.getSession().getServletContext().getRealPath("WEB-INF");
        if (uri==null) {
        uri="/home/liubingxu/temp/";      //防止linux读不出来项目路径 @刘昱 注! 发布时记得调试好后删除!!
        }else{
        uri=uri.replace("build\\web\\WEB-INF", "web\\file\\");
        }
      return uri;       
    }
}
