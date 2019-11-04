package com.hui.crud.dao;

import com.hui.crud.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

/**
 * @author 辉
 * 座右铭:坚持总能遇见更好的自己!
 * @date 2019/9/26
 */
public interface UserMapper {
    @Select("select count(*) from t_user u where u.t_username=#{username} and u.t_password=#{password}")
    int login(User user);


    //@Insert("INSERT into t_user VALUES(#{username},#{password},#{email},#{creationtime},#{updatetime})")
    void reg(User user);
}
