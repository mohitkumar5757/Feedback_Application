<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/assets/links/cssLinks.jsp"/>

<%
    String user = (String) session.getAttribute("user");

    if(user == null){
        response.sendRedirect(request.getContextPath() + "/login.jsp?msg=loginRequired");
        return;
    }

    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>

<jsp:include page="/components/header.jsp"/>

<div class="container main-content d-flex justify-content-center align-items-center">

    <div class="card feedback-card shadow-lg p-4">

        <h3 class="text-center mb-3 fw-bold">
            Give <span class="text-highlight">Feedback</span>
        </h3>

        <p class="text-center text-muted mb-4">
            We would love to hear your thoughts
        </p>

        <!-- ✅ Success Message -->
        <% if("1".equals(success)) { %>
        <div class="alert alert-success text-center">
            Feedback submitted successfully!
        </div>
        <% } %>

        <!-- ❌ Error Message -->
        <% if("1".equals(error)) { %>
        <div class="alert alert-danger text-center">
            Something went wrong!
        </div>
        <% } %>

        <form action="<%=request.getContextPath()%>/feedback" method="post" autocomplete="off">

            <!-- ❌ Email removed -->

            <div class="mb-3">
                <label class="form-label">Phone</label>
                <input type="text" name="phone" class="form-control shadow-sm" placeholder="Enter your phone number" required autocomplete="off">
            </div>

            <div class="mb-3">
                <label class="form-label">Message</label>
                <textarea name="message" class="form-control shadow-sm" rows="3" placeholder="Write your feedback" required></textarea>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-info text-dark fw-semibold py-2 shadow">
                    Submit Feedback
                </button>
            </div>

        </form>

    </div>

</div>

<jsp:include page="/components/footer.jsp"/>