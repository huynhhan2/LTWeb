<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.PerfumeDAOImpl"%>
<%@ page import="com.entity.PerfumeDtls" %>
<%@ page import="com.entity.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User : Newest Perfume</title>
<%@include file="all_component/all_css.jsp"%>

</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center">${succMsg }</div>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<div class="container p-5">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
			    <tr>
			      <th scope="col">Perfume Name</th>
			      <th scope="col">Brand</th>
			      <th scope="col">Price</th>
			      <th scope="col">Category</th>
			      <th scope="col">Action</th>
			    </tr>
			</thead>
			<tbody>
			 
			<%
			User u=(User)session.getAttribute("userobj");
			String email=u.getEmail();
			PerfumeDAOImpl dao=new PerfumeDAOImpl(DBConnect.getConn());
			List<PerfumeDtls> list=dao.getPerfumeByOld(email,"Newest Perfume");
			for (PerfumeDtls b:list)
			{%>
				<tr>
			      <td><%=b.getperfumename() %></td>
			      <td><%=b.getAuthor() %></td>
			      <td><%=b.getPrice() %></td>
			      <td><%=b.getperfumeCategory() %></td>
			      <td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getperfumeID() %>" class="btn btn-sm btn-danger">Delete</a></td>
			    </tr>
			<%}
			%> 
			</tbody>
		</table>
	</div>
</body>
</html>