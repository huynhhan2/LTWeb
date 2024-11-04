package com.user.servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.DAO.CartDAOImpl;
import com.DAO.PerfumeOrderImpl;
import com.entity.Cart;
import com.entity.Perfume_Order;
import java.util.List;
import java.util.ArrayList;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name =req.getParameter("username");
			String email =req.getParameter("email");
			String phno =req.getParameter("phno");
			String address =req.getParameter("address");
			String landmark =req.getParameter("landmark");
			String city =req.getParameter("city");
			String state =req.getParameter("state");
			String pincode =req.getParameter("pincode");
			String paymentType =req.getParameter("payment");
			
			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
			
			/*System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType);*/
			
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			
			List<Cart> blist= dao.getPerfumeByUser(id);
			if (blist.isEmpty())
			{
				session.setAttribute("failedMsg","Add Item");
				resp.sendRedirect("checkout.jsp");
			}else {
				PerfumeOrderImpl dao2 = new PerfumeOrderImpl(DBConnect.getConn());
				
				Perfume_Order o = null;
				
				ArrayList<Perfume_Order> orderList=new ArrayList<Perfume_Order>();
				Random r = new Random();
				for (Cart c:blist)
				{
					o=new Perfume_Order();
					o.setOrderId("PERFUME-ORD-00"+r.nextInt(1000));
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setperfumeName(c.getperfumeName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
				
					orderList.add(o);
					
				}
				if ("noselect".equals(paymentType))
				{
					session.setAttribute("failedMsg","Choose Payment Method");
					resp.sendRedirect("checkout.jsp");
				}else {
					boolean f = dao2.saveOrder(orderList);
					
					if (f)
					{
						session.setAttribute("succMsg","Your Order Successfully");
						resp.sendRedirect("order_success.jsp");
					}else {
						session.setAttribute("failedMsg","Your Order Failed");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
