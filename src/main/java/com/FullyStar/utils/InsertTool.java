package com.FullyStar.utils;

import java.io.*;

public class InsertTool {


    private static void readFile1(File fin) throws IOException {
        FileInputStream fis = new FileInputStream(fin);

        //Construct BufferedReader from InputStreamReader
        BufferedReader br = new BufferedReader(new InputStreamReader(fis));
        int index = 0;
        String line = null;
        while ((line = br.readLine()) != null) {
            System.out.println(line);
            System.out.println(index);
            index++;
        }

        br.close();
        fis.close();
    }

    public static void main(String[] args) throws IOException {
        File f = new File("C:\\RinCode\\FullyStar\\src\\main\\java\\com\\FullyStar\\utils\\ecommerce_customer_data_custom_ratios.csv");
        readFile1(f);
    }

}
