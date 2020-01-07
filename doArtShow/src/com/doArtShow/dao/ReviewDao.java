package com.doArtShow.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.doArtShow.dto.ReviewDto;

// 리뷰 정보 dao
public class ReviewDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}

	//
	public void insertReview(ReviewDto rev) {
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		
		String 				sql 	= null;
		
		try {
			conn = ds.getConnection();
			sql = "INSERT INTO review(revNo, email, exhID, revContent, revDate) VALUES (?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rev.getRevNo());
			pstmt.setString(2, rev.getEmail());
			pstmt.setInt(3, rev.getExhID());
			pstmt.setString(4, rev.getRevContent());
			pstmt.setTimestamp(5, rev.getRevDate());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt!=null)pstmt.close();} catch (SQLException e) {}
			try {if(conn!=null)conn.close();} catch (SQLException e) {}
		}		
	}
}
