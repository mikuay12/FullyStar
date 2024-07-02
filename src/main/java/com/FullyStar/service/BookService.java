package com.FullyStar.service;

import com.FullyStar.pojo.Book;
import com.FullyStar.pojo.Result;

public interface BookService {
    Book[] findAllBook();

    Book findBookByID(String book_ID);

    void setBookState(String book_ID,String state);

    Book[] bookSearch(String keyword);

    void addBook(Book book);
}
