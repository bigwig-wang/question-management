package com.question.mapper;

import com.alibaba.fastjson.JSONObject;
import com.question.entity.Question;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface QuestionMapper {

    @Insert("insert into question (items, gradeId, teacherId, status, title) " +
            "values(#{items}, #{gradeId}, #{teacherId}, #{status}, #{title})")
    void insert(Question question);

    @Update("update question set status = 'PUBLISHED', gradeId = #{gradeId}, gradeName = #{gradeName} " +
            "where id = #{id}")
    void publish(JSONObject jsonObject);

    @Delete("delete from question where id = #{id}")
    void delete(Integer id);

    @Select("select * from question where id = #{id}")
    Question findOne(Integer id);

    @Select("select * from question where teacherId = #{teacherId}")
    List<Question> list(Integer teacherId);

}
