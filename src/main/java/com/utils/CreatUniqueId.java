package com.utils;

public class CreatUniqueId {
    public static String UniqueId(){
        int last=(int) (Math.random()*(999-100)+100);
        return String.valueOf(System.currentTimeMillis())+last;
    }
}
