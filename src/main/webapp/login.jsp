<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/assets/links/cssLinks.jsp"/>
<jsp:include page="/components/header.jsp"/>

<%
  String msg = request.getParameter("msg");
  String error = request.getParameter("error");
  String success = request.getParameter("success");
%>

<div class="container main-content d-flex justify-content-center align-items-center">

  <div class="card feedback-card shadow-lg p-4">

    <h3 class="text-center mb-3 fw-bold">
      Login to <span class="text-highlight">Account</span>
    </h3>

    <p class="text-center text-muted mb-4">
      Welcome back!
    </p>

    <!-- 🔥 Login Required Message -->
    <% if("loginRequired".equals(msg)) { %>
    <div class="alert alert-warning text-center">
      Please login first to give feedback
    </div>
    <% } %>

    <!-- 🔥 Error Messages -->
    <% if("invalid".equals(error)) { %>
    <div class="alert alert-danger text-center">
      Invalid Email or Password!
    </div>
    <% } %>

    <% if("server".equals(error)) { %>
    <div class="alert alert-danger text-center">
      Server error! Please try again later.
    </div>
    <% } %>

    <!-- 🔥 Success Message -->
    <% if("registered".equals(success)) { %>
    <div class="alert alert-success text-center">
      Signup successful! Please login.
    </div>
    <% } %>

    <!-- 🔥 Form -->
    <form action="<%=request.getContextPath()%>/login" method="post" autocomplete="off">

      <!-- Email -->
      <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="email" name="email" class="form-control shadow-sm" placeholder="Enter your email" required autocomplete="off">
      </div>

      <!-- Password -->
      <div class="mb-3">
        <label class="form-label">Password</label>
        <input type="password" name="password" class="form-control shadow-sm" placeholder="Enter your password" required autocomplete="new-password">
      </div>

      <!-- Button -->
      <div class="d-grid">
        <button type="submit" class="btn btn-info text-dark fw-semibold py-2 shadow">
          Login
        </button>
      </div>

      <p class="text-center mt-3">
        Don't have an account?
        <a href="<%=request.getContextPath()%>/signup.jsp">Signup</a>
      </p>

    </form>

  </div>

</div>

<jsp:include page="/components/footer.jsp"/>