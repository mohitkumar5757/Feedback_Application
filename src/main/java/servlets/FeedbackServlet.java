package servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Get session user (email)
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("user");

        // Agar user login nahi hai
        if(userEmail == null){
            response.sendRedirect(request.getContextPath() + "/login.jsp?msg=loginRequired");
            return;
        }

        // Get form data
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        String url = "jdbc:mysql://localhost:3306/feedback_db";
        String username = "root";
        String dbPassword = "Sunkavi@2003";

        String query = "INSERT INTO feedback (user_email, phone, message) VALUES (?, ?, ?)";

        try {
            // Load driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connection
            Connection con = DriverManager.getConnection(url, username, dbPassword);
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, userEmail);
            ps.setString(2, phone);
            ps.setString(3, message);

            int result = ps.executeUpdate();

            if(result > 0){
                // Success
                response.sendRedirect(request.getContextPath() + "/feedbackForm.jsp?success=1");
            } else {
                // Fail
                response.sendRedirect(request.getContextPath() + "/feedbackForm.jsp?error=1");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/feedbackForm.jsp?error=server");
        }
    }
}