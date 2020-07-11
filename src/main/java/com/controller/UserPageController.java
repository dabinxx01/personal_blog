package com.controller;

import com.service.ArticleService;
import com.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserPageController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ArticleService articleService;

    @RequestMapping("/userindex")
    public String getCategoryList(Model model) throws Exception{
        model.addAttribute("categoryList",categoryService.getExistCategory());

        model.addAttribute("articleList",articleService.getExistArticle());
        return "index";
    }
}
