package com.RealtimeClaculation.bean;

import lombok.Data;
import java.util.Date;

@Data
public class Customer {
    private Integer Customer_ID;
    private Date Purchase_Date;
    private String Product_Category;
    private Integer Product_Price;
    private Integer Quantity;
    private Integer Total_Purchase_Amount;
    private String Payment_Method;
    private Integer Customer_Age;
    private Double Returns;
    private String Customer_Name;
    private String Gender;
    private Integer Churn;


}
