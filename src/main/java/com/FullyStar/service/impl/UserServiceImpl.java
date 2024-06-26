package com.FullyStar.service.impl;
import com.FullyStar.mapper.UserMapper;
import com.FullyStar.pojo.User;
import com.FullyStar.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User findByUsername(String username) {
        User u = userMapper.findByUsername(username);
        return u;
    }

    @Override
    public void register(String username, String password) {
        userMapper.register(username,password);
    }

    @Override
    public User login(String username, String password) {
        return userMapper.login(username, password);
    }

    @Override
    public void setPower(String username, String power) {
        userMapper.setPower(username, power);
    }


    @Override
    public void editUserInfo(String username, String user_name, String user_age, String user_sex, String user_phone, String user_birth) {
        userMapper.editUserInfo(username,user_name,user_age,user_sex,user_phone,user_birth);
    }

    public void resetPassword(String username, String password) {
        userMapper.resetPassword(username, password);
    }

    @Override
    public void startDB() throws IOException, InterruptedException {
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
            String Quantity = data[4];
            String Payment_Method = data[5];
            String Customer_Age = data[6];
            System.out.println("test");

            System.out.println(Customer_ID+Purchase_Date+Product_Category+Product_Price+Quantity+Payment_Method+Customer_Age );

            userMapper.startDB(Customer_ID, Purchase_Date, Product_Category, Product_Price, Quantity, Payment_Method, Customer_Age);
            System.out.println("test2");
            Thread.sleep(3000);
        }
        reader.close();
    }
}
