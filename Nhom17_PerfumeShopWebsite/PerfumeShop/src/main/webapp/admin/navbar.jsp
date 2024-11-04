<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: #363636"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-info">
			<h3>
				<i class="fa-sharp fa-regular fa-jug-bottle"></i> Perfume HVPG
			</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0">
				
			</form>
		</div>

		<div class="col-md-3">
			<c:if test="${not empty userobj }">
				<a href="" class="btn btn-success"><i
					class="fas fa-user"></i>${ userobj.name}</a>
				<a href="../logout" class="btn btn-primary text-while"><i
					class="fas fa-sign-in-alt"></i> Logout</a>
			</c:if>
			<c:if test="${ empty userobj}">
				<a href="../login.jsp" class="btn btn-success"><i
					class="fas fa-sign-in-alt"></i> Login</a>
				<a href="../register.jsp" class="btn btn-primary text-while"><i
					class="fas fa-user-plus"></i> Register</a>
			</c:if>

		</div>

	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
			</li>

		</ul>
	</div>
</nav>