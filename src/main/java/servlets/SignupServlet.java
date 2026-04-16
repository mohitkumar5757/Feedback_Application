package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String url = "jdbc:mysql://localhost:3306/feedback_db";
        String username = "root";
        String dbPassword = "Sunkavi@2003";

        String checkQuery = "SELECT * FROM users WHERE email=?";
        String insertQuery = "INSERT INTO users (email, password) VALUES (?, ?)";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, dbPassword);

            // Check if user already exists
            PreparedStatement checkPs = con.prepareStatement(checkQuery);
            checkPs.setString(1, email);

            ResultSet rs = checkPs.executeQuery();

            if(rs.next()){
                // User already exists
                response.sendRedirect("signup.jsp?error=exists");
            } else {

                // Insert new user
                PreparedStatement ps = con.prepareStatement(insertQuery);
                ps.setString(1, email);
                ps.setString(2, password);

                int result = ps.executeUpdate();

                if(result > 0){
                    // Success → redirect with message
                    response.sendRedirect("login.jsp?success=registered");
                } else {
                    response.sendRedirect("signup.jsp?error=failed");
                }

                ps.close();
            }

            rs.close();
            checkPs.close();
            con.close();

        } catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=server");
        }
    }
}