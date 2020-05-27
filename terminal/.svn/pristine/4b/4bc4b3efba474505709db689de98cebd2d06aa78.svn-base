package com.asiainfo.cmc.authority.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.asiainfo.cmc.authority.pojo.Resource;
import com.asiainfo.cmc.authority.pojo.Role;
import com.asiainfo.cmc.authority.pojo.User;

 

/**
 *@标题UserDao
 * @作者: meiyuxiang
 * @创建时间: 2018-06-29 0029
 * @描述: 
 */
public interface UserMapper {
    Integer add(User user);

    Integer update(User user);

    Integer delete(Integer id);

    Integer batchDelete(@Param("ids") List<Integer> ids);

    User load(Integer id);

    List<User> listUser();

    User loadByUserName(String username);

    /**
     * 根据角色 id 查询所有是该角色的用户列表
     * @param rid
     * @return
     */
    List<User> listByRole(Integer rid);

    List<Resource> listAllResources(Integer uid);

    List<String> listRoleSnByUser(Integer uid);

    List<Role> listUserRole(Integer uid);
}
