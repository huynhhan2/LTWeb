package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.entity.Perfume_Sales;

import java.util.ArrayList;

public class PerfumeSalesImpl {
private Connection conn;
	
	public PerfumeSalesImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public List<Perfume_Sales> getAllSales() {
		List<Perfume_Sales> list=new ArrayList<Perfume_Sales>();
		Perfume_Sales o = null;
		
		try {
			String sql = "select * from GetSalesSummary()";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				o=new Perfume_Sales();
				o.setPerfumeName(rs.getString(1));
				o.setAuthor(rs.getString(2));
				o.setPrice(rs.getDouble(3));
				o.setPaymentType(rs.getString(4));
				o.setQuantity(rs.getInt(5));
				list.add(o);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Perfume_Sales> getSalesDate(Date startdate, Date endDate) {
		List<Perfume_Sales> list=new ArrayList<Perfume_Sales>();
		Perfume_Sales o = null;
		
		try {
			String sql = "select * from GetSalesSummaryInRange(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDate(1,startdate);
			ps.setDate(2,endDate);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				o=new Perfume_Sales();
				o.setPerfumeName(rs.getString(1));
				o.setAuthor(rs.getString(2));
				o.setPrice(rs.getDouble(3));
				o.setPaymentType(rs.getString(4));
				o.setQuantity(rs.getInt(5));
				list.add(o);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Perfume_Sales> getSalesAuthor() {
		List<Perfume_Sales> list=new ArrayList<Perfume_Sales>();
		Perfume_Sales o = null;
		
		try {
			String sql = "select * from AuthorSalesView";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				o=new Perfume_Sales();
				o.setAuthor(rs.getString(1));
				o.setQuantity(rs.getInt(2));
				o.setPrice(rs.getDouble(3));
				o.setPaymentType(rs.getString(4));
				list.add(o);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
