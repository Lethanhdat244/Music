/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    public static Date changeDate(String dateIn) {
        SimpleDateFormat inputDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        SimpleDateFormat outputDate = new SimpleDateFormat("dd-MM-yyyy");
        try {
            Date date = inputDate.parse(dateIn);
            return date;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Date pasteDate(String dateIn) {
        SimpleDateFormat inputDate = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = inputDate.parse(dateIn);
            return date;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String getYear(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
        String year = dateFormat.format(date);
        return year;
    }

    public static String getTime(int time) {
        String output = "";
        int minutes = time / 60;
        int second = time - minutes * 60;
        output += ((minutes < 10 ? "0" : "") + minutes + ":" + (second < 10 ? "0" : "") + second);
        return output;
    }
}
