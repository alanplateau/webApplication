package javaBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

public class getCustomer {
    DataSource dataSource;
    ArrayList<customer> customerList;
    ArrayList<paied> paiedList;
    public getCustomer(){
        try{
            Context context=new InitialContext();
            dataSource=(DataSource)context.lookup("java:comp/env/jdbc/testDS");
            customerList=new ArrayList<customer>();
            paiedList=new ArrayList<paied>();
        }
        catch (NamingException ne){
            System.out.println("Exception:"+ne);
        }
    }

    //查询所有顾客信息
    public ArrayList<customer> getCustomerList(){
        try{
            customerList.clear();
            Connection connection=dataSource.getConnection();
            String sql="select * from customer";
            Statement statement=connection.createStatement();
            ResultSet rst=statement.executeQuery(sql);
            while (rst.next()){
                String username=rst.getString(1);
                String passCheck=rst.getString(2);
                int creditCheck=rst.getInt(3);
                customer temp=new customer();
                temp.setUsername(username);
                temp.setPassCheck(passCheck);
                temp.setCreditRank(creditCheck);
                customerList.add(temp);
            }
            rst.close();
            statement.close();
            connection.close();
            return customerList;
        }
        catch (SQLException e){
            System.out.println("Exception"+e);
            return customerList;
        }
    }

    //查询指定顾客交易情况
    public ArrayList<paied> getSelectPaied(String username){
        paiedList.clear();
        try{
            Connection connection=dataSource.getConnection();
            String sql="select * from paied where username=? ";
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,username);
            ResultSet rst=preparedStatement.executeQuery();
            while (rst.next()){
                String goodsname=rst.getString(2);
                int number=rst.getInt(3);
                float sumMoney=rst.getFloat(4);
                paied temp=new paied();
                temp.setUsername(username);
                temp.setGoodsName(goodsname);
                temp.setNumber(number);
                temp.setSumMoney(sumMoney);
                paiedList.add(temp);
            }
            rst.close();
            preparedStatement.close();
            connection.close();
            return paiedList;
        }
        catch (SQLException e){
            System.out.println("Exception"+e);
            return paiedList;
        }
    }
}
