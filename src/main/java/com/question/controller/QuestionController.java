package com.question.controller;

import com.alibaba.fastjson.JSONObject;
import com.question.dto.QuestionDto;
import com.question.dto.ResponseInfo;
import com.question.entity.Grade;
import com.question.service.GradeService;
import com.question.service.QuestionService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/question")
@RequiredArgsConstructor
public class QuestionController {

    private final QuestionService questionService;
    private final GradeService gradeService;

    @GetMapping
    public ModelAndView test(ModelAndView modelAndView) {
        modelAndView.setViewName("main/question/test");
        return modelAndView;
    }

    @PostMapping("/save")
    public ResponseInfo save(@RequestBody QuestionDto questionDto) {
        return questionService.add(questionDto);
    }

    @PostMapping("/publish")
    public ResponseInfo publish(@RequestBody JSONObject jsonObject) {
        return questionService.publish(jsonObject);
    }

    @PostMapping("/delete")
    public ResponseInfo delete(Integer id) {
        return questionService.delete(id);
    }

    @GetMapping("/edit")
    public QuestionDto edit(Integer id) {
        return questionService.detail(id);
    }

    @GetMapping("/edit-page")
    public ModelAndView editPage(ModelAndView modelAndView, Integer id) {
        modelAndView.setViewName("main/teacher/doQuestionView");
        modelAndView.addObject("id", id);
        return modelAndView;
    }

    @GetMapping("/list")
    public ModelAndView list(ModelAndView modelAndView) {
        List<QuestionDto> questionDtoList = questionService.list();
        List<Grade> gradeList = gradeService.list();
        modelAndView.setViewName("main/teacher/question-list");
        modelAndView.addObject("questionDtoList", questionDtoList);
        modelAndView.addObject("gradeList", gradeList);
        return modelAndView;
    }

    @GetMapping("/grade/list")
    public List<Grade> gradeList() {
        return gradeService.list();
    }
}
