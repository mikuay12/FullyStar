package com.FullyStar.pojo;
import lombok.Data;

@Data
public class Comment {
    private Integer comment_id;
    private String comment_book;
    private String comment_user;
    private String comment_content;
}
