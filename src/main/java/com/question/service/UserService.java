package com.question.service;

import com.question.dto.ResponseInfo;
import com.question.dto.UserLoginDto;
import com.question.entity.Grade;
import com.question.entity.User;
import com.question.entity.UserGrade;
import com.question.mapper.GradeMapper;
import com.question.mapper.UserGradeMapper;
import com.question.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private SessionService sessionService;

    @Autowired
    private UserGradeMapper userGradeMapper;

    @Autowired
    private GradeMapper gradeMapper;

    public User login(UserLoginDto userLoginDto) {
        return userMapper.login(userLoginDto.getUsername(), userLoginDto.getPassword(), userLoginDto.getRole());
    }

    public ResponseInfo editPassword(User user) {
        User currentUser = sessionService.getCurrentUser();
        user.setId(currentUser.getId());
        user.setRole(currentUser.getRole());

        if (!user.getNewPassword().equals(user.getRepeatPassword())) {
            return new ResponseInfo(false, "两次输入的密码不正确");
        }

        User existedUser = searchUser(user);
        if (existedUser == null) {
            return new ResponseInfo(false, "输入信息有误，无权修改密码");
        }
        userMapper.updatePassword(user);
        return ResponseInfo.SUCCESS;
    }

    private User searchUser(User user) {
        if (user.getRole().equals("ADMIN")) {
            return userMapper.findForAdmin(user);
        } else {
            return userMapper.findForStudentAndTeacher(user);
        }
    }

    public ResponseInfo add(User user) {
        User existedUser = userMapper.findByUsername(user.getUsername());
        if (existedUser != null) {
            return new ResponseInfo(false, "用户ID已被使用");
        }
        userMapper.insert(user);
        user.getGrade().forEach(gradeId -> {
            UserGrade userGrade = UserGrade.builder().userId(user.getId()).gradeId(gradeId).build();
            userGradeMapper.insert(userGrade);
        });
        return ResponseInfo.SUCCESS;
    }

    public ResponseInfo edit(User user) {
        User existedUser = userMapper.detail(user.getId());
        if(!existedUser.getUsername().equals(user.getUsername())) {
            if (userMapper.findByUsername(user.getUsername()) != null) {
                return new ResponseInfo(false, "用户ID已被使用");
            }
        }
        userGradeMapper.deleteByUserId(user.getId());

        userMapper.update(user);
        user.getGrade().forEach(gradeId -> {
            UserGrade userGrade = UserGrade.builder().userId(user.getId()).gradeId(gradeId).build();
            userGradeMapper.insert(userGrade);
        });
        return ResponseInfo.SUCCESS;
    }

    public ResponseInfo delete(Integer id) {
        userMapper.delete(id);
        userGradeMapper.deleteByUserId(id);
        return ResponseInfo.SUCCESS;
    }

    public User detail(Integer id) {
        User user = userMapper.detail(id);
        List<Integer> grades = userGradeMapper.findByUserId(user.getId()).stream().map(UserGrade::getGradeId).collect(Collectors.toList());
        user.setGrade(grades);
        return user;
    }

    public List<User> list() {
        return userMapper.list().stream().map(user -> {
            String gradeName = userGradeMapper.findByUserId(user.getId()).stream().map(userGrade -> {
                return gradeMapper.find(userGrade.getGradeId());
            }).map(Grade::getName).collect(Collectors.joining(","));
            user.setGradeName(gradeName);
            return user;
        }).collect(Collectors.toList());
    }
}
