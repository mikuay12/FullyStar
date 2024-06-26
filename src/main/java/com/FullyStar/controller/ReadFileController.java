package com.FullyStar.controller;
import com.FullyStar.pojo.Result;
import com.FullyStar.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.concurrent.CompletableFuture;

@RestController
public class ReadFileController {
    @Autowired
    private FileService fileService;

    public CompletableFuture<Void> asyncWrite() {
        // 创建CompletableFuture实例
        CompletableFuture<Void> future = CompletableFuture.runAsync(() -> {
            // 调用另一个函数
            try {
                System.out.println("开始异步写入");
                fileService.Start();
            } catch (IOException | InterruptedException e) {
                throw new RuntimeException(e);
            }
        });

        return future;
    }

    @RequestMapping("/WriteFile")
    public Result WriteFile() throws Exception {
        asyncWrite();
        return Result.success("操作成功");
    }
}


