package com.FullyStar.mapper;

import com.FullyStar.pojo.Customer;
import com.FullyStar.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

public interface FileMapper {

    @Insert("INSERT INTO customerdatas(customer_id, purchase_date, product_category, product_price, quantity, total_purchase_amount, payment_method, customer_age, customer_gender, churn) VALUES(#{customer_id}, #{purchase_date}, #{product_category}, #{product_price}, #{quantity}, #   {total_purchase_amount}, #{payment_method}, #{customer_age}, #{customer_gender}, #{churn})")
    void save(Integer customer_id, Date purchase_date, String product_category, Integer product_price, Integer quantity, Integer total_purchase_amount, String payment_method, Integer customer_age, String customer_gender, Integer churn);


}
