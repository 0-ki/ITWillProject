package com.doArtShow.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import com.doArtShow.dto.MemberDto;

// 회원 정보 dao
public class MemberDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}

	public void insertMember(MemberDto member) {
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		String 				sql 	= null;
		
		try {
			conn = ds.getConnection();
			sql = "INSERT INTO MEMBER(ID, EMAIL, NAME, PW, IMG) "
				+ "VALUES (?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPw());
			pstmt.setString(5, member.getImg());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt!=null)pstmt.close();} catch (Exception e) {}
			try {if(conn!=null)conn.close();} catch (Exception e) {}
		}
	}

	public MemberDto checkMember(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		MemberDto member = null;
		
		try {
			conn = ds.getConnection();
			sql = "SELECT * FROM MEMBER WHERE ID=? AND PW=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			member = new MemberDto();
			
			while(rs.next()){
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
			}
			
		} catch (Exception e) {
		}
		
		return member;
	}
	
}
