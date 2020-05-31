package com.question.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Question {

    private Integer id;

    private String title;

    private String items;

    private Integer gradeId;

    private String gradeName;

    private Integer teacherId;

    private String teacherName;

    private Date createTime;

    private String status;
}
