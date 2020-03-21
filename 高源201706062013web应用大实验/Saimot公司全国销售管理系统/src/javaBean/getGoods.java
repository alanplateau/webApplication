package javaBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class getGoods {
    DataSource dataSource;
    ArrayList<goods> flowerList;
    ArrayList<goods> usefulList;
    ArrayList<goods> decorationList;
    ArrayList<goods> allList;
    public getGoods(){
        try{
            Context context=new InitialContext();
            dataSource=(DataSource)context.lookup("java:comp/env/jdbc/testDS");
            flowerList=new ArrayList<goods>();
            usefulList=new ArrayList<goods>();
            decorationList=new ArrayList<goods>();
            allList=new ArrayList<goods>();
        }
        catch (NamingException ne){
            System.out.println("Exception:"+ne);
        }
    }

    public  ArrayList getFlower(){
        try{
            flowerList.clear();
            Connection connection=dataSource.getConnection();
            String sql="select * from goods where sort='flower'";
            Statement statement=connection.createStatement();
            ResultSet rst=statement.executeQuery(sql);
            while (rst.next()){
                if(rst.getBoolean(6)) {
                    goods temp = new goods();
                    temp.setName(rst.getString(1));
                    temp.setValue(rst.getFloat(2));
                    temp.setSort(rst.getString(3));
                    temp.setPicture(rst.getString(4));
                    temp.setStoreNumber(rst.getInt(5));
                    temp.setSelling(rst.getBoolean(6));
                    flowerList.add(temp);
                }
            }
            rst.close();
            statement.close();
            connection.close();
            return flowerList;
        }
        catch (SQLException e){
            System.out.println("Exception"+e);
            return flowerList;
        }
    }

    public  ArrayList getUseful(){
        try{
            usefulList.clear();
            Connection connection=dataSource.getConnection();
            String sql="select * from goods where sort='useful'";
            Statement statement=connection.createStatement();
            ResultSet rst=statement.executeQuery(sql);
            while (rst.next()){
                if(rst.getBoolean(6)) {
                    goods temp = new goods();
                    temp.setName(rst.getString(1));
                    temp.setValue(rst.getFloat(2));
                    temp.setSort(rst.getString(3));
                    temp.setPicture(rst.getString(4));
                    temp.setStoreNumber(rst.getInt(5));
                    temp.setSelling(rst.getBoolean(6));
                    usefulList.add(temp);
                }
            }
            rst.close();
            statement.close();
            connection.close();
            return usefulList;
        }
        catch (SQLException e){
            System.out.println("Exception"+e);
            return usefulList;
        }
    }

    public  ArrayList getDecoration(){
        try{
            decorationList.clear();
            Connection connection=dataSource.getConnection();
            String sql="select * from goods where sort='decoration'";
            Statement statement=connection.createStatement();
            ResultSet rst=statement.executeQuery(sql);
            while (rst.next()){
                if(rst.getBoolean(6)) {
                    goods temp = new goods();
                    temp.setName(rst.getString(1));
                    temp.setValue(rst.getFloat(2));
                    temp.setSort(rst.getString(3));
                    temp.setPicture(rst.getString(4));
                    temp.setStoreNumber(rst.getInt(5));
                    temp.setSelling(rst.getBoolean(6));
                    decorationList.add(temp);
                }
            }
            rst.close();
            statement.close();
            connection.close();
            return decorationList;
        }
        catch (SQLException e){
            System.out.println("Exception"+e);
            return decorationList;
        }
    }

    public ArrayList getAll(){
        try{
            allList.clear();
            Connection connection=dataSource.getConnection();
            String sql="select * from goods";
            Statement statement=connection.createStatement();
            ResultSet rst=statement.executeQuery(sql);
            while (rst.next()){
                goods temp = new goods();
                temp.setName(rst.getString(1));
                temp.setValue(rst.getFloat(2));
                temp.setSort(rst.getString(3));
                temp.setPicture(rst.getString(4));
                temp.setStoreNumber(rst.getInt(5));
                temp.setSelling(rst.getBoolean(6));
               allList.add(temp);
            }
            rst.close();
            statement.close();
            connection.close();
            return allList;
        }
        catch (SQLException e){
            System.out.println("Exception"+e);
            return allList;
        }
    }
}
