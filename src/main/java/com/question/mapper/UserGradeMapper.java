package com.question.mapper;

import com.question.entity.UserGrade;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface UserGradeMapper {

    @Insert("insert into user_grade(userId, gradeId) " +
            "values(#{userId}, #{gradeId})")
    void insert(UserGrade userGrade);


    @Update("update user_grade set userId=#{userId}, gradeId=#{gradeId}")
    void update(UserGrade userGrade);

    @Delete("delete from user_grade where id = #{id}")
    void delete(Integer id);

    @Select("select * from user_grade where id = #{id}")
    void detail(Integer id);

    @Delete("delete from user_grade where userId = #{userId}")
    void deleteByUserId(Integer userId);

    @Select("select * from user_grade where userId = #{userId}")
    List<UserGrade> findByUserId(Integer userId);
}
