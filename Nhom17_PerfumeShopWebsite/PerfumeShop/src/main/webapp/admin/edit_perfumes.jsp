<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.PerfumeDAOImpl" %>
<%@ page import="com.entity.PerfumeDtls" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
						<h4 class="text-center">Edit Perfumes</h4>
						

						<%
						int id=Integer.parseInt(request.getParameter("id"));
						PerfumeDAOImpl dao = new PerfumeDAOImpl(DBConnect.getConn());
						PerfumeDtls b=dao.getPerfumeById(id);
						%>

						<form action="../editPerfumes" method="post">
							<input type="hidden" name="id" value="<%=b.getperfumeID() %>">
							<div class="form-group">
								<label for="exampleInputEmail1">Perfume Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="bname" value= "<%=b.getperfumename()%>" >

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="author" value= "<%=b.getAuthor()%>">
							</div>



							<div class="form-group">
								<label for="exampleInputPassword1">Price</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									required="required" name="price" value= "<%=b.getPrice()%>" >
							</div>



							<div class="form-group">
								<label for="inputstate">Perfume Status</label> <select
									id="inputState" name="status" class="form-control">
									<% 
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option> 
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option> 
									<option value="Active">Active</option>
									
									<%
									}
									%>
								</select>
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