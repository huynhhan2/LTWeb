<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.UserDAOImpl" %>
<%@ page import="com.entity.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
						

						<%
						int id=Integer.parseInt(request.getParameter("id"));
						UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
						User b=dao.getUserById(id);
						%>

						<form action="../edit_account" method="post">
							<input type="hidden" name="id" value="<%=b.getId() %>">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="name" value= "<%=b.getName()%>" >

							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Email</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email" value= "<%=b.getEmail()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputPhone">Phone No</label> <input
									type="text" class="form-control" id="exampleInputPhone"
									aria-describedby="phoneHelp" inputmode="numeric"
									pattern="[0-9]*" maxlength="10" required="required" name="phno" value= "<%=b.getPhno()%>">
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="password" value= "<%=b.getPassword()%>">
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
							

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 130px;"><%@include file="footer.jsp"%></div>

</body>
</html>