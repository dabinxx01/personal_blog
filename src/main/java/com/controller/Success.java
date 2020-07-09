package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Success {
    @RequestMapping("/test")
    public String testMvc(){
        System.out.println("跳转success.jsp");
        return "success";
    }

}
