package com.FullyStar.controller;

import com.FullyStar.pojo.Result;
import com.FullyStar.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping("/Comment")
    Result comment(String comment_user, String comment_book, String comment_content){
        commentService.comment(comment_user,comment_book,comment_content);
        return Result.success("评论成功");
    }
}
