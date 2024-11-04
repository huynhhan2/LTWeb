<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home</title>
<%@include file="all_css.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_perfumes.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
							<h4>Add Perfumes</h4>
							---------
						</div>
					</div>
				</a>

			</div>

			<div class="col-md-3">
				<a href="all_perfumes.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-regular fa-rectangle-list fa-3x text-primary"></i><br>
							<h4>All Perfumes</h4>
							---------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-cart-shopping fa-3x text-primary"></i><br>
							<h4>Orders</h4>
							---------
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-3">
				<a href="sales.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-chart-line fa-3x text-primary"></i><br>
							<h4>Revenue</h4>
							---------
						</div>
					</div>
				</a>
			</div>
			
			
			<div class="col-md-3">
				<a href="all_account.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-regular fa-address-card fa-3x text-primary"></i><br>
							<h4>Account</h4>	
							---------
						</div>
					</div>
			</div>
			<div class="col-md-3">
				<a href="../login.jsp">

					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
							<h4>Log out</h4>	
							---------
						</div>
					</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 130px;"><%@include file="footer.jsp"%></div>

</body>
</html>