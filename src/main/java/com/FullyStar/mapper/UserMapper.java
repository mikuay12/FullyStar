package com.FullyStar.mapper;

import com.FullyStar.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserMapper {
    @Select("select * from users_data where username=#{username}")
    User findByUsername(String username);

    @Insert("insert into users_data(username,password) values(#{username},#{password})")
    void register(String username, String password);

    @Select("select * from users_data where username=#{username} and password=#{password}")
    User login(String username, String password);

    @Update("update users_data set user_power=#{power} where username=#{username}")
    void setPower(String username,String power);

    @Update("update users_data set user_name=#{user_name},user_age=#{user_age},user_sex=#{user_sex},user_phone=#{user_phone},user_birth=#{user_birth} where username=#{username}")
    void editUserInfo(String username, String user_name, String user_age, String user_sex, String user_phone, String user_birth);

    @Update("update users_data set password=#{password} where username=#{username}")
    void resetPassword(String username,String password);

    @Insert("insert into customer VALUES(#{customer_id}, #{purchase_date}, #{product_category}, #{product_price}, #{quantity}, #{payment_method}, #{customer_age})")
    void startDB(String customer_id, String purchase_date, String product_category, String product_price, String quantity,String payment_method, String customer_age);

}
