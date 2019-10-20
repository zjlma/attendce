package com.aboluo.attend.controller;

import com.aboluo.attend.pojo.Attendance;
import com.aboluo.attend.pojo.Emp;
import com.aboluo.attend.service.AttendanceService;
import com.aboluo.attend.service.EmpService;
import com.aboluo.attend.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/emp")
public class EmpController {

    @Autowired
    private EmpService empService;

    @Autowired
    private AttendanceService attendanceService;

    @RequestMapping("/own_atd")
    public String getAttendance(@RequestParam("emp_id") Integer emp_id, Model model){
        Attendance attendance = attendanceService.selectAttendById(emp_id);
        model.addAttribute("attend", attendance);
        return "employee/empAttendance";
    }
    @RequestMapping(value = "/ownInfo",method = RequestMethod.GET)
    public String ownInfo(){
        return "employee/empOwnInfo";
    }

}
