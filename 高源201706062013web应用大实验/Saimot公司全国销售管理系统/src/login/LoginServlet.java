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
import java.sql.*;

@WebServlet(name = "LoginServlet",urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
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
            String sql="select *from customer where username=? and passCheck=?";
            PreparedStatement pstmt=connection.prepareStatement(sql);
            pstmt.setString(1,username);
            pstmt.setString(2,password);
            ResultSet rst=pstmt.executeQuery();
            if (rst.next()){
                HttpSession session=request.getSession();
                session.setAttribute("username",username);
                int Rank=rst.getInt("creditRank");
                session.setAttribute("Rank",Rank);
                rst.close();
                pstmt.close();
                connection.close();
                RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request,response);
            }
            else {
                rst.close();
                pstmt.close();
                connection.close();
                response.sendRedirect("login.html");
            }
        }
        catch (SQLException e ){
            System.out.println(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
