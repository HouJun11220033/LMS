/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.henu.rjxy.lms.controller;
import cn.edu.henu.rjxy.lms.dao.ClassesDao;
import cn.edu.henu.rjxy.lms.dao.CourseDao;
import cn.edu.henu.rjxy.lms.dao.StudentDao;
import cn.edu.henu.rjxy.lms.dao.StudentSelectCourseDao;
import cn.edu.henu.rjxy.lms.dao.TeacherDao;
import cn.edu.henu.rjxy.lms.dao.TermCourseDao;
import cn.edu.henu.rjxy.lms.dao.TermCourseInfoDao;
import cn.edu.henu.rjxy.lms.model.AutoCourseNode;
import cn.edu.henu.rjxy.lms.model.NewClass;
import cn.edu.henu.rjxy.lms.model.Student;
import cn.edu.henu.rjxy.lms.model.Teacher;
import cn.edu.henu.rjxy.lms.model.TeacherCourseResult;
import cn.edu.henu.rjxy.lms.model.TermCourse;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.security.Principal;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author 刘昱
 */
@Controller
public class Stu_Controller {
    @RequestMapping("/student/personal_Inf")
    public String personal_InfInformation(HttpServletRequest request, HttpServletResponse response) {
        String sn=getCurrentUsername();
        Student std=StudentDao.getStudentBySn(sn);
        request.setAttribute("StudentId",std.getStudentSn());
        request.setAttribute("StudentName",std.getStudentName());
        request.setAttribute("StudentIdcard",std.getStudentIdcard());
        request.setAttribute("StudentGrade",std.getStudentGrade()); 
        request.setAttribute("StudentCollege",std.getStudentCollege());
        request.setAttribute("StudentCollege2","\""+std.getStudentCollege()+"\"");
        request.setAttribute("StudentSex",(std.getStudentSex())?("男"):("女"));
        request.setAttribute("StudentTel",std.getStudentTel());
        request.setAttribute("StudentQq",std.getStudentQq()); 
        return "student/personal_Inf";
    }

      @RequestMapping("/student/resetpw")
    public String resetpassword(HttpServletRequest request, HttpServletResponse response) {
        return "student/resetpw";
    }
    
    @RequestMapping("/student/resetpw_p")
    public @ResponseBody String resetpassword_p(HttpServletRequest request, HttpServletResponse response) {
        String sn=getCurrentUsername();
        Student std=StudentDao.getStudentBySn(sn);
        String pw=request.getParameter("pw");
        String repw=request.getParameter("repw");
        if (!pw.equals(std.getStudentPwd().toLowerCase())) {
             return "1";}
        if (pw.equals(repw.toLowerCase())) {
             return "2";}
        std.setStudentPwd(repw);
        StudentDao.updateStudent(std);
        return "3";
    }
    
    @RequestMapping("/student/subcourse")
    public @ResponseBody String submitcourse(HttpServletRequest request, HttpServletResponse response) {
        String sn=getCurrentUsername();
        Student std=StudentDao.getStudentBySn(sn);
        Integer cid=Integer.valueOf(request.getParameter("cid"));
        try {
            StudentSelectCourseDao.saveStudentSelectCourse(sn,cid,0);
        } catch (Exception e) {
            return "0";
        }
        return "1";
        
    }
    
    @RequestMapping("/student/stu_course")
    public String stu_course(HttpServletRequest request, HttpServletResponse response) {
        String scid=request.getParameter("cou");
       
	request.setAttribute("scid",scid);
        
        request.setAttribute("syllabusspan",TermCourseInfoDao.getCourseInfo(201601, TermCourseDao.getCourseidByCourseId(scid), 0));
        request.setAttribute("CourseDescription",TermCourseInfoDao.getCourseInfo(201601, TermCourseDao.getCourseidByCourseId(scid), 1));
	return "student/stu_course";
    }
    
    @RequestMapping("/student/stu_addcourse")
    public String stu_addcourse(HttpServletRequest request, HttpServletResponse response) {
        String sumcourse="";
        Integer xueqi=Integer.valueOf("201601");
         List<String> coulist = CourseDao.getCourseIdByTerm(xueqi);
        for (String coulist1 : coulist) {
            sumcourse = sumcourse+ "{text: \"" + CourseDao.getCourseById(Integer.valueOf(coulist1)).getCourseName() + "\",state: {expanded: false},";
            List<String> teacher_cou = CourseDao.getTeacherSnByTermCourseId(xueqi, Integer.valueOf(coulist1));
            if (teacher_cou.size()>0) {
                sumcourse=sumcourse+ "nodes: [";
                for (String teacher_cou1 : teacher_cou) {
                    sumcourse = sumcourse+ "{text: \"" + TeacherDao.getTeacherBySn(teacher_cou1).getTeacherName() + "\",";
                    List<String> stu_cou_clas = CourseDao.getClassSnByTermCourseNumber(xueqi, Integer.valueOf(coulist1), teacher_cou1);
                    if (stu_cou_clas.size()>0) {
                        sumcourse=sumcourse+ "nodes: [";
                        for (String stu_cou_cla : stu_cou_clas) {
                            sumcourse = sumcourse+ "{text: \"" + ClassesDao.getClassById(Integer.valueOf(stu_cou_cla)).getClassName() + "\"" + ",coid: \"" + StudentSelectCourseDao.getTermCourseIdByothers(xueqi, Integer.valueOf(coulist1), Integer.valueOf(stu_cou_cla), TeacherDao.getTeacherBySn(teacher_cou1).getTeacherId()) + "\"," + "},";
                        }
                        sumcourse=sumcourse+ "],";
                    }
                    sumcourse=sumcourse+ "},";
                } //j for end
                sumcourse=sumcourse+ "],";
            }
            sumcourse=sumcourse+ "},"; 
        }
	request.setAttribute("Course","["+sumcourse+"]");
	return "student/stu_addcourse";
    }
        
