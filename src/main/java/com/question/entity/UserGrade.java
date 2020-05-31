package com.question.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.annotation.security.DenyAll;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserGrade {

    private Integer id;

    private Integer userId;

    private Integer gradeId;
}
