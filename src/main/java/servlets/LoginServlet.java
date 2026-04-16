package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String url = "jdbc:mysql://localhost:3306/feedback_db";
        String username = "root";
        String dbPassword = "Sunkavi@2003";

        String query = "SELECT * FROM users WHERE email=? AND password=?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, dbPassword);
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                // LOGIN SUCCESS
                HttpSession session = request.getSession();
                session.setAttribute("user", email);

                response.sendRedirect("index.jsp");

            } else {
                // LOGIN FAILED → redirect with message
                response.sendRedirect("login.jsp?error=invalid");
            }

            rs.close();
            ps.close();
            con.close();

        } catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=server");
        }
    }
}