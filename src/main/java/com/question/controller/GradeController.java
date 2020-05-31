package com.question.controller;

import com.question.dto.ResponseInfo;
import com.question.entity.Grade;
import com.question.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/grade")
public class GradeController {

    @Autowired
    private GradeService gradeService;

    @PostMapping("/save")
    public ResponseInfo save(@ModelAttribute Grade grade) {

        return gradeService.save(grade);
    }

    @PostMapping("/edit")
    public ResponseInfo edit(@ModelAttribute Grade grade) {

        return gradeService.edit(grade);
    }

    @PostMapping("/delete")
    public ResponseInfo delete(Integer id) {

        return gradeService.delete(id);
    }

    @GetMapping("/edit")
    public ModelAndView edit(ModelAndView modelAndView, Integer id) {

        Grade grade = gradeService.detail(id);
        modelAndView.addObject("grade", grade);
        modelAndView.setViewName("/main/admin/edit-grade");
        return modelAndView;
    }

    @GetMapping("/list")
    public ModelAndView edit(ModelAndView modelAndView) {

        List<Grade> gradeList = gradeService.list();
        modelAndView.addObject("gradeList", gradeList);
        modelAndView.setViewName("/main/admin/list-grade");
        return modelAndView;
    }
}
