package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	
	private static Connection conn;
	public static Connection getConn()
	{
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=shopperfume","sa","123456");
			System.out.println("connect sucessfully!");
		}catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("connect failure");
		}
		
		return conn;
	}
}