package com.FullyStar.controller;
import com.FullyStar.pojo.Result;
import com.FullyStar.pojo.User;
import com.FullyStar.service.UserService;
import com.FullyStar.utils.TokenUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Map;

@CrossOrigin
@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private TokenUtil tokenUtil;

    @RequestMapping("/Register")
    public Result register(String username,String password){
        User u =userService.findByUsername(username);
        if(u == null){
            //没有占用，就注册
            userService.register(username, password);
            return Result.success("注册成功");
        }
        else
            return Result.error("该用户名已存在!");
    }

    @PostMapping("/Login")
    public Result login(String username, String password, HttpServletResponse res, HttpSession session){
        User u = userService.login(username, password);
        if(u == null)
            return Result.error("登录失败，请检查账号或密码是否正确");
        if(u.getUser_power().equals("ban"))
            return Result.error("您的账号已被封禁,请联系管理员!");

        String token = tokenUtil.generateToken(u);

        Cookie cookie = new Cookie("token",token);
        cookie.setMaxAge(7*24*60*60);
        cookie.setPath("/");
        res.addCookie(cookie);
        return Result.success(0,"登录成功",token);
    }

    @GetMapping("/Login")
    public void login(HttpServletResponse response) throws IOException {
        response.sendRedirect("localhost:8088/Login");
    }


    @PostMapping("/BanUser")
    public Result banUser(String username, HttpSession session){
        String power = (String) session.getAttribute("user_power");
        power = "operator";
        if(power.equals("operator")){
            User u = userService.findByUsername(username);
            if(u.getUser_power().equals("ban")){
                userService.setPower(username, "user");
                return Result.success("解封成功");
            }
            if(u.getUser_power().equals("user")){
                userService.setPower(username, "ban");
                return Result.success("封禁成功");
            }

            return Result.success("不可封禁管理员");
        }
        else
            return Result.error("操作失败");
    }

    @PostMapping("/EditUserInfo")
    public Result editUserInfo(String username, String user_name, String user_age, String user_sex, String user_phone, String user_birth){
        User u =userService.findByUsername(username);
        if(u == null){
            return Result.error("操作失败，该用户不存在");
        }
        userService.editUserInfo(username,user_name,user_age,user_sex,user_phone,user_birth);
        return Result.success("修改成功");
    }

    @PostMapping("/ResetPassword")
    public Result resetPassword(String username, String password,String newpassword,String repassword){
        System.out.println(password);
        User u =userService.findByUsername(username);
        if(u == null)
            return Result.error("操作失败，该用户不存在");
        if(u.getPassword().equals(password)){
            System.out.println(u.getPassword().equals(password));

            userService.resetPassword(username,newpassword);
            return Result.success("修改成功");
        }else{
            System.out.println(u.getPassword().equals(password));
            return Result.error("原密码错误");
        }


    }

    @GetMapping("/Logout")
    public Result logout(HttpServletRequest req,HttpServletResponse res){
        Cookie[] cookies=req.getCookies();
        for(Cookie cookie: cookies){
            cookie.setMaxAge(0);
            cookie.setPath("/");
            res.addCookie(cookie);
        }
        return Result.success("登出成功");
    }

    @GetMapping("/PersonalInfo")
    public  Result<User> userInfo(@RequestHeader(name="Authorization") String token){
        JWTVerifier jwtVerifier = JWT.require(Algorithm.none()).build();
        DecodedJWT jwt = JWT.decode(token);
        String username=jwt.getAudience().get(0);
        System.out.println(jwt.getAudience().get(0));
        User user=userService.findByUsername(username);
        return Result.success(user);
    }

    @GetMapping("/DeleteUser")
    public Result deleteUser(@RequestHeader(name="Authorization") String token){
        DecodedJWT jwt = JWT.decode(token);
        String username=jwt.getAudience().get(0);
        User u =userService.findByUsername(username);
        if(u == null)
            return Result.error("操作失败，该用户不存在");
        userService.deleteUser(username);
        return Result.success("注销成功");
    }




}
