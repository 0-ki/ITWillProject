package com.doArtShow.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.doArtShow.dto.ExhibitionDto;

// 갔다온 전시 정보 dao
public class VisitListDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}

	public int reviewCheck(String email, int exhID) {
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		
		int revchk = 0;
		String 	sql = null;
		
		try {
			conn = ds.getConnection();
			sql = "UPDATE ";
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt!=null)pstmt.close();} catch (SQLException e) {}
			try {if(conn!=null)conn.close();} catch (SQLException e) {}
		}
		
		return revchk;
	}
}
