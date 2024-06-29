package com.FullyStar.controller;
import com.FullyStar.pojo.Result;
import com.FullyStar.service.FileService;
import com.FullyStar.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.concurrent.CompletableFuture;
@CrossOrigin
@RestController
public class FileController {

    @Autowired
    private UserService userService;

//    public CompletableFuture<Void> asyncWrite() {
//        // 创建CompletableFuture实例
//        CompletableFuture<Void> future = CompletableFuture.runAsync(() -> {
//            // 调用另一个函数
//            try {
//                System.out.println("开始异步写入");
//                fileService.Start();
//            } catch (IOException | InterruptedException e) {
//                throw new RuntimeException(e);
//            }
//        });
//
//        return future;
//    }

    @RequestMapping("/WriteFile")
    public Result WriteFile() throws Exception {
        userService.startDB();
        return Result.success("操作成功");
    }
}


