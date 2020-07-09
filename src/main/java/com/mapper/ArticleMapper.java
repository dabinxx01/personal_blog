package com.mapper;

import com.pojo.Article;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleMapper {
    Article queryById(@Param("id")String id) throws Exception;
    int insertArticle(Article article)throws Exception;
    List<Article> queryLike(String search)throws Exception;
    List<Article> queryExist()throws Exception;
    List<Article> queryDel()throws Exception;
    List<Article> queryByCategory()throws Exception;
    int updateArticle(Article article)throws Exception;
    int setIsDelArticle(@Param("id")String id) throws Exception;
    int setNotDelArticle(@Param("id")String id) throws Exception;
    int deleteArticleById(@Param("id")String id) throws Exception;
}
