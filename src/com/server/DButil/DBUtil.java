package com.server.DButil;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	public  Connection getConnection(){
	    //连接mysql数据库,数据库名votetest，用户名为root，密码为root
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
