package com.question.service;

import com.question.dto.ResponseInfo;
import com.question.entity.Grade;
import com.question.mapper.GradeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeService {

    @Autowired
    private GradeMapper gradeMapper;

    public ResponseInfo save(Grade grade) {
        Grade existedGrade = gradeMapper.findByNo(grade.getNo());
        if(existedGrade != null) {
            return new ResponseInfo(false, "该班级编号已存在");
        }

        gradeMapper.insert(grade);
        return ResponseInfo.SUCCESS;
    }

    public ResponseInfo edit(Grade grade) {
        Grade currentGrade = gradeMapper.find(grade.getId());
        if(!currentGrade.getNo().equals(grade.getNo())) {
            Grade existedGrade = gradeMapper.findByNo(grade.getNo());
            if(existedGrade != null) {
                return new ResponseInfo(false, "该班级编号已存在");
            }
        }
        gradeMapper.edit(grade);
        return ResponseInfo.SUCCESS;
    }

    public Grade detail(Integer id) {
        return gradeMapper.find(id);
    }

    public ResponseInfo delete(Integer id) {
        gradeMapper.delete(id);
        return ResponseInfo.SUCCESS;
    }

    public List<Grade> list() {
        return gradeMapper.list();
    }
}
