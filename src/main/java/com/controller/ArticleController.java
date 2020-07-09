package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.pojo.Article;
import com.service.AdminService;
import com.service.ArticleService;
import com.service.CategoryService;
import com.service.FileService;
import com.utils.CreatUniqueId;
import com.utils.UploadFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ArticleController {
    @Qualifier("fileServiceImpl")
    @Autowired
    private FileService fs;
    @Qualifier("adminServiceImpl")
    @Autowired
    private AdminService as;
    @Qualifier("articleServiceImpl")
    @Autowired
    private ArticleService ars;
    @Qualifier("categoryServiceImpl")
    @Autowired
    private CategoryService cgs;

    @RequestMapping("/editArticle")
    public String edit(Model model) throws Exception {
        model.addAttribute("categories",cgs.getAllCategory());
        return "admin/writearticle";
    }
    @RequestMapping("/articledetail")
    public String detail(Model model,@RequestParam String id) throws Exception {
        model.addAttribute("article",ars.getArticleById(id));
        return "admin/success";

    }
    @RequestMapping("/articlemanage")
    public String manage(Model model) throws Exception {
        model.addAttribute("categories",cgs.getAllCategory());
        model.addAttribute("admins",as.getAll());
        return "admin/articlemanage";
    }


    @RequestMapping(value = "/publicArticle", method = RequestMethod.POST)
    private String addArticle(HttpServletRequest request) throws  Exception{
        String title=(String)request.getParameter("title" );
        String detail=(String)request.getParameter("detail" );
        String categoryId=(String)request.getParameter("category" );
        Boolean ispublic=Boolean.valueOf(request.getParameter("ispublic" ));
        Article article=new Article();
        article.setTitle(title);
        article.setDetail(detail);
        article.setCategoryid(categoryId);
        article.setIspublic(ispublic);
        article.setAdminid("001");
        String result = ars.addArticle(article);//us.addUser(user);
        if(result!=null) {
            request.setAttribute("article",ars.getArticleById(result));
            return "admin/success";
        }
        else
            return "admin/fail";
    }

    @RequestMapping(value = "/allarticle", method = RequestMethod.GET)
    @ResponseBody
    private Map<String, Object> listCurr(@RequestParam int curr, @RequestParam int nums) throws Exception{
        String search=null;
        List<Article> articles = new ArrayList<Article>();
        if(search==null)
            articles = ars.getExistArticle();
        else
            articles = ars.getExistArticle();

        int size=articles.size();
        int pages=articles.size()/nums+1;
        if(curr<pages)
            articles=articles.subList((curr-1)*nums,curr*nums-1);
        else if(curr==pages)
            articles=articles.subList((curr-1)*nums,size);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", size);
        map.put("data", articles);
        return map;
    }
    @RequestMapping(value = "/delarticle/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    private Map<String, Object> deleteById(@PathVariable("id") String id) throws  Exception{
        int result = ars.deleteArticle(id);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
            map.put("status", 1);
        } else {
            map.put("status", 0);
        }
        return map;
    }

    @RequestMapping(value = "/updarticle", method = RequestMethod.PUT)
    @ResponseBody
    private Map<String, Object> update(@RequestBody Article article) throws Exception {
        //int result = us.update(user);
        int result = ars.updateArticle(article);
        Map<String, Object> map = new HashMap<String, Object>();
        if (result > 0) {
            map.put("status", 1);
        } else {
            map.put("status", 0);
        }
        return map;
    }


    //private  static final String IMAGE_URL_PRE ="http://localhost:8080/ssm_1_war_exploded/viewArticleImage?key=";
    private  static final String IMAGE_URL_PRE ="viewArticleImage?key=";


    @ResponseBody
    @RequestMapping("/uploadArticleImage")
    public String uploadImage(HttpServletRequest request, @RequestParam(value = "editormd-image-file") MultipartFile file) {

        JSONObject res = new JSONObject();
        try {
            String dir = request.getServletContext().getRealPath("static/articleImg");
            UploadFileUtil ufl=new UploadFileUtil();
            String finename=ufl.saveOne(file,dir,(CreatUniqueId.UniqueId()));
            if(finename!=null){
                res.put("success", 1);
                res.put("message", "上传成功");
                res.put("url",IMAGE_URL_PRE+finename);
            }
            else {
                res.put("success", 0);
                res.put("message", "上传失败" );
            }
        } catch (Exception e) {
            res.put("success", 0);
            res.put("message", "上传异常");
        }
        return res.toString();
    }


    /**
     在线预览图片
     */
    @RequestMapping("/viewArticleImage")
    @ResponseBody
    public  void  viewImage(HttpServletRequest request, HttpServletResponse response, String key) throws Exception {
        BufferedInputStream bis = null;
        OutputStream os = null;
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("image/jpeg");
        byte[] file = fs.getImageByte(request.getServletContext().getRealPath("static/articleImg/")+key);
        try {
            os = response.getOutputStream();
            os.write(file);
            os.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (os != null){
                try {
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (bis != null){
                try {
                    bis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
    }

}
