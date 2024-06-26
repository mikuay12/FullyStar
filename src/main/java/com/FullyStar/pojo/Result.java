package com.FullyStar.pojo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Result<T> {
    private Integer code;
    private String message;
    private T data;

    public static <E> Result<E> success(E data){
        return new Result<>(0,"操作成功",data);
    }

    public static Result success(String message){
        return new Result(0,message,null);
    }

    public static Result error(String message){
        return new Result(1,message,null);
    }

}
