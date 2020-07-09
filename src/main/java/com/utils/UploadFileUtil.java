package com.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

public class UploadFileUtil {
    public String saveOne( MultipartFile file,String dir,String filename){

        String uploadfilename = file.getOriginalFilename();
        String suffix = uploadfilename.substring(uploadfilename.length() - 4);
        String filename1= filename+suffix;
        System.out.println("文件名:"+filename);
        System.out.println("文件后缀:"+suffix);
        System.out.println("文件大小:"+file.getSize()/1024+"KB");
        //创建要保存文件的路径
        File dirFile = new File(dir,filename+suffix);
        if (!dirFile.exists()){
            dirFile.mkdirs();
        }
        try {
            //将文件写入创建的路径
            file.transferTo(dirFile);
            System.out.println("文件保存成功~");
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

        return filename+suffix;
    }
}
