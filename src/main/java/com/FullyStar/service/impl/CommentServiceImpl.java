package com.FullyStar.service.impl;

import com.FullyStar.mapper.CommentMapper;
import com.FullyStar.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public void comment(String comment_user, String comment_book, String comment_content) {
        commentMapper.comment(comment_user,comment_book,comment_content);
    }
}
