package com.FullyStar.mapper;
import com.FullyStar.pojo.Book;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface BookMapper {
    @Select("select * from books_data")
    Book[] findAllBook();

    @Select("select * from books_data where book_ID = #{book_ID}")
    Book findBookByID(String book_ID);

    @Update("update books_data set book_state=#{state} where book_ID=#{book_ID}")
    void setBookState(String book_ID,String state);

    @Select("select * from books_data where book_name like #{keyword}")
    Book[] bookSearch(String keyword);
}
