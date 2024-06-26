package com.FullyStar.controller;
import com.FullyStar.pojo.Customer;
import com.FullyStar.pojo.Result;
import com.FullyStar.service.FileService;
import com.FullyStar.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedReader;
import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;

@RestController
public class ReadFileController {
    @Autowired
    private FileService fileService;

    @RequestMapping("/ReadFile")
    public Result readFile() throws Exception {
        BufferedReader reader = new BufferedReader(new FileReader("F:\\学习\\大数据实时计算\\FullyStar\\src\\main\\resources\\CustomerDatas.csv"));//换成你的文件名
        reader.readLine();//第一行信息，为标题信息，不用,如果需要，注释掉
        String line = null;
        //从csv文件中挑选部分数据创建Customer对象
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        while ((line = reader.readLine()) != null) {
            String data[] = line.split(",");//CSV格式文件为逗号分隔符文件，这里根据逗号切分
            Integer Customer_ID = Integer.parseInt(data[0]);
            Date Purchase_Date = ft.parse(data[1]);
            String Product_Category = data[2];
            Integer Product_Price = Integer.parseInt(data[3]);
            Integer Quantity = Integer.parseInt(data[4]);
            Integer Total_Purchase_Amount = Integer.parseInt(data[5]);
            String Payment_Method = data[6];
            Integer Customer_Age = Integer.parseInt(data[7]);
            String Customer_Gender = data[8];
            Integer Churn = Integer.parseInt(data[9]);
            Customer customer = new Customer(Customer_ID, Purchase_Date, Product_Category, Product_Price, Quantity, Total_Purchase_Amount, Payment_Method, Customer_Age, Customer_Gender, Churn);
            fileService.save(Customer_ID,Purchase_Date, Product_Category, Product_Price, Quantity, Total_Purchase_Amount, Payment_Method, Customer_Age, Customer_Gender, Churn);
            //将Customer对象存入数据库
            System.out.println("4846846");
            Thread.sleep(3000);
        }
        return null;
    }
    //自定义的方法fun,打印message里的keywords
//    private static String fun(Customer message) {
//        String kw = message.getKetWords();
//        System.out.println(kw);
//        System.out.println("#########");
//        return kw;
//    }
}
