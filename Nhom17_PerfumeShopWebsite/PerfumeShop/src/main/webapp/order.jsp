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
<title>Order Perfume</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"/>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-1">
		<h3 class="text-center text-primary">Your Order</h3>
	
		<table class="table table-striped mt-3">
			<thread class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Perfume Name</th>
					<th scope="col">Brand</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thread>
			<tbody>
				<%
				User u =(User) session.getAttribute("userobj");
				PerfumeOrderImpl dao = new PerfumeOrderImpl(DBConnect.getConn());
				List<Perfume_Order> blist = dao.getBook(u.getEmail());
				for (Perfume_Order b : blist)
				{
				%>
				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUserName()%></td>
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
	</div>
</body>
</html>