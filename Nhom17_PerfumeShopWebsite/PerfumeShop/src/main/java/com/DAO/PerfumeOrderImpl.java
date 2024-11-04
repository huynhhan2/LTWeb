package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.entity.Perfume_Order;

import java.util.ArrayList;

public class PerfumeOrderImpl implements PerfumeOrderDAO {

	private Connection conn;
	
	public PerfumeOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	public boolean saveOrder(List<Perfume_Order> blist) {
		boolean f=false;
		try {
			String sql = "insert into perfume_order(order_id,username,email,address,phone,perfume_name,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			for(Perfume_Order b:blist) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladd());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getperfumeName());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.addBatch();
			}
			
			int[] count = ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		// insert perfume_sales
		try {
			String sql = "insert into perfume_sales(perfume_name,author,price,payment,date) values(?,?,?,?,GETDATE())";
			
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			for(Perfume_Order b:blist) {
				ps.setString(1, b.getperfumeName());
				ps.setString(2, b.getAuthor());
				ps.setString(3, b.getPrice());
				ps.setString(4, b.getPaymentType());
				ps.addBatch();
			}
			
			int[] count = ps.executeBatch();
			conn.commit();
			conn.setAutoCommit(true);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		// end insert perfume_sales
		
		return f;
	}
	public List<Perfume_Order> getBook(String email){
		List<Perfume_Order> list=new ArrayList<Perfume_Order>();
		Perfume_Order o = null;
		
		try {
			String sql = "select * from perfume_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				o=new Perfume_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setperfumeName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<Perfume_Order> getAllOrder() {
		List<Perfume_Order> list=new ArrayList<Perfume_Order>();
		Perfume_Order o = null;
		
		try {
			String sql = "select * from perfume_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				o=new Perfume_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setperfumeName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
