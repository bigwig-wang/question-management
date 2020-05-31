package com.question.mapper;

import com.question.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserMapper {

    @Insert("insert into user(name, gender, major, school, username, password, role) values " +
            "(#{name}, #{gender}, #{major}, #{school}, #{username}, #{password}, #{role})")
    @Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")
    void insert(User user);

    @Update("update user set name = #{name}, gender = #{gender}, major = #{major}, school = #{school}," +
            "username=#{username}, password = #{password}, role = #{role} where id = #{id}")
    void update(User user);

    @Select("select * from user where username = #{username} and password = #{password} and role = #{role}")
    User login(String username, String password, String role);


    @Select("select * from user where name = #{name} and school = #{school} and username = #{username} and password = #{password}")
    User findForAdmin(User user);

    @Select("select * from user where name = #{name} and school = #{school} and major=#{major} " +
            "and username = #{username} and password = #{password}")
    User findForStudentAndTeacher(User user);

    @Update("update user set password = #{newPassword} where id = #{id}")
    void updatePassword(User user);

    @Select("select * from user where id = #{id}")
    User detail(Integer id);

    @Select("select * from user where username = #{id}")
    User findByUsername(String username);

    @Select("select * from user where role != 'ADMIN'")
    List<User> list();

    @Delete("delete from user where id = #{id}")
    void delete(Integer id);
}
