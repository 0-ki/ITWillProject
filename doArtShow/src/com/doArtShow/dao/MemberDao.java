package com.doArtShow.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.doArtShow.dto.ExhibitionDto;
import com.doArtShow.dto.MemberDto;
import com.doArtShow.dto.ReviewDto;

// 회원 정보 dao
public class MemberDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}
	//-------------------------------------------------------------------
	// 회원가입 시 이메일 중복확인
	//-------------------------------------------------------------------
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
				member.setGender(rs.getString("gender"));
				member.setPw(rs.getString("pw"));
				member.setEmail(rs.getString("email"));
				member.setName(rs.getString("name"));
				member.setProfileImg(rs.getString("profileImg"));
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
				member.setGender(rs.getString("gender"));
				member.setPw(rs.getString("pw"));
				member.setBirth(rs.getString("birth"));
				member.setName(rs.getString("name"));
				member.setProfileImg(rs.getString("profileImg"));
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

	public void updateMember(String birth, String gender, String pw, String profileImg, String email) {
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		String 				sql 	= null;
		
		try {
			conn = ds.getConnection();
			sql = "UPDATE artshowdb.MEMBER SET birth=?, gender=?, pw=?, profileImg=? WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, birth);
			pstmt.setString(2, gender);
			pstmt.setString(3, pw);
			pstmt.setString(4, profileImg);
			pstmt.setString(5, email);
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt!=null)pstmt.close();} catch (SQLException e) {}
			try {if(conn!=null)conn.close();} catch (SQLException e) {}
		}
	}
	
	public void updateGender(String gender, String email) {
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		String 				sql 	= null;
		
		try {
			conn = ds.getConnection();
			sql = "UPDATE artshowdb.MEMBER SET gender=? WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gender);
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
		System.out.println("findEmail실행");
		System.out.println(name+" "+birth);
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

	public void changePw(String newPw, String email, String birth) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = ds.getConnection();
			sql = "UPDATE artshowdb.MEMBER SET pw=? WHERE email=? AND birth=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPw);
			pstmt.setString(2, email);
			pstmt.setString(3, birth);
			
			pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt	!= null)pstmt.close();	} catch (SQLException e) {}
			try {if(conn	!= null)conn.close();	} catch (SQLException e) {}
		}
	}

	public void deleteMember(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = ds.getConnection();
			sql = "DELETE FROM artshowdb.MEMBER WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt	!= null)pstmt.close();	} catch (SQLException e) {}
			try {if(conn	!= null)conn.close();	} catch (SQLException e) {}
		}
	}
	
	//-------------------------------------------------------------------
	// 회원페이지(memberPage.jsp)에 쓸 가고 싶은 전시 목록을 구성
	//-------------------------------------------------------------------
	public ArrayList<ExhibitionDto> selectWishList(String email) throws Exception{
		ArrayList<ExhibitionDto> 	wishList = null;
		ExhibitionDto 				exhibitionDto;
		
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 			rs 		= null;
		String 				sql 	= "";
		
		try {
			conn 	= ds.getConnection();
			sql  	=  "SELECT  exhID, exhName, imageFile1 ";
			sql		+= "FROM	artshow ";
			sql		+= "WHERE 	exhID	IN ( SELECT exhID ";
			sql 	+= 						"FROM   wishart ";
			sql		+= 						"WHERE  email=?)";
			
			pstmt 	= conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs 		= pstmt.executeQuery();
			
			wishList = new ArrayList<ExhibitionDto>();
			
			while(rs.next()) {
				exhibitionDto 	= new ExhibitionDto();
				exhibitionDto.setExhID(rs.getInt("exhID"));
				exhibitionDto.setExhName(rs.getString("exhName"));
				exhibitionDto.setImageFile1(rs.getString("imageFile1"));
				
				System.out.println(exhibitionDto.toString());
				
				wishList.add(exhibitionDto);
				for(ExhibitionDto exh : wishList) {
					System.out.println(exh.toString());
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if(rs    != null) try {rs.close();   } catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn  != null) try {conn.close(); } catch(SQLException ex) {}
		}
		return wishList;
	}
	//-------------------------------------------------------------------
	// 회원페이지(memberPage.jsp) 회원이 가고 싶어 하는 전시의 개수를 찾는다.
	//-------------------------------------------------------------------
	public int countWishExh(String email) {
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 			rs 		= null;
		String 				sql 	= "";
		
		int wishCount = 0;
		
		try {
			conn 	= ds.getConnection();
			sql  	=  "SELECT  count(*) ";
			sql		+= "FROM	wishart	 ";
			sql		+= "WHERE   email=?	 ";
			
			pstmt 	= conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs 		= pstmt.executeQuery();
			
			if(rs.next()) {
				wishCount = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if(rs    != null) try {rs.close();   } catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn  != null) try {conn.close(); } catch(SQLException ex) {}
		}
		return wishCount;
	}
	
	//-------------------------------------------------------------------
	// 회원페이지(memberPage.jsp)에 쓸 다녀온 전시 목록을 구성
	//-------------------------------------------------------------------
	public ArrayList<ExhibitionDto> selectVisitList(String email) throws Exception{
		ArrayList<ExhibitionDto> 	visitList 		= null;
		ExhibitionDto 				exhibitionDto;
				
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 			rs 		= null;
		String 				sql 	= "";
				
		try {
			conn 	= ds.getConnection();
			conn 	= ds.getConnection();
			sql  	=  "SELECT  exhID, exhName, imageFile1 ";
			sql		+= "FROM	artshow ";
			sql		+= "WHERE 	exhID	IN ( SELECT exhID 	 ";
			sql 	+= 						"FROM   visitart ";
			sql		+= 						"WHERE  email=?) ";
			pstmt 	= conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs 		= pstmt.executeQuery();
			
			visitList 		= new ArrayList<ExhibitionDto>();
			
			while(rs.next()) {
				exhibitionDto 	= new ExhibitionDto();
				exhibitionDto.setMemberID(rs.getString("email"));
				exhibitionDto.setExhID(rs.getInt("exhID"));
				visitList.add(exhibitionDto);
			}
					
			} catch (Exception e) {
				e.printStackTrace();
					
			} finally {
				if(rs    != null) try {rs.close();   } catch(SQLException ex) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
				if(conn  != null) try {conn.close(); } catch(SQLException ex) {}
			}
			return visitList;
	}
	
	//-------------------------------------------------------------------
	// 회원페이지(memberPage.jsp) 다녀온 전시 개수를 찾는 메소드
	//-------------------------------------------------------------------
	public int countVisitExh(String email) {
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 			rs 		= null;
		String 				sql 	= "";
		
		int visitCount = 0;
		
		try {
			conn 	= ds.getConnection();
			sql  	=  "SELECT  count(*) ";
			sql		+= "FROM	visitart ";
			sql		+= "WHERE   email=?	 ";
			
			pstmt 	= conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs 		= pstmt.executeQuery();
			
			if(rs.next()) {
				visitCount = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if(rs    != null) try {rs.close();   } catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn  != null) try {conn.close(); } catch(SQLException ex) {}
		}
		return visitCount;
	}
	
	//-------------------------------------------------------------------
	// 회원페이지(memberPage.jsp)에 쓸 리뷰 목록을 구성
	//-------------------------------------------------------------------
	public ArrayList<ReviewDto> selectReviewList(String email) throws Exception{
		ArrayList<ReviewDto> 	reviewList 		= null;
		ReviewDto 				reviewDto;
		
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 			rs 		= null;
		String 				sql 	= "";
		
		try {
			conn 	= ds.getConnection();
			sql  	= "SELECT * FROM artshowdb.REVIEW WHERE EMAIL=? ORDER BY EXHID";
			pstmt 	= conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs 		= pstmt.executeQuery();
			
			reviewList 		= new ArrayList<ReviewDto>();
			
			while(rs.next()) {
				reviewDto	 	= new ReviewDto();
				reviewDto.setEmail(rs.getString("email"));
				reviewDto.setExhID(rs.getInt("exhID"));
				reviewDto.setRevContent(rs.getString("revContent"));
				reviewDto.setRevDate(rs.getDate("revDate"));
				reviewList.add(reviewDto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if(rs    != null) try {rs.close();   } catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn  != null) try {conn.close(); } catch(SQLException ex) {}
		}
		return reviewList;
	}
	
	//-------------------------------------------------------------------
	// 회원페이지(memberPage.jsp) 회원이 작성한 리뷰에 해당하는 전시 정보를 가져온다.
	//-------------------------------------------------------------------
	public ExhibitionDto selectInfoForRev(int exhID) throws Exception{
		ExhibitionDto		exhibitionDto = null;
				
		Connection 			conn 	= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 			rs 		= null;
		String 				sql 	= "";
				
		try {
			conn 	= ds.getConnection();
			sql  	= "SELECT * FROM artshowdb.ARTSHOW WHERE exhID=? ORDER BY EXHID";
			pstmt 	= conn.prepareStatement(sql);
			pstmt.setInt(1, exhID);
			rs 		= pstmt.executeQuery();
								
			if(rs.next()) {
				exhibitionDto 	= new ExhibitionDto();
				exhibitionDto.setExhName(rs.getString("exhName"));
				exhibitionDto.setImageFile1(rs.getString("imageFile1"));
			}
					
			} catch (Exception e) {
				e.printStackTrace();
					
			} finally {
				if(rs    != null) try {rs.close();   } catch(SQLException ex) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
				if(conn  != null) try {conn.close(); } catch(SQLException ex) {}
			}
			return exhibitionDto;
	}
	
	
	
}