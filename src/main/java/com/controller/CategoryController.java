package com.controller;

import com.pojo.Category;
import com.service.CategoryService;
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
public class CategoryController {

    @Qualifier("categoryServiceImpl")
    @Autowired
    private CategoryService cgs;

    @RequestMapping("/categorymanage")
    public String getUsermanage(Model model) throws Exception{
        return "admin/categorymanage";
    }

    @RequestMapping(value = "/allcategory", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> listCurr(@RequestParam int curr, @RequestParam int nums) throws Exception{
        String search=null;
        List<Category> categories = new ArrayList<Category>();
        if(search==null)
            categories = cgs.getAllCategory();
        else
            categories = cgs.getAllCategory();
        int size=categories.size();
        int pages=categories.size()/nums+1;

        if(curr<pages)
            categories=categories.subList((curr-1)*nums,curr*nums-1);
        else if(curr==pages)
            categories=categories.subList((curr-1)*nums,size);
        //System.out.println(users);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", size);
        map.put("data", categories);
        return map;
    }
    @RequestMapping(value = "/addcategory", method = RequestMethod.POST)
    @ResponseBody
    private Map<String, Object> add(@RequestBody Category category) throws  Exception{
        int result = cgs.addCategory(category);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
            map.put("status", 1);
        } else {
            map.put("status", 0);
        }
        return map;
    }

    @RequestMapping(value = "/delcategory/{userId}", method = RequestMethod.DELETE)
    @ResponseBody
    private Map<String, Object> deleteById(@PathVariable("id") String id) throws  Exception{
        int result = cgs.deleteOneCategory(id);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
            map.put("status", 1);
        } else {
            map.put("status", 0);
        }
        return map;
    }
    @RequestMapping(value = "/updcategory", method = RequestMethod.PUT)
    @ResponseBody
    private Map<String, Object> update(@RequestBody Category category) throws Exception {
        //int result = us.update(user);
        int result = cgs.updateCategory(category);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
            map.put("status", 1);
        } else {
            map.put("status", 0);
        }
        return map;
    }

    @RequestMapping("/categorylist")
    public String getCategoryList(Model model) throws Exception{
        model.addAttribute("caregoryList",cgs.getExistCategory());
        return "index";
    }
}
