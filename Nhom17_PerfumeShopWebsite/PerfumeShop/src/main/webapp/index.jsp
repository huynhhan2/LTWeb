<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.PerfumeDAOImpl"%>
<%@ page import="com.entity.PerfumeDtls"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perfume: Index</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img {
	background: url("images/banner_qc.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}

</style>

</head>
<body style="background-color: #f7f7f7;">
<c:if test="${not empty addCart}">
	
	<div id="toast"> ${addCart} </div>
	
	<script type="text/javascript">
		showToast();
		function showToast(content)
		{
			$('#toast').addClass("display");
			$('#toast').html(content);
			setTimeout(()=>{
				$('#toast').removeClass("display");
			},2000)
		}
	</script>
	<c:remove var="addCart" scope="session"/>
</c:if>
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-light"></h2>
	</div>

	<!--  -->
	<div class="container">

		<h3 class="text-center">All Perfume</h3>

		<div class="row">
			<%
			PerfumeDAOImpl dao2 = new PerfumeDAOImpl(DBConnect.getConn());
			List<PerfumeDtls> list2 = dao2.getRecentPerfumes();
			for (PerfumeDtls b : list2) {
			%>
			<div class="col-md-3.5">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="perfume/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getperfumename()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getperfumeCategory().equals("Old")) {
							%>
							Categories :<%=b.getperfumeCategory()%></p>
						<div class="row d-flex justify-content-center">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getperfumeID()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1">Add Cart</a>
							<%
							}
							%>
							<a href="view_perfumes.jsp?bid=<%=b.getperfumeID()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fas fa-dollar-sign"></i></a>
						</div>

						<%
						} else {
						%>
						Categories :<%=b.getperfumeCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getperfumeID()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1">Add Cart</a>
							<%
							}
							%>
							<!-- <a href="" class="btn btn-danger btn-sm ml-1">Add Cart</a> -->
							<a href="view_perfumes.jsp?bid=<%=b.getperfumeID()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fas fa-dollar-sign"></i></a>

						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="all_recent_perfume.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
		<!--  -->
		<hr>
		<!--  -->
		<div class="container">
			<h3 class="text-center">Hot Perfume</h3>

			<div class="row">

				<%
				PerfumeDAOImpl dao = new PerfumeDAOImpl(DBConnect.getConn());
				List<PerfumeDtls> list = dao.getNewPerfume();
				for (PerfumeDtls b : list) {
				%>
				<div class="col-md-3.5">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="perfume/<%=b.getPhoto()%>"
								style="width: 150px; height: 200px" class="img-thumblin">
							<p><%=b.getperfumename()%></p>
							<p><%=b.getAuthor()%></p>
							<p>
								Categories :<%=b.getperfumeCategory()%></p>
							<div class="row">

								<%
								if (u == null) {
								%>
								<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add
									Cart</a>
								<%
								} else {
								%>
								<a href="cart?bid=<%=b.getperfumeID()%>&&uid=<%=u.getId()%>"
									class="btn btn-danger btn-sm ml-1">Add Cart</a>
								<%
								}
								%>
								<a href="view_perfumes.jsp?bid=<%=b.getperfumeID()%>"
									class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
									class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
									class="fas fa-dollar-sign"></i></a>

							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
			<div class="text-center mt-1">
				<a href="all_new_perfume.jsp"
					class="btn btn-danger btn-sm text-white">View All</a>
			</div>
		</div>
	</div>






	<!--  -->

	<hr>
	<div class="container">
		<h3 class="text-center">Newest Perfume</h3>

		<div class="row">
			<%
			PerfumeDAOImpl dao3 = new PerfumeDAOImpl(DBConnect.getConn());
			List<PerfumeDtls> list3 = dao3.getOldPerfumes();
			for (PerfumeDtls b : list3) {
			%>
			<div class="col-md-3.5">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="perfume/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getperfumename()%></p>
						<p><%=b.getAuthor()%></p>
						<%
						if (b.getperfumeCategory().equals("Old")) {
						%>
						Categories :<%=b.getperfumeCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getperfumeID()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1">Add Cart</a>
							<%
							}
							%>
							<a href="view_perfumes.jsp?bid=<%=b.getperfumeID()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fas fa-dollar-sign"></i></a>

						</div>
						<%
						} else {
						%>
						Categories :<%=b.getperfumeCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getperfumeID()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-1">Add Cart</a>
							<%
							}
							%>
							<a href="view_perfumes.jsp?bid=<%=b.getperfumeID()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fas fa-dollar-sign"></i></a>

						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_old_perfume.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>

	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>