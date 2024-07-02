package com.FullyStar.service.impl;
import com.FullyStar.mapper.BookMapper;
import com.FullyStar.pojo.Book;
import com.FullyStar.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;
    @Override
    public Book[] findAllBook() {
        return bookMapper.findAllBook();
    }

    @Override
    public Book findBookByID(String book_ID) {
        return bookMapper.findBookByID(book_ID);
    }

    @Override
    public void setBookState(String book_ID, String state) {
        bookMapper.setBookState(book_ID,state);
    }

    @Override
    public Book[] bookSearch(String keyword) {
        keyword="%"+keyword+"%";
        return bookMapper.bookSearch(keyword);
    }

    @Override
    public void addBook(Book book) {
        bookMapper.addBook(book);
    }
}
