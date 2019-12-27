package com.doArtShow.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.doArtShow.dto.MemberDto;

// 회원 정보 dao
public class MemberDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}
	
	public int checkEmail(String email) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int res = 0;
		
		try {
			conn = ds.getConnection();
			sql  = "SELECT * FROM artshowdb.MEMBER WHERE EMAIL=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				res = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs    != null) try {rs.close();   } catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn  != null) try {conn.close(); } catch(SQLException ex) {}
		}
		return res;
	}
	
	public void insertMember(MemberDto member) {
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		String 				sql 	= null;
		
		try {
			conn = ds.getConnection();
			sql = "INSERT INTO artshowdb.MEMBER(ID, EMAIL, NAME, PW) "
				+ "VALUES (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPw());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt!=null)pstmt.close();} catch (SQLException e) {}
			try {if(conn!=null)conn.close();} catch (SQLException e) {}
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
			sql = "SELECT * FROM artshowdb.MEMBER WHERE ID=? AND PW=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			member = new MemberDto();
			
			while(rs.next()){
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt	!= null)pstmt.close();	} catch (SQLException e) {}
			try {if(rs		!= null)rs.close();		} catch (SQLException e) {}
			try {if(conn	!= null)conn.close();	} catch (SQLException e) {}
		}
		
		return member;
	}

	public MemberDto selectInfo(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		MemberDto member = null;
		try {
			conn = ds.getConnection();
			sql = "SELECT * FROM artshowdb.MEMBER WHERE ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			member = new MemberDto();
			
			while(rs.next()){
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt	!= null)pstmt.close();	} catch (SQLException e) {}
			try {if(rs		!= null)rs.close();		} catch (SQLException e) {}
			try {if(conn	!= null)conn.close();	} catch (SQLException e) {}
		}
		
		return member;
	}

	public void updateName(String name, String id) {
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		String 				sql 	= null;
		
		try {
			conn = ds.getConnection();
			sql = "UPDATE artshowdb.MEMBER SET name=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt!=null)pstmt.close();} catch (SQLException e) {}
			try {if(conn!=null)conn.close();} catch (SQLException e) {}
		}
	}

	public void updateEmail(String email, String id) {
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		String 				sql 	= null;
		
		try {
			conn = ds.getConnection();
			sql = "UPDATE artshowdb.MEMBER SET email=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt!=null)pstmt.close();} catch (SQLException e) {}
			try {if(conn!=null)conn.close();} catch (SQLException e) {}
		}		
	}

	public String findId(String email, String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		String id = null;
		
		try {
			conn = ds.getConnection();
			sql = "SELECT id FROM artshowdb.MEMBER WHERE email=? AND name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			
			rs = pstmt.executeQuery();
						
			while(rs.next()){
				id = rs.getString("id");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt	!= null)pstmt.close();	} catch (SQLException e) {}
			try {if(rs		!= null)rs.close();		} catch (SQLException e) {}
			try {if(conn	!= null)conn.close();	} catch (SQLException e) {}
		}
		
		return id;
	}

	public String findPw(String id, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		String pw = null;
		
		try {
			conn = ds.getConnection();
			sql = "SELECT pw FROM artshowdb.MEMBER WHERE id=? AND email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
						
			while(rs.next()){
				pw = rs.getString("pw");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt	!= null)pstmt.close();	} catch (SQLException e) {}
			try {if(rs		!= null)rs.close();		} catch (SQLException e) {}
			try {if(conn	!= null)conn.close();	} catch (SQLException e) {}
		}
		
		return pw;
	}
	
}
