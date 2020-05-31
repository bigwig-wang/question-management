package com.question.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ResponseInfo {

    public static final ResponseInfo SUCCESS = ResponseInfo.builder().success(true).build();

    private boolean success;

    private String message;

    private Object data;

    public ResponseInfo(boolean success, String message) {
        this.success = success;
        this.message = message;
    }
}
