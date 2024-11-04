package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;

public class UserDAOImpl implements UserDAO {
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User us) {
		boolean f=false;
		try {
			String sql="INSERT INTO [user] (name, email, phno, password) VALUES (?, ?, ?, ?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public User login(String email, String password) {
	    User user = null;
	    try {
	        String sql = "SELECT * FROM [user] WHERE email=? AND password=?";
	        try (PreparedStatement ps = conn.prepareStatement(sql)) {
	            ps.setString(1, email);
	            ps.setString(2, password);

	            try (ResultSet rs = ps.executeQuery()) {
	                if (rs.next()) {
	                    user = new User();
	                    user.setId(rs.getInt("id"));
	                    user.setName(rs.getString("name"));
	                    user.setEmail(rs.getString("email"));
	                    user.setPhno(rs.getString("phno"));
	                    user.setPassword(rs.getString("password"));
	                    user.setAddress(rs.getString("address"));
	                    user.setLandmark(rs.getString("landmark"));
	                    user.setCity(rs.getString("city"));
	                    user.setState(rs.getString("state"));
	                }
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        // Log the exception or handle it according to your application's needs.
	    }
	    return user;
	}

	@Override
	public boolean checkPassword(int id, String ps) {
		boolean f = false;
		try {
			String sql="select * from [user] where id=? and password=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				f=true;
			}
		} catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	public boolean checkEmPn(String em, String pn) {
		boolean f = false;
		try {
			String sql="select * from [user] where email=? and phno=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, em);
			pst.setString(2, pn);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				f=true;
			}
		} catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	public boolean updatePassword(String em, String pn, String pw) {
		boolean f = false;
		try {
			String sql="update [user] set password=? where email=? and phno=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, pw);
			pst.setString(2, em);
			pst.setString(3, pn);
			
			int i=pst.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean updateProfile(User us) {
		boolean f=false;
		try {
			String sql="update [user] set name=?, email=?, phno=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setInt(4, us.getId());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean checkUser(String em) {
		boolean f=true;
		try {
			String sql="select * from [user] where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,em);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) 
			{
				f=false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<User> getAllUser() {
		List<User> list=new ArrayList<User>();
		User b=null;
		try {
			String sql="select * from [user]";
			PreparedStatement ps=conn. prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new User();
				b.setId(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setEmail(rs.getString(3));
				b.setPhno(rs.getString(4));
				b.setPassword(rs.getString(5));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public User getUserById(int id) {
		User b=null;
		try {
			String sql ="select * from [user] where id=?";
			PreparedStatement ps=conn. prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				b=new User();
				b.setId(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setEmail(rs.getString(3));
				b.setPhno(rs.getString(4));
				b.setPassword(rs.getString(5));
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean updateEditBooks(User b) {
		boolean f=false;
		try {
			String sql="update [user] set name=?, email=?,phno=?, password=? where id=? ";
			PreparedStatement ps=conn. prepareStatement(sql);
			ps.setString(1, b.getName());
			ps.setString(2, b.getEmail());
			ps.setString(3, b.getPhno());
			ps.setString(4, b.getPassword());
			ps.setInt(5, b.getId());
			
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
	public boolean deleteUser(int id) {
		boolean f=false;
		try {
			String sql="delete from [user] where id=? ";
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

	 
}
