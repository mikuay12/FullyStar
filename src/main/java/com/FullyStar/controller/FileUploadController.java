package com.FullyStar.controller;

import com.FullyStar.pojo.Result;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@RestController
public class FileUploadController {
    @PostMapping("/Upload")
    public Result upload(MultipartFile file) throws Exception{
        String originalFilenameName = file.getOriginalFilename();
        file.transferTo(new File("C:\\RinCode\\FullyStar\\src\\main\\resources\\" + originalFilenameName));
        return Result.success("上传成功");
    }
}
