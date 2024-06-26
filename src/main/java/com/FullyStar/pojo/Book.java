package com.FullyStar.pojo;
import lombok.Data;
import java.util.Date;

@Data
public class Book {
    private Integer book_ID;
    private String book_name;
    private String book_author;
    private Date book_PublishDate;
    private String book_type;
    private String book_state;
    private String book_describe;
    private String book_publisher;
    private String book_ImagePath;
}
