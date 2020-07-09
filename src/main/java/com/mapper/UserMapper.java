package com.mapper;

import com.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    List<User> queryAll() throws Exception;
    User queryById(@Param("userid")String userId) throws Exception;
    List<User> queryLike(String search) throws Exception;
    int insertUser(User user)throws Exception;
    int updateUser(User user)throws Exception;
    int deleteUser(@Param("userid")String userid)throws Exception;
}