<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.PerfumeDAOImpl"%>
<%@ page import="com.entity.PerfumeDtls"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Perfume</title>
<%@include file="all_component/all_css.jsp"%>

</head>
<body>

	<%
	User u=(User)session.getAttribute("userobj");
	%>
	
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		

		<div class="row">
			<%
			String ch=request.getParameter("ch");
			PerfumeDAOImpl dao2 = new PerfumeDAOImpl(DBConnect.getConn());
			List<PerfumeDtls> list2 = dao2.getPerfumeBySearch(ch);
			for (PerfumeDtls b : list2) {
			%>
			<div class="col-md-2.5">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="perfume/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getperfumename()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getperfumeCategory().equals("Old")){
							%>
							Categories :<%=b.getperfumeCategory()%></p>
						<div class="row">
							<a href="view_perfumes.jsp?bid=<%=b.getperfumeID()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>

						</div>
						<%
							}else {
						%>
						Categories :<%=b.getperfumeCategory()%></p>
						<div class="row">
							<%
							if(u==null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getperfumeID() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<%
							}
							%>
							<a href="view_perfumes.jsp?bid=<%=b.getperfumeID()%>" class="btn btn-success btn-sm ml-1">View Details</a> 
							<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>

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
			<a herf="" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
</body>
</html>