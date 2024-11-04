<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 10px; background-color: #363636"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-dark">
			<h3>
				<i class="fas fa-perfume"></i> Perfume HVPG
			</h3>
		</div>
		
		<div class="col-md-3 offset-md-6">
			<c:if test="${not empty userobj}">
				<a href="checkout.jsp"><i class="fas fa-cart-plus fa-2x"></i></a>
			
				<a href="login.jsp" class="btn btn-success"> ${userobj.name}</a>
				
				<a href="logout" class="btn btn-primary text-while">Logout</a>
			</c:if>
			
			<c:if test="${empty userobj}">
				<a href="login.jsp" class="btn btn-success">Login</a>
				<a href="register.jsp" class="btn btn-primary text-while">Register</a>
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
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item active"><a class="nav-link"
				href="all_recent_perfume.jsp"><i class=""></i></i> All Perfume</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_new_perfume.jsp"><i class=""></i></i> Hot Perfume</a></li>
			<li class="nav-item active"><a class="nav-link disabled"
				href="all_old_perfume.jsp"><i class=""></i></i> Newest Perfume</a></li>
			<li class="nav-item active"><a class="nav-link disabled"
				href="GioiThieu.jsp"><i class=""></i></i>Introduce</a></li>
		</ul>
		<div class="col-md-5">
			<form class="form-inline my-2 my-lg-0" action="search.jsp"
				method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-lable="Search">
				<button class="btn btn-dark my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0"
				type="submit"> <i class="fa-solid fa-gear"></i> Setting
			</a> <a href="Contact.jsp"><button
					class="btn btn-dark my-2 my-sm-0 ml-1" type="submit">
					<i class="fa-solid fa-phone-flip"></i> Contact Us</a>
			</button>
		</form>
	</div>
</nav>