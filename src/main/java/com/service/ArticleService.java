package com.service;

import com.pojo.Article;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleService {
    Article getArticleById(String id) throws  Exception;
    String addArticle(Article article) throws  Exception;
    List<Article> getExistArticle()throws  Exception;
    int updateArticle(Article article)throws Exception;
    int recycleArticle(String id) throws Exception;
    int rePublicArticle(String id) throws Exception;
    int deleteArticle(String id) throws Exception;
}
