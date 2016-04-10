/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.henu.rjxy.lms.controller;

import cn.edu.henu.rjxy.lms.dao.StudentDao;
import cn.edu.henu.rjxy.lms.dao.TeacherDao;
import cn.edu.henu.rjxy.lms.model.ManageResult;
import cn.edu.henu.rjxy.lms.model.PageBean;
import cn.edu.henu.rjxy.lms.model.Student;
import cn.edu.henu.rjxy.lms.model.Teacher;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Administrator
 */
@Controller
public class admin_Controller {
     @RequestMapping("/admin")
     public String personal_InfInformation(HttpServletRequest request, HttpServletResponse response) {


         return "admin";
     }
     @RequestMapping("/admin/functionManage")
     public String functionManage(HttpServletRequest request, HttpServletResponse response) {
         return "admin/functionManage";
     }
      @RequestMapping("admin/personManage")
     public String PersonManage(HttpServletRequest request, HttpServletResponse response) {  
         return "admin/personManage";
     }

     @RequestMapping("/admin/UserSituation")
     public String UserSituation(HttpServletRequest request, HttpServletResponse response) {
         return "admin/UserSituation";
     }
     
    @RequestMapping("/admin/ServerInformation")
    public String ServerInformation(HttpServletRequest request, HttpServletResponse response) {
         return "admin/ServerInformation";
     }
     @RequestMapping("admin/student")
     public @ResponseBody  List<ManageResult> person(HttpServletRequest request, HttpServletResponse response) {
         List list =   StudentDao.getAllStudent();
         list.addAll(TeacherDao.getAllTeacher());
         List<ManageResult> l = new LinkedList();
         for (Object ob : list) {
             ManageResult mr = new ManageResult();
             mr.copy(ob);
             l.add(mr);
         }
         return   l;
     }
}
