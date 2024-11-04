<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.DAO.PerfumeDAOImpl"%>
<%@ page import="com.entity.PerfumeDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Random"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	PerfumeDAOImpl dao = new PerfumeDAOImpl(DBConnect.getConn());
	PerfumeDtls b = dao.getPerfumeById(bid);
	%>
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="perfume/<%=b.getPhoto()%>"
					style="height: 450px; width: 500px" class="img-fluid"><br>


			</div>



			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getperfumename()%></h2>

				<h5 class="text-left">
					Thương Hiệu: <span class="text-success"><%=b.getAuthor()%></span> <span
						class="text">|</span> <span class="text">Tình trạng:</span> <span
						class="text-success">Còn hàng</span>




				</h5>
				<h5 class="text-left">
					<i class="fa-regular fa-star" style="color: gold;"></i> <i
						class="fa-regular fa-star" style="color: gold;"></i> <i
						class="fa-regular fa-star" style="color: gold;"></i> <i
						class="fa-regular fa-star" style="color: gold;"></i> <i
						class="fa-regular fa-star" style="color: gold;"></i>
				</h5>

				<h5 class="text-left">
					Category: <span class="text-success"><%=b.getperfumeCategory()%></span>
				</h5>
				<h5 class="text-left">
					<p>
						Giá thị trường: <span> <%
 int price = 0;
 if ("Newest Perfume".equals(b.getperfumeCategory())) {
 %> <del>200</del> <%
 price = 200;
 } else if ("Hot Perfume".equals(b.getperfumeCategory())) {
 %> <del>220</del> <%
 price = 220;
 } else {
 %> 220 <%
 }
 %> <i class="fas fa-dollar-sign"></i>
						</span>
					</p>
				</h5>
				<h5 class="text-left">
					<p>
						Giá tại shop: <span class="ml-2"><%=b.getPrice()%> </span> <i
							class="fas fa-dollar-sign"></i>
					</p>
				</h5 class="text-left">
				<h5 class="text-left">
					<p>
						Tiết kiệm lên tới: <span class="text-success"> <%=price - Double.parseDouble(b.getPrice())%>
							<i class="fas fa-dollar-sign"></i>
						</span>
					</p>
				</h5>
				<style>
hr {
	border: 0; /* Remove the default border */
	height: 2px; /* Set the height of the line */
	background: #000; /* Set the background color to black */
	margin: 20px 0; /* Add some margin for spacing */
}
</style>
				<hr>
				<h5 class="text-left">
					<strong>
						Thương hiệu: <span><%=b.getAuthor()%></span>
					</strong>
<h5 class="text-left">
					<strong>
						Xuất xứ:
						<%
					if ("Gucci".equals(b.getAuthor()) || "GUCCI".equals(b.getAuthor())) {
					%>
						Ý
						<%
					} else if ("Chanel".equals(b.getAuthor()) || "CHANEL".equals(b.getAuthor())) {
					%>
						Pháp
						<%
					} else {
					%>
						Ý
						<%
					}
					%>
					</strong>

				</h5>
				<%
				String[] styles = { "Năng động,Tươi Mát", "Cá tính,Tự Tin", "Sang trọng,Bí Ẩn", "Thu Hút, Gần Gũi",
						"Trẻ Trung, Sảnh Điệu" };
				Random random = new Random();
				int randomIndex = random.nextInt(styles.length);
				String selectedStyle = styles[randomIndex];
				%>
				<h5 class="text-left">
					<strong>
						Phong cách:
						<%=selectedStyle%></strong>
				</h5>
				<%
				if ("Newest Perfume".equals(b.getperfumeCategory())) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fas fa-envelope"></i> EMail:
					<%=b.getEmail()%>
				</h5>
				<%
				}
				%>


				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>

				</div>

				<%
				if ("Old".equals(b.getperfumeCategory())) {
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
				</div>
				<%
				} else {
				if (u != null) {
				%>
				<div class="text-center p-3">
					<a href="cart?bid=<%=b.getperfumeID()%>&&uid=<%=u.getId()%>&&source=jsp0"
						class="btn btn-primary">Add Cart</a>
				</div>
				<%
				} else {
				%>
				<div class="text-center p-3">
					<!-- Handle the case when the user is not logged in -->
					<a href="login.jsp" class="btn btn-primary">Login to Add Cart</a>
				</div>
				<%
				}
				}
				%>

			</div>
		</div>
		<style>
  .text-center {
    text-align: center;
    font-family: "Times New Roman", Times, serif;
    font-size: 20px;
  }
</style>
		<div class="text-center mt-5 p-5 border bg-white">
			<strong>Câu Chuyện Thương Hiệu</strong>
			<p>Chào mừng đến với <%=b.getAuthor()%> - hãng nước hoa tuyệt vời của bạn!</p>

			<p><%=b.getAuthor()%> là một hãng nước hoa chung chung mang trong mình đa
				dạng không gian hương thơm. Với niềm đam mê và sự sáng tạo, chúng
				tôi cam kết mang đến cho bạn những trải nghiệm nước hoa độc đáo và
				đầy mê hoặc.</p>

			<p><%=b.getAuthor()%> hiểu rằng mỗi người đều có cái nhìn riêng về mùi
				hương và phong cách của mình. Vì vậy, <%=b.getAuthor()%> đã tạo ra một bộ sưu
				tập đa dạng các nhãn hiệu nước hoa, từ những thương hiệu nổi tiếng
				và cổ điển đến những nhãn hiệu mới nổi và sáng tạo. Qua từng chai
				nước hoa, bạn sẽ khám phá thế giới của sự tự tin, tinh tế và cá
				nhân.</p>

			<p>Với <%=b.getAuthor()%>, chất lượng là ưu tiên hàng đầu. <%=b.getAuthor()%> chỉ
				sử dụng những thành phần tốt nhất và công nghệ hiện đại để tạo ra
				những hương thơm tuyệt đẹp và lâu trôi. Mỗi chai nước hoa được chế
				tạo cẩn thận, từ quy trình sản xuất đến đóng gói, để đảm bảo rằng
				bạn nhận được sản phẩm tuyệt vời và đúng hẹn.</p>

			<p><%=b.getAuthor()%> tin rằng mỗi chai nước hoa là một câu chuyện riêng,
				là cách để bạn thể hiện bản thân và tạo nên ấn tượng đầu tiên. Với
				sự đa dạng và phong cách của <%=b.getAuthor()%>, bạn có thể tìm thấy một mùi
				hương phù hợp với mọi dịp và tâm trạng, từ những mùi hương năng
				động, tươi mát cho những buổi dạo chơi, đến những mùi hương sang
				trọng, bí ẩn cho những dịp đặc biệt và quan trọng.</p>

			<p>Hãy đồng hành cùng <%=b.getAuthor()%> trên hành trình khám phá vẻ đẹp
				và mạnh mẽ của mùi hương. Hãy cho <%=b.getAuthor()%> truyền cảm hứng và thể
				hiện cái tôi của bạn thông qua một chai nước hoa đặc biệt.</p>
		</div>
	</div>
</body>
</html>