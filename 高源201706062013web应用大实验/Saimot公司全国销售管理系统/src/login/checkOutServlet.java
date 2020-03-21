package login;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "checkOutServlet",urlPatterns = {"/checkOut"})
public class checkOutServlet extends HttpServlet {
    DataSource dataSource;
    public void init(){
        try{
            Context context=new InitialContext();
            dataSource=(DataSource)context.lookup("java:comp/env/jdbc/testDS");
        }
        catch (NamingException ne){
            System.out.println("Exception:"+ne);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        //如果未登录则返回首页
        if("".equals(username)||username==null){
            String resultMessage="请先登录后再购买";
            session.setAttribute("resultMessage",resultMessage);
            response.sendRedirect("index.jsp");
        }
        else{
            int boughtNumber=Integer.parseInt(request.getParameter("boughtnumber"));
            String goodsName=(String)session.getAttribute("goodsName");
            float value=(float)session.getAttribute("value");
            int storeNumber=(int)session.getAttribute("storeNumber");
            float sumMoney=value*boughtNumber;
            //库存量不足不允许购买
            if(boughtNumber>storeNumber){
                String resultMessage="购买量大于库存";
                session.setAttribute("resultMessage",resultMessage);
                response.sendRedirect("index.jsp");
            }
            else{
                try {
                    Connection connection = dataSource.getConnection();
                    String sql = "insert into paied values(?,?,?,?)";
                    PreparedStatement pstmt = connection.prepareStatement(sql);
                    pstmt.setString(1, username);
                    pstmt.setString(2, goodsName);
                    pstmt.setInt(3,boughtNumber);
                    pstmt.setFloat(4,sumMoney);
                    int rows=pstmt.executeUpdate();
                    if(rows>0){//成功插入
                        String sql1="update goods set storeNumber-=? where name=?";
                        pstmt=connection.prepareStatement(sql1);
                        pstmt.setInt(1,boughtNumber);
                        pstmt.setString(2,goodsName);
                        int row2=pstmt.executeUpdate();
                        if(row2>0){
                            //查看这个用户总共购买的金额，若超过1000，升为2级会员，
                            //若大于5000,升为3级会员
                            //若大于10000,升为四级会员
                            String sql2="select sum(sumMoney) from paied group by username having username=?";
                            pstmt=connection.prepareStatement(sql2);
                            pstmt.setString(1,username);
                            ResultSet rst=pstmt.executeQuery();
                            if(rst.next()){
                                //得到总交易额
                                Float sumTradeMoney=rst.getFloat(1);
                                int Rank=1;//会员等级
                                if(sumTradeMoney>10000){
                                    Rank=4;
                                }
                                else if(sumTradeMoney>5000){
                                    Rank=3;
                                }
                                else if(sumTradeMoney>1000){
                                    Rank=2;
                                }
                                else {
                                    Rank=1;
                                }
                                String sql3="update customer set creditRank=? where username=?";
                                pstmt=connection.prepareStatement(sql3);
                                pstmt.setInt(1,Rank);
                                pstmt.setString(2,username);
                                int row3=pstmt.executeUpdate();
                                if(row3>0){
                                    session.setAttribute("Rank",Rank);
                                    pstmt.close();
                                    connection.close();
                                    String resultMessage="购买成功";
                                    session.setAttribute("resultMessage",resultMessage);
                                    response.sendRedirect("index.jsp");
                                }
                            }
                        }
                    }
                }
                catch (SQLException E){
                    System.out.println("EXCEPTION"+E);
                }
            }
        }
    }
}
