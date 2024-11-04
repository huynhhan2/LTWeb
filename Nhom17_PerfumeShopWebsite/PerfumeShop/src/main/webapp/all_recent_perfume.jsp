<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.DAO.PerfumeDAOImpl"%>
<%@ page import="com.entity.PerfumeDtls"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Perfume</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}
#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}
}
@
keyframes fadeOut {from { bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
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
	<div class="container-fluid">
		

		<div class="row">
			<%
			PerfumeDAOImpl dao2 = new PerfumeDAOImpl(DBConnect.getConn());
			List<PerfumeDtls> list2 = dao2.getAllRencentPerfume();
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
							<%
							if(u==null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-1">Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getperfumeID() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-5">Add Cart</a>
							<%
							}
							%>
							<a href="view_perfumes.jsp?bid=<%=b.getperfumeID()%>" class="btn btn-success btn-sm ml-1">View Details</a> 
							<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fas fa-dollar-sign"></i></a>

						</div>
						<%
							}else {
						%>
						Categories :<%=b.getperfumeCategory()%></p>
						<div class="row">
							<%
							if(u==null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-5">Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getperfumeID() %>&&uid=<%=u.getId() %>&&source=jsp0" class="btn btn-danger btn-sm ml-5">Add Cart</a>
							<%
							}
							%>
							<a href="view_perfumes.jsp?bid=<%=b.getperfumeID() %>" class="btn btn-success btn-sm ml-1">View Details</a> 
							<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fas fa-dollar-sign"></i></a>

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
	</div>
</body>
</html>