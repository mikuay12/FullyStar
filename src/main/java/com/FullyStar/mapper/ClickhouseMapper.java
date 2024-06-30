package com.FullyStar.mapper;
import com.FullyStar.pojo.Result;
import ru.yandex.clickhouse.ClickHouseConnection;
import ru.yandex.clickhouse.ClickHouseDataSource;
import ru.yandex.clickhouse.settings.ClickHouseProperties;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class ClickhouseMapper {
    private static String username = "default";
    private static String password = "";
    private static String address = "jdbc:clickhouse://centos1:8123";
    private static String db = "default";
    private static int socketTimeout = 600000;
    public static void main(String[] args) throws Exception {

//        Map<String,String>map = ClickhouseMapper.queryTable("test");
//        // 使用 entrySet() 方法遍历并打印键值对
//        for (Map.Entry<String, String> entry : map.entrySet()) {
//            System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
//        }

    }



    /* 查询数据*/
    public static Result queryTable(String table){

        switch(table){
            case "PaymentMethod":
                username = "default";
                password = "";
                address = "jdbc:clickhouse://centos1:8123";
                db = "default";
                socketTimeout = 600000;
                break;
            case "SaleCount":
                username = "default";
                password = "";
                address = "jdbc:clickhouse://centos1:8123";
                db = "default";
                socketTimeout = 600000;
                break;
            case "TotalSale":



                break;
            default:
                return Result.error("未找到该表");
        }


        String sql = "select key,sum(value) from " + table + " group by key;";
        Connection connection = getConn();
//        Map<String, String> map = new HashMap<>();
        ArrayList<ArrayList<String>>list = new ArrayList<>();
        ArrayList<String>key = new ArrayList<>();
        ArrayList<String>value = new ArrayList<>();
        try {
            Statement statement = connection.prepareStatement(sql);
            ResultSet rs  = statement.executeQuery(sql);
            while(rs.next()){
                key.add(rs.getString("key"));
                value.add(rs.getString("sum(value)"));
//                map.put(rs.getString("key"),rs.getString("sum(value)"));

            }
            list.add(key);
            list.add(value);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //将数据封装到图里
        return list;
    }

    public static Connection getConn() {
        ClickHouseProperties properties = new ClickHouseProperties();
        properties.setUser(username);
        properties.setPassword(password);
        properties.setDatabase(db);
        properties.setSocketTimeout(socketTimeout);
        ClickHouseDataSource clickHouseDataSource = new ClickHouseDataSource(address, properties);
        ClickHouseConnection conn = null;
        try {
            conn = clickHouseDataSource.getConnection();
            System.out.println("连接成功");
            return conn;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
