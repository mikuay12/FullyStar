package com.FullyStar.controller;

import com.FullyStar.pojo.Result;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
@CrossOrigin
@RestController
public class FileUploadController {
    @PostMapping("/Upload")
    public Result upload(MultipartFile file) throws Exception{
        String originalFilenameName = file.getOriginalFilename();
        file.transferTo(new File("C:\\RinCode\\FullyStar\\src\\main\\resources\\vue-book\\public\\img\\" + originalFilenameName));
        return Result.success(originalFilenameName);
    }
}
