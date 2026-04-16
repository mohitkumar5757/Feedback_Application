<jsp:include page="/assets/links/cssLinks.jsp"/>

<nav class="navbar navbar-expand-lg navbar-dark custom-navbar shadow">
    <div class="container">

        <!-- Logo -->
        <a class="navbar-brand fw-bold" href="index.jsp">
            <i class="bi bi-chat-dots-fill me-1"></i>
            Feedback<span class="brand-highlight">App</span>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">

            <!-- Left Side -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="index.jsp">
                        <i class="bi bi-house-fill me-1"></i> Home
                    </a>
                </li>
            </ul>

            <!-- Right Side -->
            <ul class="navbar-nav ms-auto align-items-center">

                <%
                    String user = (String) session.getAttribute("user");
                    if(user == null) {
                %>

                <li class="nav-item me-2">
                    <a class="nav-link" href="<%=application.getContextPath()%>/login.jsp">
                        <i class="bi bi-box-arrow-in-right me-1"></i> Login
                    </a>
                </li>

                <li class="nav-item">
                    <a class="btn btn-info btn-sm text-dark fw-semibold" href="<%=application.getContextPath()%>/signup.jsp">
                        <i class="bi bi-person-plus-fill me-1"></i> Signup
                    </a>
                </li>

                <%
                } else {
                %>

                <li class="nav-item me-2">
                    <a class="nav-link" href="<%=application.getContextPath()%>/feedbackForm.jsp">
                        <i class="bi bi-chat-left-text-fill me-1"></i> Feedback
                    </a>
                </li>

                <li class="nav-item me-2">
                    <a class="nav-link" href="<%=request.getContextPath()%>/viewFeedback.jsp">
                        <i class="bi bi-eye-fill me-1"></i> View
                    </a>
                </li>

                <!-- User Badge -->
                <li class="nav-item me-3">
                    <span class="badge user-badge">
                        <i class="bi bi-person-circle me-1"></i> <%= user %>
                    </span>
                </li>

                <!-- Logout -->
                <li class="nav-item">
                    <a class="btn btn-danger btn-sm" href="logout">
                        <i class="bi bi-box-arrow-right me-1"></i> Logout
                    </a>
                </li>

                <%
                    }
                %>

            </ul>

        </div>
    </div>
</nav>