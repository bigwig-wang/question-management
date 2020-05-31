package com.question.mapper;

import com.question.entity.QuestionItem;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface QuestionItemMapper {

    @Insert("insert into question_item(title, type, options) " +
            "values (#{title}, #{type}, #{options})")
    @Options(useGeneratedKeys=true, keyProperty="id", keyColumn = "id")
    void insert(QuestionItem questionItem);

    @Delete({"<script> delete from question_item where id in ",
                "<foreach item='id' index='index' collection='ids' open='(' separator=',' close=')'>",
                    "#{id}",
                "</foreach>",
            "</script>"})
    void deleteIdIn(@Param("ids") List<Integer> ids);

    @Select({"<script> ",
            "select * from question_item where id in ",
                "<foreach item='id' index='index' collection='questionItemIds' open='(' separator=',' close=')'>",
                    "#{id}",
                 "</foreach>",
            "</script>"})
    List<QuestionItem> findByIdIn(@Param("questionItemIds") List<Integer> questionItemIds);
}
