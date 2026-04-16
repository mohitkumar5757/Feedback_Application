<jsp:include page="/assets/links/cssLinks.jsp"/>
<jsp:include page="/components/header.jsp"/>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="container main-content d-flex justify-content-center align-items-center">

    <div class="card feedback-card shadow-lg p-4">

        <h3 class="text-center mb-3 fw-bold">
            Create <span class="text-highlight">Account</span>
        </h3>

        <p class="text-center text-muted mb-4">
            Signup to continue
        </p>

        <!--Messages -->
        <%
            String error = request.getParameter("error");

            if("exists".equals(error)){
        %>
        <div class="alert alert-warning text-center">
            User already exists! Please login.
        </div>
        <%
        } else if("failed".equals(error)){
        %>
        <div class="alert alert-danger text-center">
            Signup failed! Try again.
        </div>
        <%
        } else if("server".equals(error)){
        %>
        <div class="alert alert-danger text-center">
            Server error! Please try later.
        </div>
        <%
            }
        %>

        <form action="signup" method="post">

            <!-- Email -->
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control shadow-sm" placeholder="Enter your email" required>
            </div>

            <!-- Password -->
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control shadow-sm" placeholder="Enter password" required>
            </div>

            <!-- Button -->
            <div class="d-grid">
                <button type="submit" class="btn btn-info text-dark fw-semibold py-2 shadow">
                    Signup
                </button>
            </div>

            <p class="text-center mt-3">
                Already have an account?
                <a href="login.jsp">Login</a>
            </p>

        </form>

    </div>

</div>

<jsp:include page="/components/footer.jsp"/>