    @RequestMapping("/student")
    public String stu_index(HttpServletRequest request, HttpServletResponse response) {
        String stusn=getCurrentUsername();
	request.setAttribute("username",stusn);
        Integer xueqi=Integer.valueOf("201601");
        String cou="";
       
       List list =  StudentSelectCourseDao.getStudentSelectCourseNameByTermSnCourseId(xueqi, stusn);
        for (int i = 0; i < list.size()/2; i++) {
           cou=cou+ "<li><a href=\"./student/stu_course?cou="+list.get(2*i)+"\" target=\"content\">"+list.get(2*i+1)+"</a></li>";
        }
     
       request.setAttribute("stucou",cou);
       
	return "student/stu_index";
    }
    
    @RequestMapping("/student/stu_listwpzcourse")
    public String stulistwpzcourse(HttpServletRequest request, HttpServletResponse response) {
        String stusn=getCurrentUsername();
        Integer xueqi=Integer.valueOf("201601");

        List list =  StudentSelectCourseDao.getStudentSelectCourseNameByTermSnCourseId2(xueqi, stusn);
        String cou="";
              for (int i = 0; i < list.size()/4; i++) {
        cou=cou+ "<tr><td>"+list.get(4*i+1)+"</td><td>"+list.get(4*i+2)+"</td><td>"+list.get(4*i+3)+"</td><td><a href=\"cancelcourse?scid="+list.get(4*i)+"\" >"+"取消申请</a></td></tr>";
        }
       request.setAttribute("wpzCourse",cou);
	return "student/stu_listwpzcourse";
    }
    
    @RequestMapping("/student/cancelcourse")
    public String stuCancelCourse(HttpServletRequest request, HttpServletResponse response) {
        String scid=request.getParameter("scid");
        String stusn=getCurrentUsername();
        System.out.println("Courseid:"+TermCourseDao.getCourseidByCourseId(scid));   
        TeacherDao.updateStudentCourse(StudentDao.getStudentBySn(stusn).getStudentId(),Integer.valueOf(scid), true);
        Integer xueqi=Integer.valueOf("201601");
        List list =  StudentSelectCourseDao.getStudentSelectCourseNameByTermSnCourseId2(xueqi, stusn);
        String cou="";
              for (int i = 0; i < list.size()/4; i++) {
        cou=cou+ "<tr><td>"+list.get(4*i+1)+"</td><td>"+list.get(4*i+2)+"</td><td>"+list.get(4*i+3)+"</td><td><a href=\"cancelcourse?scid="+list.get(4*i)+"\" >"+"取消申请</a></td></tr>";
        }
       request.setAttribute("wpzCourse",cou);
	return "student/stu_listwpzcourse";
    }
    @RequestMapping("/student/quitcourse")
    public String stuQuitCourse(HttpServletRequest request, HttpServletResponse response) {
        String scid=request.getParameter("scid");
        String stusn=getCurrentUsername();
        System.out.println("Courseid:"+TermCourseDao.getCourseidByCourseId(scid));   
        TeacherDao.updateStudentCourse(StudentDao.getStudentBySn(stusn).getStudentId(),Integer.valueOf(scid), true);
        Integer xueqi=Integer.valueOf("201601");
        List list =  StudentSelectCourseDao.getStudentSelectCourseNameByTermSnCourseId2(xueqi, stusn);
        String cou="";
              for (int i = 0; i < list.size()/4; i++) {
        cou=cou+ "<tr><td>"+list.get(4*i+1)+"</td><td>"+list.get(4*i+2)+"</td><td>"+list.get(4*i+3)+"</td><td><a href=\"cancelcourse?scid="+list.get(4*i)+"\" >"+"取消申请</a></td></tr>";
        }
       request.setAttribute("wpzCourse",cou);
	return "student/stu_listwpzcourse";
    }
    
    
 @RequestMapping(value="/student/kcgs")
    public @ResponseBody String lookMulu(HttpServletRequest request, HttpServletResponse response) throws Exception{

      String cid=request.getParameter("scid");
      Teacher tec=TeacherDao.getTeacherById(TermCourseDao.getTecsnByCourseId(cid));
      String sn=tec.getTeacherSn();
      String tec_sn= tec.getTeacherSn();
      String tec_name = tec.getTeacherName();
      String collage = tec.getTeacherCollege();
      String term ="201601";
      String courseName =TermCourseDao.getCourseNameByCourseId(cid);
      String ff = getFileFolder(request)+term +"/"+collage+"/"+tec_sn+"/"+tec_name+"/"+courseName+"/"+"课程目录结构"+"/"+"test.json";
      ff=ff.replaceAll("\\\\", "/");
      System.out.println(ff);

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
 
    //  return "";
  }
  
    
 public String getCurrentUsername() {
      return SecurityContextHolder.getContext().getAuthentication().getName();
   }
 public String getFileFolder(HttpServletRequest request) {
        String uri=getClass().getResource("/").getFile();  
        uri=uri.replace("build/web/WEB-INF/classes/", "web/file/");
        return uri;
    }
}
