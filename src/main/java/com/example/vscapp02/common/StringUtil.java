package com.example.vscapp02.common;

import java.text.DecimalFormat;

public class StringUtil {

    public static String convertKorean(long money){
        StringBuffer sb = new StringBuffer();
        if(money > 100000000) {
            sb.append(money/100000000);
            sb.append("억 ");
        }
        money = money%100000000;
        sb.append(money/10000);
        sb.append("만원");
        return sb.toString();
    }

    public static String addComma(long money) {
        DecimalFormat formatter = new DecimalFormat("#,###");
        return formatter.format(money);
    }

    /**
     * (length - str.length) 만큼 앞에 0을 추가한다.
     */
    public static String addZero(String str, int length) {
        String temp = "";
        for (int i = str.length(); i < length; i++)
            temp += "0";
        temp += str;
        return temp;
    }
    public static String addZero(int str, int length) {
        return addZero(String.valueOf(str), length);
    }
}
