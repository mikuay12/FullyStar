package com.FullyStar.mapper;
import com.FullyStar.pojo.Result;
import ru.yandex.clickhouse.ClickHouseConnection;
import ru.yandex.clickhouse.ClickHouseDataSource;
import ru.yandex.clickhouse.settings.ClickHouseProperties;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


public class ClickhouseMapper {
    private static String username = "default";
    private static String password = "";
    private static String address = "jdbc:clickhouse://centos1:8123";
    private static String db = "default";
    private static int socketTimeout = 600000;


    /* 查询数据*/
    public static Result queryTable(String table){
        Connection connection = getConn();
        String sql = "";
        switch(table){
            case "PaymentMethod":
                sql = "select key,sum(value) from PaymentMethod group by key;";
                ArrayList<Map<String,String>>data = new ArrayList<>();
                try {
                    Statement statement = connection.prepareStatement(sql);
                    ResultSet rs  = statement.executeQuery(sql);
                    Double sum = 0.0;
                    while(rs.next()){
                        Map<String,String>map = new HashMap<>();
                        map.put("value",rs.getString("sum(value)"));
                        map.put("name",rs.getString("key"));
                        sum += Double.parseDouble(rs.getString("sum(value)"));
                        data.add(map);
                    }
                    for(Map<String,String>map : data){
                        map.put("value",String.format("%.2f", Double.parseDouble(map.get("value")) / sum));
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return Result.success(data);
            case "SaleCount":
                sql = "select key,sum(value) from SaleCount group by key;";
                ArrayList<ArrayList<String>>list = new ArrayList<>();
                ArrayList<String>key = new ArrayList<>();
                ArrayList<String>value = new ArrayList<>();
                try {
                    Statement statement = connection.prepareStatement(sql);
                    ResultSet rs  = statement.executeQuery(sql);
                    while(rs.next()){
                        key.add(rs.getString("key"));
                        value.add(rs.getString("sum(value)"));
                    }
                    list.add(key);
                    list.add(value);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return Result.success(list);
            case "TotalSale":
                sql = "select sum(value) from TotalSale;";
                try {
                    Statement statement = connection.prepareStatement(sql);
                    ResultSet rs  = statement.executeQuery(sql);
                    if(rs.next())
                        return Result.success(Double.parseDouble(rs.getString("sum(value)")));
                    else
                        return Result.error("查询错误");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                return Result.error("未找到该表");
        }
        return Result.error("未找到该表");
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
