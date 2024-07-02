package com.FullyStar.service;

import com.FullyStar.pojo.User;

import java.io.IOException;

public interface UserService {
    User findByUsername(String username);

    void register(String username, String password);
    User login(String username, String password);

    void setPower(String username, String power);

    void editUserInfo(String username, String user_name, String user_age, String user_sex, String user_phone, String user_birth);

    void resetPassword(String username, String password);

    void deleteUser(String username);
}
