package com.FullyStar.mapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapper {
    @Insert("insert into books_comments(comment_book,comment_user,comment_content) values(#{comment_book},#{comment_user},#{comment_content})")
    void comment(String comment_user,String comment_book,String comment_content);
}
