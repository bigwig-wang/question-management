package com.question.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {

    private Integer id;

    private String name;

    private String gender;

    private String major;

    private String school;

    private String className;

    private String username;

    private String password;

    private String role;


    private String newPassword;

    private String repeatPassword;

    private List<Integer> grade;

    private String gradeName;

    public enum Role {

        ADMIN, STUDENT, TEACHER
    }
}
