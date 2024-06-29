package com.FullyStar.controller;
import com.FullyStar.pojo.Book;
import com.FullyStar.pojo.Result;
import com.FullyStar.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController
public class BookController {
    @Autowired
    private BookService bookService;

    @PostMapping("/FindAllBook")
    public Result findAllBook(){
        return Result.success(bookService.findAllBook());
    }

    @PostMapping("/BanBook")
    public Result banBook(String book_ID){
        Book book = bookService.findBookByID(book_ID);
        if(book == null)
            return Result.error("该书不存在");
        if(book.getBook_state().equals("上架中"))
            bookService.setBookState(book_ID,"待审核");
        else
            bookService.setBookState(book_ID,"上架中");
        return Result.success("操作成功");
    }

    @PostMapping("/BookDetail")
    public Result findBookByID(String book_ID){
        Book book = bookService.findBookByID(book_ID);
        return Result.success(book);
    }

    @PostMapping("/BookSearch")
    public Result bookSearch(String keyword){
        return Result.success(bookService.bookSearch(keyword));
    }



}
