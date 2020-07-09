package com.service.serviceImpl;

import com.mapper.ArticleMapper;
import com.pojo.Article;
import com.service.ArticleService;
import com.utils.CreatUniqueId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    ArticleMapper arm;

    public Article getArticleById(String id) throws  Exception{
        return arm.queryById(id);
    }
    @Override
    public String addArticle(Article article) throws  Exception{
        String ArticleId =CreatUniqueId.UniqueId();
        article.setId(ArticleId);
        article.setLooktimes(0);
        article.setCreattime((new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date()));
        article.setIsdel(false);
        if(arm.insertArticle(article)>0)
            return ArticleId;
        else
            return null;
    }
    @Override
    public List<Article> getExistArticle() throws  Exception{
        return arm.queryExist();
    }
    @Override//更新文章
    public int updateArticle(Article article)throws Exception{
        return arm.updateArticle(article);
    }
    @Override//加入回收站
    public int recycleArticle(String id) throws Exception{
        return arm.setIsDelArticle(id);
    }
    @Override//重新发布，从回收站恢复
    public int rePublicArticle(String id) throws Exception{
        return arm.setNotDelArticle(id);
    }
    @Override//彻底删除文章
    public int deleteArticle(String id) throws Exception{
        return arm.deleteArticleById(id);
    }
}
