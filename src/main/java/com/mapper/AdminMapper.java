package com.mapper;

import com.pojo.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {
    Admin queryById(@Param("id")String id) throws Exception;
    Admin queryByLoginidOrEmail(@Param("loginid") String loginid,@Param("email")String email) throws Exception;
    List<Admin> queryAll() throws Exception;
    List<Admin> queryAllNotSuper() throws Exception;
    int updateAdminBySuper(Admin admin) throws  Exception;
    int insertAdmin(Admin admin) throws  Exception;
    int deleteAdmin(@Param("id")String id)throws  Exception;
    int deleteAdmins(String[] ids)throws  Exception;
}
