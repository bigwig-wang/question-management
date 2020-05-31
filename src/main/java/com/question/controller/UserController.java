package com.question.controller;

import com.question.dto.ResponseInfo;
import com.question.dto.UserLoginDto;
import com.question.entity.Grade;
import com.question.entity.User;
import com.question.service.GradeService;
import com.question.service.SessionService;
import com.question.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SessionService sessionService;

    @Autowired
    private GradeService gradeService;

    @PostMapping("/login")
    public ResponseInfo login(@ModelAttribute UserLoginDto userLoginDto) {
        User user = userService.login(userLoginDto);
        if(user == null) {
            return new ResponseInfo(false, "用户名或者密码错误");
        }
        sessionService.cacheLoginUser(user);

        return new ResponseInfo(true, "登录成功", user.getRole());
    }

    @PostMapping("/editPassword")
    public ResponseInfo editPassword(@ModelAttribute User user) {
        return userService.editPassword(user);
    }

    @GetMapping("/add")
    public ModelAndView save(ModelAndView modelAndView) {
        List<Grade> gradeList = gradeService.list();
        modelAndView.addObject("gradeList", gradeList);
        modelAndView.setViewName("main/admin/add-user");
        return modelAndView;
    }

    @PostMapping("/save")
    public ResponseInfo save(@ModelAttribute User user) {
        return userService.add(user);
    }

    @PostMapping("/edit")
    public ResponseInfo edit(@ModelAttribute User user) {
        return userService.edit(user);
    }

    @GetMapping("/edit")
    public ModelAndView edit(ModelAndView modelAndView, Integer id) {
        User user = userService.detail(id);
        List<Grade> gradeList = gradeService.list();
        modelAndView.addObject("user", user);
        modelAndView.addObject("gradeList", gradeList);
        modelAndView.setViewName("main/admin/edit-user");
        return modelAndView;
    }

    @GetMapping("/list")
    public ModelAndView list(ModelAndView modelAndView) {
        List<User> userList = userService.list();
        modelAndView.addObject("userList", userList);
        modelAndView.setViewName("main/admin/list-user");
        return modelAndView;
    }

    @PostMapping("delete")
    public ResponseInfo delete(Integer id) {
        return userService.delete(id);
    }
}
