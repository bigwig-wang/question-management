package com.question.dto;

import com.question.entity.QuestionItem;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QuestionDto {

    private Integer id;

    private String title;

    private List<QuestionItem> questionItems;


    //查询时展示的字段
    private String status;

    private Integer gradeId;

    private String gradeName;

    private Integer teacherId;

    private String teacherName;
}
