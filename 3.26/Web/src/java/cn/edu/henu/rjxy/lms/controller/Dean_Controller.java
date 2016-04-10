/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.henu.rjxy.lms.controller;

import cn.edu.henu.rjxy.lms.dao.TeacherDao;
import cn.edu.henu.rjxy.lms.model.Teacher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Administrator
 */
@Controller
public class Dean_Controller {
    @RequestMapping("/dean")
     public String personal_InfInformation(HttpServletRequest request, HttpServletResponse response) {


         return "dean";
     }
     @RequestMapping("/dean/MyInfo")
     public String myInfo_InfInformation(HttpServletRequest request, HttpServletResponse response) {
         String sn=getCurrentUsername();
         Teacher teacher = TeacherDao.getTeacherBySn(sn);
         request.setAttribute("sn", sn);
         request.setAttribute("name", teacher.getTeacherName());
         request.setAttribute("idCard", teacher.getTeacherIdcard());
         request.setAttribute("qq", teacher.getTeacherQq());
         request.setAttribute("tel", teacher.getTeacherTel());
         return "dean/MyInfo";
     }
     @RequestMapping("/dean/deanButton")
     public String deanButton(HttpServletRequest request, HttpServletResponse response) {


         return "dean/deanButton";
     }
    @RequestMapping("/dean/szlsjsxx")
    public String szlsjsxx(HttpServletRequest request, HttpServletResponse response) {
        return "dean/teacherManager";
     }
    
    @RequestMapping("/dean/resetpw_p")
    public @ResponseBody String resetpw_p(HttpServletRequest request, HttpServletResponse response) {
        String sn=getCurrentUsername();
        Teacher teacher=TeacherDao.getTeacherBySn(sn);
        String pw=request.getParameter("pw");
        String repw=request.getParameter("repw");
        if (!pw.equals(teacher.getTeacherPwd().toLowerCase())) {
             return "1";}
        if (pw.equals(repw.toLowerCase())) {
             return "2";}
        teacher.setTeacherPwd(repw);
        TeacherDao.updateTeacherById(teacher);
        return "3";
     }
    
    @RequestMapping("/dean/update")
    public @ResponseBody  String update(HttpServletRequest request, HttpServletResponse response) {
        String tsn=getCurrentUsername();
        Teacher teacher=TeacherDao.getTeacherBySn(tsn);
        String qq=request.getParameter("qq");
        teacher.setTeacherQq(qq);
        String name=request.getParameter("name");
        teacher.setTeacherName(name);
        String tel=request.getParameter("tel");
        teacher.setTeacherTel(tel);
        String idCard=request.getParameter("idCard");
        teacher.setTeacherIdcard(idCard);
        TeacherDao.updateTeacherById(teacher);
        System.out.println("ssssss");
        return "0";
        
     }
    
    
     
     
     
      public String getCurrentUsername() {
      return SecurityContextHolder.getContext().getAuthentication().getName();
   }
     
     
}
