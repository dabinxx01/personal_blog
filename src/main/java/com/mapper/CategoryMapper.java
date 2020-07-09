package com.mapper;

import com.pojo.Category;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

;import java.util.List;

@Repository
public interface CategoryMapper {
    Category queryById(@Param("id")String id)throws Exception;
    List<Category> queryAll() throws Exception;
    List<Category> queryExist() throws Exception;
    List<Category> queryDel() throws Exception;
    int setIsdel(@Param("id")String id) throws Exception;
    int setNotdel(@Param("id")String id) throws Exception;
    Category queryByName(String name) throws Exception;
    int insertCategory(Category category) throws Exception;
    int updateById(Category category) throws Exception;
    int deleteCategory(@Param("id")String id) throws Exception;

}
