package manager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "SetGoodsServlet",urlPatterns = {"/SetGoods"})
public class SetGoodsServlet extends HttpServlet {
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
        request.setCharacterEncoding("UTF-8");
        String name=request.getParameter("name");
        float value=Float.parseFloat(request.getParameter("value"));
        String sort=request.getParameter("sort");
        String picture=request.getParameter("picture");
        int isselling=Integer.parseInt(request.getParameter("selling"));
        try{
            Connection connection=dataSource.getConnection();
            String sql="update goods set value=?,sort=?,isSelling=?,picture=? where name=?";
            System.out.println(value);
            System.out.println(name);
            PreparedStatement pstmt=connection.prepareStatement(sql);
            pstmt.setFloat(1,value);
            pstmt.setString(2,sort);
            pstmt.setInt(3,isselling);
            pstmt.setString(4,picture);
            pstmt.setString(5,name);
            int rows=pstmt.executeUpdate();
            if(rows>0){
                pstmt.close();
                connection.close();
                //保存修改成功的信息
                String message="修改成功";
                request.getSession().setAttribute("message",message);
                response.sendRedirect("/Saimot_war_exploded/backPage/manageGoods.jsp");
            }
            else{
                pstmt.close();
                connection.close();
                String changeMessage="修改失败";
                request.getSession().setAttribute("changeMessage",changeMessage);
                response.sendRedirect("/Saimot_war_exploded/backPage/manageGoods.jsp");
            }
        }
        catch (SQLException e){
            System.out.println("Exception"+e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
