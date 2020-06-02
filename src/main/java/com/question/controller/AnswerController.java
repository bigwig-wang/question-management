package com.question.controller;

import com.question.dto.QuestionDto;
import com.question.dto.ResponseInfo;
import com.question.service.QuestionService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/answer")
@RequiredArgsConstructor
public class AnswerController {

    private final QuestionService questionService;

    @GetMapping("/list")
    public ModelAndView list(ModelAndView modelAndView) {
        modelAndView.setViewName("/main/student/answer-list");
        List<QuestionDto> questionList = questionService.getDetailWithUserId();
        modelAndView.addObject("questionList", questionList);
        return modelAndView;
    }

    @PostMapping("/submit")
    public ResponseInfo submit() {
        return ResponseInfo.SUCCESS;
    }

    @GetMapping("/edit-page")
    public ModelAndView editPage(ModelAndView modelAndView, Integer id) {
        modelAndView.setViewName("main/teacher/doQuestionView");
        modelAndView.addObject("id", id);
        return modelAndView;
    }
}
