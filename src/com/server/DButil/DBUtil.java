package com.server.DButil;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	public  Connection getConnection(){
	    //����mysql���ݿ�,���ݿ���votetest���û���Ϊroot������Ϊroot
		Connection conn=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/votetest","root","123456");
			return conn;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
