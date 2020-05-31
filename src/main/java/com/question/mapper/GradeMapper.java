package com.question.mapper;

import com.question.entity.Grade;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface GradeMapper {

    @Insert("insert into grade(no, name, description) values(#{no}, #{name}, #{description})")
    void insert(Grade grade);

    @Update("update grade set no = #{no}, name = #{name}, description = #{description} where id = #{id}")
    void edit(Grade grade);

    @Delete("delete from grade where id = #{id}")
    void delete(Integer id);

    @Select("select * from grade where no = #{no}")
    Grade findByNo(String no);

    @Select("select * from grade where id = #{id}")
    Grade find(Integer id);

    @Select("select * from grade")
    List<Grade> list();
}
