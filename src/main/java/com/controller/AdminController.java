package com.controller;

import com.pojo.Admin;
import com.pojo.User;
import com.service.AdminService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {
    @Qualifier("adminServiceImpl")
    @Autowired
    private AdminService as;

    @RequestMapping(value="/adminindex")
    public String queryUser(HttpServletRequest request) throws Exception{
        String username=(String)request.getParameter("loginusername");
        String password=(String)request.getParameter("loginpassword");
        String adminId=as.adminLogin(username,username,password);
        Admin admin =as.getAdmin(adminId);
        if(adminId != null) {
            request.getSession().setAttribute("adminid", adminId);
            return "admin/index";
        }
        else {
            request.setAttribute("username", username);
            request.setAttribute("loginmsg", "登录账号不存在或密码错误");
            return "admin/login";
        }
    }
    @RequestMapping(value = "/alladmin", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> listCurr(@RequestParam int curr , @RequestParam int nums) throws Exception{
        String search=null;
        List<Admin> admins = new ArrayList<Admin>();
        if(search==null || "".equals(search))
            admins = as.getAllNotSuper();
        else
            admins = as.getAllNotSuper();
        int size=admins.size();
        int pages=admins.size()/nums+1;

        if(curr<pages)
            admins=admins.subList((curr-1)*nums,curr*nums-1);
        else if(curr==pages)
            admins=admins.subList((curr-1)*nums,size);
        //System.out.println(users);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "所有普通管理员");
        map.put("count", size);
        map.put("data", admins);
        return map;
    }
    @RequestMapping(value = "/addadmin", method = RequestMethod.POST)
    @ResponseBody
    private Map<String, Object> add(@RequestBody Admin admin) throws  Exception{
        int result = as.addAdmin(admin);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
            map.put("status", 1);
        } else {
            map.put("status", 0);
        }
        return map;
    }

    @RequestMapping(value = "/deladmin/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    private Map<String, Object> deleteById(@PathVariable("id") String id) throws  Exception{
        int result = as.deleteAdmin(id);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
            map.put("status", 1);
        } else {
            map.put("status", 0);
        }
        return map;
    }

    @RequestMapping(value = "/updadmin", method = RequestMethod.PUT)
    @ResponseBody
    private Map<String, Object> update(@RequestBody Admin admin) throws Exception {
        //int result = us.update(user);
//        if(admin.getHeadpic().equals(null))
//            admin.setHeadpic(as.(user.getUserId()).getHeadpic());
        int result = as.updateAdminBySuper(admin);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
            map.put("status", 1);
        } else {
            map.put("status", 0);
        }
        return map;
    }
    @RequestMapping("/adminmanage")
    public String adminManage(Model model){
        return "admin/adminmanage";
    }

    @RequestMapping("/adminlogin")
    public String login(Model model){
        return "admin/login";
    }

//    @RequestMapping("/admintest")
//    public String test(Model model){
//        return "admin/index";
//    }
}
