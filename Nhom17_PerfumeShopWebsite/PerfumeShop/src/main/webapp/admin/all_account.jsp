<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.DAO.UserDAOImpl"%>
<%@ page import="com.entity.User" %>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Accout</title>
<%@include file= "all_css.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp"/>
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
	
	<table class="table table-stiped">
		<thead class="thead-light text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Phone</th>
				<th scope="col">Password</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			List<User> list = dao.getAllUser();
			for (User b : list) {
			%>
			<tr>
				<td><%= b.getId()%></td>
				<td><%= b.getName()%></td>
				<td><%= b.getEmail()%></td>
				<td><%=b.getPhno()%></td>
				<td><%=b.getPassword()%></td>
				<td>
					<a href="edit_account.jsp?id=<%= b.getId() %>" class="btn btn-sm btn-primary">Edit</a> 
	            	<a href="../delete_account?id=<%= b.getId() %>" class="btn btn-sm btn-danger">Delete</a>
				</td>
			</tr>
			<%
			}
			%>

		</tbody>
	</table>
	<div style="margin-top: 130px;"><%@include file="footer.jsp"%></div>
</body>
</html>