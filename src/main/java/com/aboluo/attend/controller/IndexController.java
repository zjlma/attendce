package com.aboluo.attend.controller;

import com.aboluo.attend.pojo.Emp;
import com.aboluo.attend.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;

@Controller
public class IndexController {
    @Autowired
    public EmpService indexService;
    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String gelogin(){
        return "login/login";
    }

    /*登录验证*/
    @RequestMapping(value = "/index",method= RequestMethod.POST)
    public String phLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model){
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setCharacterEncoding("utf-8");
        int flag = 0;
        String emp_name =  request.getParameter("emp_name");
        String password =  request.getParameter("password");
        int level =  Integer.valueOf(request.getParameter("level"));
        Emp emp = new Emp(emp_name,password,level);
        for(int i = 0;i < emp_name.length();i++){
            if(Character.isDigit(emp_name.charAt(i))){
                flag = 1;
            }else{
                flag = 0;
                break;
            }
        }
        if(flag==1){
            emp.setEmp_id(Integer.valueOf(emp_name));
        }
        emp = indexService.checkEmp(emp);
        if(emp!=null) {
            session.setAttribute("session_emp",emp);
            String s = emp.getPassword();
            String name = emp.getEmp_name();
            if(!s.equals(password)) {
                model.addAttribute("error","用户名或密码输入错误！");
                return "login/login";
            }
            else if(s.equals(password) && emp.getDisable()==1){
                model.addAttribute("error","你已被禁用！");
                return "login/login";
            }
            else if(s.equals(password) && emp.getDisable()!=1 && level!= emp.getLevel()&&emp.getLevel()==3){
                model.addAttribute("error","请选择正确的等级！");
                return "login/login";
            }
            else if (s.equals(password) && emp.getDisable() != 1) {
                if(emp.getLevel()==1){
                    if(level==3){
                        return "redirect:/emp/own_atd?emp_id="+emp.getEmp_id();
                    }
                    else if(level==2){
                        model.addAttribute("error","请选择正确的等级！");
                        return "login/login";
                    }
                    return "redirect:/super/supadmin";
                }
                else if(emp.getLevel()==2){
                    if(level==3){
                        return "redirect:/emp/own_atd?emp_id="+emp.getEmp_id();
                    }
                    else if(level==1){
                        model.addAttribute("error","请选择正确的等级！");
                        return "login/login";
                    }
                    return "redirect:/manager/empList";
                }
                else if(emp.getLevel()==3){
                    return "redirect:/emp/own_atd?emp_id="+emp.getEmp_id();
                }
            }
        }
        model.addAttribute("error","用户名或工号输入错误！");
        return "login/login";
    }
    /*注册验证、工号检重*/
    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String ster(){
        return "login/register";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String reg_map(Emp emp,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
        if(emp!=null){
            int find = indexService.findEmp_id(emp);
            if(find>0){
                session.setAttribute("register_emp",emp);
                return "login/register";
            }else {
                int count = indexService.register(emp);
                if (count > 0) {
                    session.setAttribute("session_emp",emp);
                    return "login/login";
                }
            }
        }
        return "login/register";
    }


}
