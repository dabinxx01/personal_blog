package com.service.Impl;


import com.mapper.AdminMapper;
import com.pojo.Admin;
import com.service.AdminService;
import com.utils.CreatUniqueId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public String adminLogin(String loginid,String email,String pwd) throws Exception
    {
        Admin admin=adminMapper.queryByLoginidOrEmail(loginid,email);
        if(admin!=null)
        {
            System.out.println(admin.getPassword());
            System.out.println(pwd);
            System.out.println(admin.getPassword().equals(pwd)?"密码正确":"密码错误");
            if(admin.getPassword().equals(pwd))
                return admin.getId();
            else
                return  null;
        }
        else
            return  null;
    }

    @Override
    public Admin getAdmin(String id) throws Exception {
        return adminMapper.queryById(id);
    }

    @Override
    public List<Admin> getAll() throws Exception{
        return adminMapper.queryAll();
    }
    @Override
    public List<Admin> getAllNotSuper() throws Exception{
        return adminMapper.queryAllNotSuper();
    }
    public int updateAdminBySuper(Admin admin) throws  Exception{
        if(admin.getHeadpic()==null)
            admin.setHeadpic("");
        return adminMapper.updateAdminBySuper(admin);
    }
    public int addAdmin(Admin admin) throws  Exception{
        admin.setId(CreatUniqueId.UniqueId());
        return adminMapper.insertAdmin(admin);
    }
    public int deleteAdmin(String id)throws  Exception{
        return adminMapper.deleteAdmin(id);
    }
}
