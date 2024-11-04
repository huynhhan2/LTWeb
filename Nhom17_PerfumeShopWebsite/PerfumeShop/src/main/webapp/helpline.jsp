<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <%@include file="all_component/all_css.jsp"%>
    <!-- Include Bootstrap CSS if not already included -->
</head>
<body style="background-color: #f0f1f2;">

    <%@include file="all_component/navbar.jsp"%>

    <div class="container mt-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-6 text-center">
                <div class="text-success">
                    <span class="fas fa-envelope fa-5x"></span>
                </div>
                <h3 class="mt-3">Contact Us</h3>
                <p class="mb-4">Have questions or concerns? Reach out to us!</p>
                <p class="font-weight-bold">Email: admin@gmail.com</p>
                <p class="font-weight-bold">Phone: +84 0905226923</p>
                <p class="mb-4">Our support team is available 24/7 to assist you.</p>
                <a href="index.jsp" class="btn btn-primary">Home</a>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS if needed -->
</body>
</html>
