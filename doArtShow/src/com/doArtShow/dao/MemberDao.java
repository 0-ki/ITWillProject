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
			sql = "INSERT INTO artshowdb.MEMBER(EMAIL, NAME, BIRTH, GENDER, PW) "
				+ "VALUES (?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getBirth());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getPw());
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt!=null)pstmt.close();} catch (SQLException e) {}
			try {if(conn!=null)conn.close();} catch (SQLException e) {}
		}
	}

	public MemberDto checkMember(String email, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		MemberDto member = null;
		
		try {
			conn = ds.getConnection();
			sql = "SELECT * FROM artshowdb.MEMBER WHERE EMAIL=? AND PW=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			member = new MemberDto();
			
			while(rs.next()){
				member.setBirth(rs.getString("birth"));
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

	public MemberDto selectInfo(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		MemberDto member = null;
		try {
			conn = ds.getConnection();
			sql = "SELECT * FROM artshowdb.MEMBER WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			member = new MemberDto();
			
			while(rs.next()){
				member.setEmail(rs.getString("email"));
				member.setPw(rs.getString("pw"));
				member.setBirth(rs.getString("birth"));
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

	public void updateBirth(String birth, String email) {
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		String 				sql 	= null;
		
		try {
			conn = ds.getConnection();
			sql = "UPDATE artshowdb.MEMBER SET birth=? WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, birth);
			pstmt.setString(2, email);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt!=null)pstmt.close();} catch (SQLException e) {}
			try {if(conn!=null)conn.close();} catch (SQLException e) {}
		}
	}

	public void updatePw(String pw, String email) {
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		String 				sql 	= null;
		
		try {
			conn = ds.getConnection();
			sql = "UPDATE artshowdb.MEMBER SET pw=? WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, email);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt!=null)pstmt.close();} catch (SQLException e) {}
			try {if(conn!=null)conn.close();} catch (SQLException e) {}
		}		
	}

	public String findEmail(String name, String birth) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		String email = null;
		
		try {
			conn = ds.getConnection();
			sql = "SELECT email FROM artshowdb.MEMBER WHERE name=? AND birth=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, birth);
			
			rs = pstmt.executeQuery();
						
			if(rs.next()){
				email = rs.getString("email");
				System.out.println(email);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt	!= null)pstmt.close();	} catch (SQLException e) {}
			try {if(rs		!= null)rs.close();		} catch (SQLException e) {}
			try {if(conn	!= null)conn.close();	} catch (SQLException e) {}
		}
		
		return email;
	}

	public String findPw(String email, String birth) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		String pw = null;
		
		try {
			conn = ds.getConnection();
			sql = "SELECT pw FROM artshowdb.MEMBER WHERE email=? AND birth=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, birth);
			
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
