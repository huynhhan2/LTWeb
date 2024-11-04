<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.PerfumeOrderImpl"%>
<%@ page import="com.entity.Perfume_Order" %>
<%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_css.jsp"%>
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp"/>
	</c:if>
	<%@include file="navbar.jsp"%>

	<h1>orders</h1>

	<table class="table table-stiped">
		<thead class="thead-light text-white">
			<tr>
				<th scope="col">Order ID</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">PH Noy</th>
				<th scope="col">Perfume Name</th>
				<th scope="col">Brand</th>
				<th scope="col">Price</th>
				<th scope="col">Payment type</th>
				

			</tr>
		</thead>
		<tbody>
		
		<%
		PerfumeOrderImpl dao = new PerfumeOrderImpl(DBConnect.getConn());
		List<Perfume_Order> blist = dao.getAllOrder();
		for(Perfume_Order b:blist)
		{
		%>
			<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<td><%=b.getUserName()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFulladd()%></td>
				<td><%=b.getPhno()%></td>
				<td><%=b.getperfumeName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPaymentType()%></td>

			</tr>
		<%
		}
		%>
			
		</tbody>
	</table>
	<div style="margin-top:130px;"><%@include file="footer.jsp" %></div>
	
</body>
</html>