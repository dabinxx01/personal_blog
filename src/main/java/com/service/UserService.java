package com.service;
import com.pojo.User;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository
public interface UserService {
    User selectUser() throws Exception;
    User findUserById(String userid) throws Exception;;
    List<User> getAllUser()throws Exception;
    List<User> getUsers(String search)throws Exception;
    int addUser(User user)throws Exception;
    int updUser(User user)throws Exception;
    int delUser(String userid)throws Exception;

}
