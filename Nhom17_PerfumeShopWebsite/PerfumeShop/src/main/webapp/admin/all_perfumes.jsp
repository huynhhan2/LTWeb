<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.PerfumeDAOImpl"%>
<%@ page import="com.entity.PerfumeDtls"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Perfumes</title>
<%@include file="all_css.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">

		<c:redirect url="../login.jsp" />
	</c:if>



	<h3 class="text-center">Hello Admin</h3>
	<c:if test="${not empty succMsg}">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="successMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<table class="table table-strined">
		<thead class="bg-primury text-black">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Perfume Name</th>
				<th scope="col">Brand</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			PerfumeDAOImpl dao = new PerfumeDAOImpl(DBConnect.getConn());
			List<PerfumeDtls> list = dao.getAllPerfumes();
			for (PerfumeDtls b : list) {
			%>
			<tr>
				<td><%=b.getperfumeID()%></td>
				<td><img src="../perfume/<%=b.getPhoto()%>"
					style="width: 50px; height: 50Px;"></td>
				<td><%=b.getperfumename()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getperfumeCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_perfumes.jsp?id=<%=b.getperfumeID()%>"
					class="btn btn-sm btn-primary">Edit</a> <a
					href="../delete?id=<%=b.getperfumeID()%>"
					class="btn btn-sm btn-danger">Delete</a></td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
	<div style="margin-top: 130px;"><%@include file="footer.jsp"%></div>
</body>
</html>