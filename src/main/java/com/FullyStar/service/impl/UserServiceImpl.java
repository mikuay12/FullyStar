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

    public void deleteUser(String username) {
        userMapper.deleteUser(username);
    }
}
