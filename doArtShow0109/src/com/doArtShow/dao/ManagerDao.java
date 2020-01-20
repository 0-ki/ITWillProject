package com.doArtShow.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.doArtShow.dto.ExhibitionDto;
import com.doArtShow.dto.MemberDto;

// 관리자 정보 dao
public class ManagerDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}
	
	
	
	
	public int checkManager(String managerId, String managerPwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbPwd = "";
		int rtnVal = -1;

		try {
			conn = ds.getConnection();
			
			String sql = "select managerPasswd from manager where managerId = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, managerId);
			rs = pstmt.executeQuery();
				
			if (rs.next()) {	// 아이디 정보 일치
				dbPwd = rs.getString("managerPasswd");
				
				if (dbPwd.equals(managerPwd)) {	// 비밀번호 일치
					rtnVal = 1;
				} else {	// 비밀번호 오류
					rtnVal = 0;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return rtnVal;
	}

	public List<MemberDto> getMembers() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<MemberDto> list = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from member";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				list = new ArrayList<MemberDto>();
				
				do {
					list.add(new MemberDto(rs.getString(1), rs.getString(2),rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6)));	
				} while (rs.next());
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	public int getMemberCnt() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int memberCnt = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select count(*) from member";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				//System.out.println("rs.next() >>> " + rs.getInt(1));
				memberCnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return memberCnt;
	}

	public int getNewExhListCnt() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int newExhListCnt = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select count(*) from artshow where ActiveFlag = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "N");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				//System.out.println("rs.next() >>> " + rs.getInt(1));
				newExhListCnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return newExhListCnt;
	}

	public List<ExhibitionDto> getAllExhLists() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<ExhibitionDto> list = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from artshow";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				list = new ArrayList<ExhibitionDto>();
				
				do {
					list.add(new ExhibitionDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getInt(24), rs.getTimestamp(25), rs.getString(26)));
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	public List<ExhibitionDto> getNewExhLists() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ExhibitionDto> list = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from artshow where ActiveFlag = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "N");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				list = new ArrayList<ExhibitionDto>();
				
				do {
					list.add(new ExhibitionDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getInt(24), rs.getTimestamp(25), rs.getString(26)));
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	public void updateActiveFlagTrue(String exhID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "update artshow set ActiveFlag = ? where ExhID = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "Y");
			pstmt.setString(2, exhID);
			
			int res = pstmt.executeUpdate();
			
			if (res > 0) {
				System.out.println("Update ActiveFlagTrue Success!");
			} else {
				System.out.println("Update ActiveFlagTrue Fail...");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public void updateActiveFlagFalse(String exhID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "update artshow set ActiveFlag = ? where ExhID = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "N");
			pstmt.setString(2, exhID);
			
			int res = pstmt.executeUpdate();
			
			if (res > 0) {
				System.out.println("Update ActiveFlagFalse Success!");
			} else {
				System.out.println("Update ActiveFlagFalse Fail...");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	public int getVisitCnt() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int visitCnt = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select count(*) from visitPage where visitDate <= sysdate()";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				visitCnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return visitCnt;
	}

	public List<ExhibitionDto> getEndExhLists() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<ExhibitionDto> list = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from artshow where exhenddate < sysdate()";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				list = new ArrayList<ExhibitionDto>();
				
				do {
					list.add(new ExhibitionDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getInt(24), rs.getTimestamp(25), rs.getString(26)));
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			
		return list;
	}

	public void updateActiveFlagEnd(String exhID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "update artshow set ActiveFlag = ? where ExhID = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "E");
			pstmt.setString(2, exhID);
			
			int res = pstmt.executeUpdate();
			
			if (res > 0) {
				System.out.println("Update ActiveFlagEnd Success!");
			} else {
				System.out.println("Update ActiveFlagEnd Fail...");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public ExhibitionDto getExhibition(int exhID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ExhibitionDto exhDto = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from artshow where ExhID = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, exhID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				exhDto = new ExhibitionDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getInt(24), rs.getTimestamp(25), rs.getString(26));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return exhDto;
	}

	public List<String> getExhListTags(int exhID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<String> list = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from artshowtag where exhid = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, exhID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				list = new ArrayList<>();
				
				do {
					list.add(rs.getString(2));
				} while (rs.next());
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	public int deleteExhListTags(int exhID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int res = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "delete from artshowtag where exhid = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, exhID);
			
			res = pstmt.executeUpdate();
			
			if (res > 0) {
				System.out.println("Delete ArtShowTag Success!");
			} else {
				System.out.println("Delete ArtShowTag Fail...");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return res;
	}

	public int updateExhListTags(int exhID, String tag) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int res = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert artshowtag set exhid = ?, tagname = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, exhID);
			pstmt.setString(2, tag);
			
			res = pstmt.executeUpdate();
			
			if (res > 0) {
				System.out.println("Update ArtShowTag Success!");
			} else {
				System.out.println("Update ArtShowTag Fail...");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return res;
	}
	
	
}
