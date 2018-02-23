package com.lsieun.entity;

public class User {
    private int id;
    private String name;
    private String sex;

    public int getId(){
        return this.id;
    }
    public void setId(int id){
        this.id = id;
    }

    public String getName(){
        return this.name;
    }
    public void setName(String name){
        this.name = name;
    }

    public String getSex(){
        return this.sex;
    }
    public void setSex(String sex){
        this.sex = sex;
    }
}
