package com.FullyStar.controller;
import com.FullyStar.mapper.ClickhouseMapper;
import com.FullyStar.pojo.Book;
import com.FullyStar.pojo.Result;
import com.FullyStar.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController
public class BookController {
    @Autowired
    private BookService bookService;

    @GetMapping("/FindAllBook")
    public Result findAllBook(){
        return Result.success(bookService.findAllBook());
    }

    @PostMapping("/BanBook")
    public Result banBook(String book_ID){
        System.out.println(book_ID);
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


    @PostMapping("/GetData")
    public Result getData1(String table){
        return ClickhouseMapper.queryTable(table);
    }

    @PostMapping("/AddBook")
    public Result addBook(Book book){
        bookService.addBook(book);
        return Result.success("添加成功");
    }
}
