package login;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet",urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {
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
        try {
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            Connection connection=dataSource.getConnection();
            String sql="insert into customer values (?,?,1);";//用户初始等级都为一
            PreparedStatement pstmt=connection.prepareStatement(sql);
            pstmt.setString(1,username);
            pstmt.setString(2,password);
            int rows=pstmt.executeUpdate();
            if(rows>0){
                System.out.println("created customer successfuly");
                HttpSession session=request.getSession();
                session.setAttribute("username",username);
                int Rank=1;
                session.setAttribute("Rank",Rank);
                pstmt.close();
                connection.close();
                RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request,response);
            }
            else {
                pstmt.close();
                connection.close();
                response.sendRedirect("/Saimot_war_exploded/forntPage/login.html");
            }
        }
        catch (SQLException e ){
            System.out.println(e);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
