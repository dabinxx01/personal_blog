package com.controller;

import com.utils.CreatUniqueId;
import com.utils.UploadFileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UploadController {

    @RequestMapping(value = "upload", method = RequestMethod.POST)
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile files,
     HttpServletRequest request){//支持多个文件的上传
        //实例化一个文件存放的目录地址
        String dir = request.getServletContext().getRealPath("upload");
        UploadFileUtil upu=new UploadFileUtil();
        if(upu.saveOne(files,dir,CreatUniqueId.UniqueId())!=null)
            return "文件上传失败！";
        else
            return "文件上传成功！";
    }

}
