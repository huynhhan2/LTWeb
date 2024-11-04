<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.PerfumeSalesImpl"%>
<%@ page import="com.entity.Perfume_Sales" %>
<%@ page import="com.entity.User" %>

<%
    PerfumeSalesImpl dao = new PerfumeSalesImpl(DBConnect.getConn());
    List<Perfume_Sales> blist1 = dao.getAllSales();
    List<Perfume_Sales> blist2 = null; 
    List<Perfume_Sales> blist3 = dao.getSalesAuthor();
    double totalPrice = 0;

    if ("option2".equals(request.getParameter("exampleRevenue"))) {
        String startDateString = request.getParameter("startDate");
        String endDateString = request.getParameter("endDate");
        
        Date startDate = Date.valueOf(startDateString);
        Date endDate = Date.valueOf(endDateString);
        
        blist2 = dao.getSalesDate(startDate, endDate);
        
        for (Perfume_Sales b : blist2) {
            totalPrice += b.getQuantity() * b.getPrice();
        }
    } else {
        for (Perfume_Sales b : blist1) {
            totalPrice += b.getQuantity() * b.getPrice();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Revenue Report</title>
    <%@include file="all_css.jsp"%>
</head>
<body>
    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp"/>
    </c:if>
    
    <%@include file="navbar.jsp"%>
    
    <h1 class="text-center">Revenue Report</h1>
    <div class="card bg-white">
		<div class="card-body text-center">
    
    <form id="revenueForm">
        <div class="row p-4">
        	<div class="col-md-1">
        	</div>
	        <div class="col-md-3 text-left">
	            <div class="form-check">
	                <input class="form-check-input" type="radio" name="exampleRevenue" id="exampleRadios1" value="option1">
	                <label class="form-check-label" for="exampleRadios1">All Revenue</label>
	            </div>
	            <div class="form-check">
	                <input class="form-check-input" type="radio" name="exampleRevenue" id="exampleRadios2" value="option2">
	                <label class="form-check-label" for="exampleRadios2">Revenue filtered by date</label>
	            </div>
	            <div class="form-check">
	                <input class="form-check-input" type="radio" name="exampleRevenue" id="exampleRadios2" value="option3">
	                <label class="form-check-label" for="exampleRadios2">Revenue by author</label>
	            </div>
	        </div>
	        <div class="col-md-3">
	            <label for="startDate">Start Date:</label>
	            <input type="date" id="startDate" name="startDate" required disabled>
	            <br>
	            <label for="endDate"> End Date: </label>
	            <input type="date" id="endDate" name="endDate" required disabled>
	        </div>
	        <div class="col-md-3">
	            <input class="btn btn-warning" type="submit" value=" Run ">
	        </div>
	    </div>
    </form>
    <script>
	    document.addEventListener("DOMContentLoaded", function () {
	        var form = document.getElementById("revenueForm");
	        var radios = form.elements["exampleRevenue"];
	        var startDateInput = document.getElementById("startDate");
	        var endDateInput = document.getElementById("endDate");
	
	        function updateDateInputs() {
	            startDateInput.disabled = radios.value !== "option2";
	            endDateInput.disabled = radios.value !== "option2";
	        }
	
	        // Gọi hàm cập nhật khi trang được tải và khi người dùng thay đổi lựa chọn
	        updateDateInputs();
	        form.addEventListener("change", updateDateInputs);
	    });
	</script>
	</div>
	</div>
	<div class="row p-4">
       	<div class="col-md-1">
       	</div>
       	<div class="col-md-10">
	<%
	String selectedOption = request.getParameter("exampleRevenue");
	if ("option3".equals(selectedOption)) {
	%>
	<table class="table table-stiped">
        <thead class="thead-light text-white">
            <tr>
                <th scope="col">Brand</th>
                <th scope="col">Quantity</th>
                <th scope="col">Revenue</th>
                <th scope="col">Payment type</th>
            </tr>
        </thead>
        <tbody>
         	<%
         		double totalPrice3=0;
                for (Perfume_Sales b : blist3) {
                	totalPrice3+=b.getPrice();
            %>
        	<tr>
                <td><%=b.getAuthor()%></td>
                <td><%=b.getQuantity()%></td>
                <td><%=b.getPrice()%></td>
                <td><%=b.getPaymentType()%></td>
            </tr>
            <%
                }
            %>
            <tr style="background-color: #ffcccc;">
                <th>Total Revenue</th>
                <td></td>
                <td><%=totalPrice3 %></td>
                <td></td>
            </tr>
        </tbody>
    </table>
	<% } else { %>
	
	<table class="table table-stiped">
        <thead class="thead-light text-white">
            <tr>
                <th scope="col">Perfume Name</th>
                <th scope="col">Brand</th>
                <th scope="col">Quantity</th>
                <th scope="col">Price</th>
                <th scope="col">Payment type</th>
            </tr>
        </thead>
        <tbody>
        
            <%
                // Duyệt qua blist1 hoặc blist2 tùy vào lựa chọn của người dùng
                List<Perfume_Sales> selectedList = ("option2".equals(request.getParameter("exampleRevenue"))) ? blist2 : blist1;
                for (Perfume_Sales b : selectedList) {
            %>
                <tr>
                    <th><%=b.getPerfumeName()%></th>
                    <td><%=b.getAuthor()%></td>
                    <td><%=b.getQuantity()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getPaymentType()%></td>
                </tr>
            <%
                }
            %>
            <tr style="background-color: #ffcccc;">
                <th>Total Revenue</th>
                <td></td>
                <td></td>
                <td><%=totalPrice%></td>
                <td></td>
            </tr>
        </tbody>
    </table>
	
	<% } %>
	
       	</div>
       	<div class="col-md-1">
       	</div>
    </div>
	
	
    
    
    <div style="margin-top:130px;">
        <%@include file="footer.jsp" %>
    </div>
</body>
</html>
