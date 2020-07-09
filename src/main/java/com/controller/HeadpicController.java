package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HeadpicController {

    @RequestMapping("/pictest")
    public String getUsermanage(Model model) throws Exception{
        return "admin/headpicmanage";
    }
}
