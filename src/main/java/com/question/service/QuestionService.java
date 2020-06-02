package com.question.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.question.dto.QuestionDto;
import com.question.dto.ResponseInfo;
import com.question.entity.Question;
import com.question.entity.QuestionItem;
import com.question.entity.User;
import com.question.entity.UserGrade;
import com.question.mapper.QuestionItemMapper;
import com.question.mapper.QuestionMapper;
import com.question.mapper.UserGradeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class QuestionService {

    private final QuestionItemMapper questionItemMapper;
    private final QuestionMapper questionMapper;
    private final SessionService sessionService;
    private final UserGradeMapper userGradeMapper;

    public ResponseInfo add(QuestionDto questionDto) {

        String itemIds = questionDto.getQuestionItems().stream()
                .map(questionItem -> {
                    questionItemMapper.insert(questionItem);
                    return questionItem.getId().toString();
                })
                .collect(Collectors.joining(","));

        Integer currentUserId = sessionService.getCurrentUserId();
        Question ques = Question.builder()
                .items(itemIds)
                .title(questionDto.getTitle())
                .teacherId(currentUserId)
                .status("DRAFT")
                .build();

        questionMapper.insert(ques);
        return ResponseInfo.SUCCESS;
    }

    public ResponseInfo publish(JSONObject jsonObject) {
        questionMapper.publish(jsonObject);
        return ResponseInfo.SUCCESS;
    }

    public ResponseInfo delete(Integer id) {
        Question question = questionMapper.findOne(id);
        List<Integer> list = Arrays.stream(question.getItems().split(",")).map(Integer::parseInt).collect(Collectors.toList());
        questionItemMapper.deleteIdIn(list);
        questionMapper.delete(id);

        return ResponseInfo.SUCCESS;
    }

    public QuestionDto detail(Integer id) {
        Question question = questionMapper.findOne(id);

        List<Integer> questionItemIds = Arrays.stream(question.getItems().split(",")).map(Integer::parseInt).collect(Collectors.toList());
        List<QuestionItem> questionItems = questionItemMapper.findByIdIn(questionItemIds);
        return QuestionDto.builder()
                .title(question.getTitle())
                .id(question.getId())
                .questionItems(questionItems)
                .build();
    }

    public List<QuestionDto> getDetailWithUserId() {
        List<Integer> gradeIds = userGradeMapper.findByUserId(sessionService.getCurrentUserId())
                .stream().map(UserGrade::getGradeId).collect(Collectors.toList());

        return questionMapper.findByGradeIn(gradeIds).stream().map(question -> QuestionDto.builder()
                .id(question.getId())
                .title(question.getTitle())
                .status(question.getStatus())
                .gradeName(question.getGradeName())
                .gradeId(question.getGradeId())
                .teacherId(question.getTeacherId())
                .teacherName(question.getTeacherName())
                .build()).collect(Collectors.toList());
    }

    public List<QuestionDto> list() {
        Integer currentUserId = sessionService.getCurrentUserId();
        List<Question> questions = questionMapper.list(currentUserId);
        return questions.stream().map(question -> QuestionDto.builder()
                .id(question.getId())
                .title(question.getTitle())
                .status(question.getStatus())
                .gradeName(question.getGradeName())
                .gradeId(question.getGradeId())
                .teacherId(question.getTeacherId())
                .teacherName(question.getTeacherName())
                .build()).collect(Collectors.toList());
    }

}
