/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.henu.rjxy.lms.controller;

import cn.edu.henu.rjxy.lms.dao.StudentDao;
import cn.edu.henu.rjxy.lms.dao.TeacherDao;
import cn.edu.henu.rjxy.lms.model.Student;
import cn.edu.henu.rjxy.lms.model.Teacher;
import cn.edu.henu.rjxy.lms.server.TeacherMethod;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
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
public class Login {


    @Autowired
    private AuthenticationManager myAuthenticationManager;  // 这样就可以自动注入？oh ，mygod ,how can it do so?
    
    
    
     @RequestMapping("login")
    public String loginpage() {
        
//          for (int i = 10; i < 80; i++) {
//            TeacherDao.saveTeacher(new Teacher("14452030"+i, "正式教师"+i, "4104821900020212"+i, "软件学院", "130850012"+i, "1234567"+i, "21232f297a57a5a743894a0e4a801fc3", true, "1", new Date(),131));  //131是所有权限
//            StudentDao.saveStudent(new Student("14452031"+i,"正式学生"+i, "4104821900020210"+i, 2014, "文学院", "130850010"+i, "1234567"+i, "21232f297a57a5a743894a0e4a801fc3",true));
//          }
        return "login";
    }
    
    @RequestMapping("loginfailure")
    public String loginfailure(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String user = request.getParameter("username");
        String password = request.getParameter("password_md5");
        request.setAttribute("Error", "请检查您输入的用户名和密码后重新登陆!");
        request.getRequestDispatcher("login").forward(request, response);
        return "redirect:/login";
    }    
    
  @RequestMapping("loginsuccess")
    public String loginSuccess(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ServletException, IOException {
        String sn=getCurrentUsername();
      List<String> list=getCurrentAuthoritiest(sn);
    
        
       System.out.println(list);
        
        if(list.contains("ROLE_ACDEMIC")){return "redirect:/console_dean";}
        if(list.contains("ROLE_TEACHER") || list.contains("ROLE_TUTOR")){return "redirect:/teacher";}
        if(list.contains("ROLE_STUDENT")){return "redirect:/student";}
        return "redirect:/index2";
    }       
    
    @RequestMapping("logincheck")
    public @ResponseBody String logincheck(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, ServletException, IOException {
        System.out.println("logincheck");
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        String ccd2 = (String) session.getAttribute("hccd");
        String ccd3 = request.getParameter("ccd");
        System.out.println(ccd2.toLowerCase()+" --- "+ccd3.toLowerCase());
        if (!ccd2.toLowerCase().equals(ccd3.toLowerCase())) {
            return "CheckCodeError";
        }
       
        username = username.trim();
        UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);
       try {
            Authentication authentication = myAuthenticationManager.authenticate(authRequest); //调用loadUserByUsername
            SecurityContextHolder.getContext().setAuthentication(authentication);
            session.setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext()); // 这个非常重要，否则验证后将无法登陆
        } catch (AuthenticationException ex) {
            return "LoginError";
        }
        
        return "Loginok";
    }
    
  
   public String getCurrentUsername() {
      return SecurityContextHolder.getContext().getAuthentication().getName();
   }
   public boolean checkCurrentAuthorities(String sn,String role) {
       
        String str[] = {"ROLE_ACDEMIC","ROLE_COUNSELLOR","ROLE_DEAN","ROLE_STUDENT","ROLE_TEACHER","ROLE_TUTOR","ROLE_ADMIN"};

        try {
            Teacher tea=TeacherDao.getTeacherBySn(sn);
            char[] ch= Integer.toBinaryString(Integer.valueOf(tea.getTeacherRoleValue())).toCharArray();
            int j=-1;
            for (int i = ch.length-1; i >=0; i--) {
                j++;
                if(str[j].equals(role)){
               return true;
                }
               
            }
             
        } catch (Exception e) {
        }
        try {
             Student std=StudentDao.getStudentBySn(sn);
             System.out.println("找到学生"+std.getStudentName());
              if(role.equals("ROLE_STUDENT")){ return true;}
             
        } catch (Exception e) {
        }
       
      return false;
   }  
   


    public List<String> getCurrentAuthoritiest(String sn) {
      String str[] = {"ROLE_ACDEMIC","ROLE_COUNSELLOR","ROLE_DEAN","ROLE_STUDENT","ROLE_TEACHER","ROLE_TUTOR","ROLE_ADMIN"};
       List list = new LinkedList();
        try {
            Teacher tea=TeacherDao.getTeacherBySn(sn);
            char[] ch= Integer.toBinaryString(Integer.valueOf(tea.getTeacherRoleValue())).toCharArray();
            int j=-1;
            for (int i = ch.length-1; i >=0; i--) {
                j++;
                if(String.valueOf(ch[i]).equals("1")){ list.add(str[j]);}
                
               
              
                }
                
            
             
        } catch (Exception e) {
        }
        try {
             Student std=StudentDao.getStudentBySn(sn);
             System.out.println("找到学生"+std.getStudentName());
              list.add("ROLE_STUDENT");
             
             
        } catch (Exception e) {
        }
       
      return list;
    
    }
}
