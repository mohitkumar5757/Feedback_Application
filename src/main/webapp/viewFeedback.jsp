<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/assets/links/cssLinks.jsp"/>

<%
    String user = (String) session.getAttribute("user");

    if(user == null){
        response.sendRedirect(request.getContextPath() + "/login.jsp?msg=loginRequired");
        return;
    }
%>

<jsp:include page="/components/header.jsp"/>

<div class="main-content">

    <div class="container mt-5">

        <h3 class="text-center mb-4 fw-bold">
            All <span class="text-highlight">Feedback</span>
        </h3>

        <div class="table-responsive">
            <table class="table table-bordered table-striped shadow">

                <thead class="table-dark text-center">
                <tr>
                    <th>ID</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Message</th>
                    <th>Date</th>
                </tr>
                </thead>

                <tbody class="text-center">

                <%
                    String url = "jdbc:mysql://localhost:3306/feedback_db";
                    String username = "root";
                    String dbPassword = "Sunkavi@2003";

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection(url, username, dbPassword);

                        String query = "SELECT * FROM feedback ORDER BY id DESC";
                        PreparedStatement ps = con.prepareStatement(query);
                        ResultSet rs = ps.executeQuery();

                        while(rs.next()){
                %>

                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("user_email") %></td>
                    <td><%= rs.getString("phone") %></td>
                    <td><%= rs.getString("message") %></td>
                    <td><%= rs.getTimestamp("created_at") %></td>
                </tr>

                <%
                    }

                    rs.close();
                    ps.close();
                    con.close();

                } catch(Exception e){
                %>

                <tr>
                    <td colspan="5" class="text-danger">
                        Error loading data
                    </td>
                </tr>

                <%
                        e.printStackTrace();
                    }
                %>

                </tbody>

            </table>
        </div>

    </div>

</div>

<jsp:include page="/components/footer.jsp"/>