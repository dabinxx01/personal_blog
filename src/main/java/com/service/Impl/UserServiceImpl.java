package com.service.Impl;

import com.pojo.User;
import com.service.UserService;
import com.mapper.UserMapper;
import com.utils.CreatUniqueId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User selectUser () throws Exception{
        return userMapper.queryById("1");
    }

    @Override
    public User findUserById (String userid) throws Exception{
        return userMapper.queryById(userid);
    }
    @Override
    public List<User> getAllUser() throws Exception{
        return userMapper.queryAll();
    }

    @Override
    public List<User> getUsers(String search)throws Exception{
        return userMapper.queryLike("%"+search+"%");
    }
    @Override
    public int addUser(User user)throws Exception{
        user.setUserId(CreatUniqueId.UniqueId());
        user.setLogintimes(0);
        return userMapper.insertUser(user);
    }
    @Override
    public int updUser(User user)throws Exception{
        return userMapper.updateUser(user);
    }
    @Override
    public int delUser(String userid)throws Exception{
        return  userMapper.deleteUser(userid);
    }

}
