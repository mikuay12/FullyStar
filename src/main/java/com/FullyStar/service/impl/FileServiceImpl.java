package com.FullyStar.service.impl;

import com.FullyStar.mapper.CommentMapper;
import com.FullyStar.mapper.FileMapper;
import com.FullyStar.service.FileService;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;

@Service
public class FileServiceImpl implements FileService {

    FileMapper fileMapper;
    @Override
    public void Start() throws IOException, InterruptedException {
        BufferedReader reader = new BufferedReader(new FileReader("C:\\RinCode\\FullyStar\\src\\main\\resources\\CustomerDatas.csv"));
        reader.readLine(); // Skip the header line

        String line = null;
//        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        while ((line = reader.readLine()) != null) {
            System.out.println(line);
            String[] data = line.split(",");
            String Customer_ID = data[0];
            String Purchase_Date = data[1];
            String Product_Category = data[2];
            String Product_Price = data[3];
            String Quantity = data[4]; // Changed to String
            String Payment_Method = data[5];
            String Customer_Age = data[6]; // Changed to String
            System.out.println("test");
            fileMapper.Start(Customer_ID, Purchase_Date, Product_Category, Product_Price, Quantity, Payment_Method, Customer_Age);
            System.out.println("test2");
            // Simulating some processing time
            Thread.sleep(3000);
        }
        reader.close();
    }
}
