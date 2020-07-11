package com.service.Impl;

import com.mapper.CategoryMapper;
import com.pojo.Category;
import com.service.CategoryService;
import com.utils.CreatUniqueId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryMapper categoryMapper;
    @Override
    public List<Category> getAllCategory() throws Exception{
        return categoryMapper.queryAll();
    }
    @Override
    public List<Category> getExistCategory() throws Exception{
        return categoryMapper.queryExist();
    }
    @Override
    public int addCategory(Category category) throws Exception{
        category.setId(CreatUniqueId.UniqueId());
        return categoryMapper.insertCategory(category);
    }
    @Override
    public int updateCategory(Category category) throws Exception{
        return categoryMapper.updateById(category);
    }
    @Override
    public int deleteOneCategory(String id) throws Exception{
        return categoryMapper.deleteCategory(id);
    }
}
