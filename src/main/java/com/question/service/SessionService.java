package com.question.service;

import com.question.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class SessionService {
    @Autowired
    private HttpSession httpSession;

    public void cacheLoginUser(User user) {
        httpSession.setAttribute("user", user);
    }

    public User getCurrentUser() {
        return (User)httpSession.getAttribute("user");
    }

    public Integer getCurrentUserId() {
       return getCurrentUser() != null ? getCurrentUser().getId() : null;
    }
}
