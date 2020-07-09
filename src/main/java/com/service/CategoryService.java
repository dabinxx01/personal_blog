package com.service;

import com.pojo.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryService {
    List<Category> getAllCategory() throws Exception;
    List<Category> getExistCategory() throws Exception;
    int addCategory(Category category) throws Exception;
    int updateCategory(Category category) throws Exception;
    int deleteOneCategory(String id) throws Exception;
}
