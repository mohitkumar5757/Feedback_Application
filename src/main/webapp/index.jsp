<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Feedback Application</title>
    <jsp:include page="assets/links/cssLinks.jsp"/>
</head>
<body>

<jsp:include page="components/header.jsp"/>

<div class="main-content d-flex justify-content-center align-items-center text-center">

    <div class="p-4 rounded shadow-sm bg-white">

        <h1 class="fw-bold mb-3">
            Welcome to <span style="color:#00d4ff;">Feedback System</span>
        </h1>

        <p class="text-muted mb-4">
            We value your feedback. Help us improve our services.
        </p>

        <a href="<%=request.getContextPath()%>/feedbackForm.jsp" class="btn btn-info">
            Give Feedback
        </a>

    </div>

</div>

<jsp:include page="components/footer.jsp"/>

</body>
</html>