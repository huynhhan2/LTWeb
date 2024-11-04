package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.PerfumeDtls;

import java.util.ArrayList;
import java.util.List;
public class PerfumeDAOImpl implements PerfumeDAO {
	private Connection conn;
	public PerfumeDAOImpl(Connection conn) {
		super();
		this.conn=conn;
	}
	public boolean addPerfumes(PerfumeDtls b) {
		boolean f=false;
		try {
			String sql = "INSERT INTO perfume_dtls (perfumename, author, price, perfumeCategory, status, photo, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getperfumename());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getperfumeCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getEmail());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			

			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	@Override
	public List<PerfumeDtls> getAllPerfumes() {
		List<PerfumeDtls> list=new ArrayList<PerfumeDtls>();
		PerfumeDtls b=null;
		try {
			String sql="select * from perfume_dtls";
			PreparedStatement ps=conn. prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new PerfumeDtls();
				b.setperfumeID(rs.getInt(1));
				b.setperfumename(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setperfumeCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	@Override
	public PerfumeDtls getPerfumeById(int id) {
		
		PerfumeDtls b=null;
		try {
			String sql ="select * from perfume_dtls where perfumeId=?";
			PreparedStatement ps=conn. prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new PerfumeDtls();
				b.setperfumeID(rs.getInt(1));
				b.setperfumename(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setperfumeCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return b;
		
	}
	@Override
	public boolean updateEditPerfumes(PerfumeDtls b) {
		boolean f=false;
		try {
			String sql="update perfume_dtls set perfumename=?, author=?,price=?, status=? where perfumeId=? ";
			PreparedStatement ps=conn. prepareStatement(sql);
			ps.setString(1, b.getperfumename());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getperfumeID());
			
			int i=ps.executeUpdate();
			if(i==1) 
			{
				f=true;
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	@Override
	public boolean deletePerfumes(int id) {
		
		boolean f=false;
		try {
			String sql="DELETE FROM perfume_dtls WHERE perfumeId = ? ";
			PreparedStatement ps=conn. prepareStatement(sql);
			ps.setInt(1, id);
			
			
			int i=ps.executeUpdate();
			if(i==1) 
			{
				f=true;
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	@Override
	public List<PerfumeDtls> getNewPerfume() {
		List<PerfumeDtls> list=new ArrayList<PerfumeDtls>();
		PerfumeDtls b=null;
		try {
			String sql="select * from perfume_dtls  where perfumeCategory =? and status =? order by perfumeID DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Hot Perfume");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i <= 4)
			{
				b=new PerfumeDtls();
				b.setperfumeID(rs.getInt(1));
				b.setperfumename(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setperfumeCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
		e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<PerfumeDtls> getRecentPerfumes() {
		List<PerfumeDtls> list = new ArrayList<PerfumeDtls>();
		PerfumeDtls b = null;
		try {
			String sql = "select * from perfume_dtls where status =? order by perfumeID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new PerfumeDtls();
				b.setperfumeID(rs.getInt(1));
				b.setperfumename(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setperfumeCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<PerfumeDtls> getOldPerfumes() {
		List<PerfumeDtls> list=new ArrayList<PerfumeDtls>();
		PerfumeDtls b=null;
		try {
			String sql="select * from perfume_dtls  where perfumeCategory =? and status =? order by perfumeID DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Newest Perfume");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next() && i <= 4)
			{
				b=new PerfumeDtls();
				b.setperfumeID(rs.getInt(1));
				b.setperfumename(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setperfumeCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
		e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<PerfumeDtls> getAllRencentPerfume() {
		List<PerfumeDtls> list = new ArrayList<PerfumeDtls>();
		PerfumeDtls b = null;
		try {
			String sql = "select * from perfume_dtls where status =? order by perfumeID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new PerfumeDtls();
				b.setperfumeID(rs.getInt(1));
				b.setperfumename(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setperfumeCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<PerfumeDtls> getAllNewPerfume() {
		List<PerfumeDtls> list=new ArrayList<PerfumeDtls>();
		PerfumeDtls b=null;
		try {
			String sql="select * from perfume_dtls  where perfumeCategory =? and status =? order by perfumeID DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Hot Perfume");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			int i=1;
			while(rs.next())
			{
				b=new PerfumeDtls();
				b.setperfumeID(rs.getInt(1));
				b.setperfumename(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setperfumeCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		} catch (Exception e) {
		e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<PerfumeDtls> getAllOldPerfume() {
		List<PerfumeDtls> list=new ArrayList<PerfumeDtls>();
		PerfumeDtls b=null;
		try {
			String sql="select * from perfume_dtls  where perfumeCategory =? and status =? order by perfumeID DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Newest Perfume");
			ps.setString(2,"Active");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				b=new PerfumeDtls();
				b.setperfumeID(rs.getInt(1));
				b.setperfumename(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setperfumeCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			
			}
		} catch (Exception e) {
		e.printStackTrace();
		}
		return list;
	}
	
	public List<PerfumeDtls> getPerfumeByOld(String email, String cate) {
		
		List<PerfumeDtls> list=new ArrayList<PerfumeDtls>();
		PerfumeDtls b=null;
		try {
			String sql="select * from perfume_dtls where perfumeCategory=? and email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new PerfumeDtls();
				b.setperfumeID(rs.getInt(1));
				b.setperfumename(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setperfumeCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean oldPerfumeDelete(String email, String cat, int id) {
		boolean f = false;
		try {
			String sql="DELETE FROM perfume_dtls WHERE perfumeCategory=? AND email=? AND perfumeID=?;\r\n"
					+ "";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);
			
			int i = ps.executeUpdate();
			
			if (i==1) {
				f = true;
			}
		} catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	@Override
	public List<PerfumeDtls> getPerfumeBySearch(String ch) {
		List<PerfumeDtls> list=new ArrayList<PerfumeDtls>();
		PerfumeDtls b=null;
		try {
			String sql="select * from perfume_dtls where perfumename like ? or author like ? or perfumeCategory like ? and status=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new PerfumeDtls();
				b.setperfumeID(rs.getInt(1));
				b.setperfumename(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setperfumeCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
}
