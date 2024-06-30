package com.FullyStar.controller;
import com.FullyStar.utils.TokenUtil;
import io.micrometer.common.util.StringUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

public class AuthenticationInterceptor implements HandlerInterceptor {
    @Autowired
    private TokenUtil tokenUtil;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        try{
            String token = tokenUtil.getToken(request);
            if (StringUtils.isEmpty(token)) {
                response.sendRedirect("/Login");
                return false;
            }
        }
        catch (Exception e){
            response.sendRedirect("/Login");
            return false;
        }
//        查看请求中是否存在token，如果不存在直接跳转到登陆页面
        return true;
    }
}
