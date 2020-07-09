package com.service.serviceImpl;


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
    private AdminMapper am;

    @Override
    public String adminLogin(String loginid,String email,String pwd) throws Exception
    {
        Admin admin=am.queryByLoginidOrEmail(loginid,email);
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
        return am.queryById(id);
    }

    @Override
    public List<Admin> getAll() throws Exception{
        return am.queryAll();
    }
    @Override
    public List<Admin> getAllNotSuper() throws Exception{
        return am.queryAllNotSuper();
    }
    public int updateAdminBySuper(Admin admin) throws  Exception{
        if(admin.getHeadpic()==null)
            admin.setHeadpic("");
        return am.updateAdminBySuper(admin);
    }
    public int addAdmin(Admin admin) throws  Exception{
        admin.setId(CreatUniqueId.UniqueId());
        return am.insertAdmin(admin);
    }
    public int deleteAdmin(String id)throws  Exception{
        return am.deleteAdmin(id);
    }
}
