package com.FullyStar.mapper;
import org.apache.ibatis.annotations.Insert;

import java.util.Date;

public interface FileMapper {
//    @Insert("INSERT INTO customer VALUES(#{customer_id}, #{purchase_date}, #{product_category}, #{product_price}, #{quantity}, #{payment_method}, #{customer_age})")
//    void Start(String customer_id, String purchase_date, String product_category, String product_price, String quantity,String payment_method, String customer_age);

    @Insert("insert into users_data(username,password) values('100109385','zaq1xsw2')")
    void Start(String customer_id, String purchase_date, String product_category, String product_price, String quantity,String payment_method, String customer_age);

}
