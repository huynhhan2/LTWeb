<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
						<h4 class="text-center">Add Perfumes</h4>
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>



						<form action="../add_Perfumes" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputEmail1">Perfume Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="bname">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Brand Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="author">

							</div>



							<div class="form-group">
								<label for="exampleInputPassword1">Price</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									required="required" name="price">
							</div>
							<div class="form-group">
								<label for="inputState">Perfume Categories</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>--Select--</option>
									<option value="Hot Perfume">Hot Perfume</option>
									<option value="Newest Perfume">Newest Perfume</option>

								</select>

							</div>

							<div class="form-group">
								<label for="inputState">Perfume Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>--Select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>


								</select>

							</div>
							<div class="form-group">
								<label for="examFormControlFile1">Upload Photo</label><input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 130px;"><%@include file="footer.jsp"%></div>

</body>
</html>