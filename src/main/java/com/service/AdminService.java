package com.service;

import com.pojo.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminService {
    String adminLogin(String loginid,String email,String pwd) throws Exception;
    Admin getAdmin(String id)throws Exception;
    List<Admin> getAll() throws Exception;
    List<Admin> getAllNotSuper() throws Exception;
    int updateAdminBySuper(Admin admin) throws  Exception;
    int addAdmin(Admin admin) throws  Exception;
    int deleteAdmin(String id)throws  Exception;
}
