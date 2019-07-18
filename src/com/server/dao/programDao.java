package com.server.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.server.DButil.DBUtil;
import com.server.entity.program;

public class programDao {
	DBUtil util = new DBUtil();	
	public List<program> getAllProgram() {
		//返回数据节目信息
		String sql="select * from votetest.program";
		Connection conn=util.getConnection();
        try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			List<program>list=new ArrayList<program>();
			while(rs.next()){
				program pro=new program();
				pro.setId(rs.getInt(1));
				pro.setName(rs.getString(2));
				pro.setPreformer(rs.getString(3));
				pro.setDep(rs.getString(4));
				pro.setType(rs.getString(5));
				pro.setScore(rs.getInt(6));
				list.add(pro);
			}
			return list;			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public program getOneProgram(int id) {
		//返回给定id的节目信息
		String sql="select * from votetest.program where id=?";
		Connection conn=util.getConnection();
        try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs=pstmt.executeQuery();
			program pro=new program();
			while(rs.next()){				
				pro.setId(rs.getInt(1));
				pro.setName(rs.getString(2));
				pro.setPreformer(rs.getString(3));
				pro.setDep(rs.getString(4));
				pro.setType(rs.getString(5));
				pro.setScore(rs.getInt(6));				
			}
			return pro;			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean updatePro(program pro) {
		//更新节目信息
		String sql="update votetest.program set score=? where id=?";
		Connection conn=util.getConnection();
		try {
			// 获得预定义语句
			PreparedStatement pstmt = conn.prepareStatement(sql);
						// 设置插入参数
			int score=getOneScore(pro.getId());
			pstmt.setInt(1, pro.getScore()+score);
			pstmt.setInt(2, pro.getId());			
						
			if(pstmt.executeUpdate()>0){
				conn.close();
				return true;
			}
			else{
				conn.close();
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int getOneScore(int id) {
		String sql = "select score from votetest.program where id=?";
		Connection conn = util.getConnection();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1,id);

			ResultSet rs = pstmt.executeQuery();
			int score=0;
			while (rs.next()) {
				score=rs.getInt(1);
			}
			conn.close();
			return score;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
}
