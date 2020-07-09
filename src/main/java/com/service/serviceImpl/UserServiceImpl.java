package com.service.serviceImpl;

import com.pojo.User;
import com.service.UserService;
import com.mapper.UserMapper;
import com.utils.CreatUniqueId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.security.x509.UniqueIdentity;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper um;

    @Override
    public User selectUser () throws Exception{
        return um.queryById("1");
    }

    @Override
    public User findUserById (String userid) throws Exception{
        return um.queryById(userid);
    }
    @Override
    public List<User> getAllUser() throws Exception{
        return um.queryAll();
    }

    @Override
    public List<User> getUsers(String search)throws Exception{
        return um.queryLike("%"+search+"%");
    }
    @Override
    public int addUser(User user)throws Exception{
        user.setUserId(CreatUniqueId.UniqueId());
        user.setLogintimes(0);
        return um.insertUser(user);
    }
    @Override
    public int updUser(User user)throws Exception{
        return um.updateUser(user);
    }
    @Override
    public int delUser(String userid)throws Exception{
        return  um.deleteUser(userid);
    }

}
