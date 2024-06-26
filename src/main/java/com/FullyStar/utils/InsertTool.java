package com.FullyStar.utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertTool {
    // 数据库连接参数

    public static void startDB() {
        String url = "jdbc:mysql://localhost:3306/javawebproject"; // 数据库的URL，根据实际情况修改
        String user = "root"; // 数据库用户名
        String password = "123456"; // 数据库密码
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // 1. 注册 JDBC 驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            BufferedReader reader = new BufferedReader(new FileReader("C:\\RinCode\\FullyStar\\src\\main\\resources\\CustomerDatas.csv"));
            reader.readLine(); // Skip the header line
            // 2. 打开一个连接
            conn = DriverManager.getConnection(url, user, password);

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

                String sql = "insert into customer VALUES(?,?,?,?,?,?,?)";
                // 3. 创建 PreparedStatement 对象执行 SQL
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, Customer_ID);
                pstmt.setString(2, Purchase_Date);
                pstmt.setString(3, Product_Category);
                pstmt.setString(4, Product_Price);
                pstmt.setString(5,Quantity);
                pstmt.setString(6,Payment_Method);
                pstmt.setString(7,Customer_Age);
                int result = pstmt.executeUpdate();

                System.out.println(Customer_ID+Purchase_Date+Product_Category+Product_Price+Quantity+Payment_Method+Customer_Age );
                System.out.println(result);
                Thread.sleep(3000);
            }
            reader.close();
        } catch (SQLException | ClassNotFoundException | IOException | InterruptedException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
    }

}