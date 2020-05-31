package com.question.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QuestionListDto {

    private Integer id;

    private Integer gradeId;

    private String gradeName;

    private String status;

    private String title;

}
