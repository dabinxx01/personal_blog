package com.controller;
import com.pojo.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@SessionAttributes("search")
public class UserController {

    @Qualifier("userServiceImpl")
    @Autowired
    private UserService us;

    @RequestMapping("/queryUser")
    public String queryUser(Model model) throws Exception{
        User user = us.selectUser();
        model.addAttribute("user",user);
        return "success";
    }
    @RequestMapping("/usermanage")
    public String getUsermanage(Model model) throws Exception{

        return "admin/usermanage";
    }

    @RequestMapping(value = "/listAllArticle", method = RequestMethod.GET)
    @ResponseBody

    private Map<String, Object> listAll() throws Exception{
        List<User> users = us.getAllUser();
        //System.out.println(users);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", users.size());
        map.put("data", users);
        return map;
    }
    @RequestMapping(value = "/alluser", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> listCurr(@RequestParam int curr ,@RequestParam int nums) throws Exception{
        String search=null;
        List<User> users = new ArrayList<User>();
        if(search==null || "".equals(search))
            users = us.getAllUser();
        else
            users = us.getUsers(search.trim());
        int size=users.size();
        int pages=users.size()/nums+1;

        if(curr<pages)
            users=users.subList((curr-1)*nums,curr*nums-1);
        else if(curr==pages)
            users=users.subList((curr-1)*nums,size);
        //System.out.println(users);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", size);
        map.put("data", users);
        return map;
    }
    @RequestMapping(value = "/adduser", method = RequestMethod.POST)
    @ResponseBody
    private Map<String, Object> add(@RequestBody User user) throws  Exception{
        int result = us.addUser(user);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
            map.put("status", 1);
        } else {
            map.put("status", 0);
        }
        return map;
    }

    @RequestMapping(value = "/deluser/{userId}", method = RequestMethod.DELETE)
    @ResponseBody
    private Map<String, Object> deleteById(@PathVariable("userId") String userId) throws  Exception{
        int result = us.delUser(userId);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
            map.put("status", 1);
        } else {
            map.put("status", 0);
        }
        return map;
    }

    @RequestMapping(value = "/upduser", method = RequestMethod.PUT)
    @ResponseBody
    private Map<String, Object> update(@RequestBody User user) throws Exception {
        //int result = us.update(user);
        if(user.getHeadpic().equals(null))
            user.setHeadpic(us.findUserById(user.getUserId()).getHeadpic());
        int result = us.updUser(user);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
            map.put("status", 1);
        } else {
            map.put("status", 0);
        }
        return map;
    }
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> search(@RequestParam String search) throws Exception {
        //int result = us.update(user);
        Map<String, Object> map = new HashMap<String, Object>();
        //HttpServletRequest request = null;
        //request.getSession().setAttribute("search",search);
        map.put("status", 1);
        return map;
    }

}
