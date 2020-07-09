package com.service.serviceImpl;

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
    CategoryMapper cgm;
    @Override
    public List<Category> getAllCategory() throws Exception{
        return cgm.queryAll();
    }
    @Override
    public List<Category> getExistCategory() throws Exception{
        return cgm.queryExist();
    }
    @Override
    public int addCategory(Category category) throws Exception{
        category.setId(CreatUniqueId.UniqueId());
        return cgm.insertCategory(category);
    }
    @Override
    public int updateCategory(Category category) throws Exception{
        return cgm.updateById(category);
    }
    @Override
    public int deleteOneCategory(String id) throws Exception{
        return cgm.deleteCategory(id);
    }
}
