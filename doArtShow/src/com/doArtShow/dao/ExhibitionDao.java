package com.doArtShow.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.doArtShow.dto.ExhListDto;
import com.doArtShow.dto.ExhibitionDto;
import com.doArtShow.dto.ReviewDto;
import com.doArtShow.dto.ReviewListDto;
import com.doArtShow.dto.TagDto;

// 전시회 정보 dao
public class ExhibitionDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}

	public ArrayList<ExhibitionDto> searchExhibition(String search) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<ExhibitionDto> list =null;
		
		
		try {
			conn = ds.getConnection();
			System.out.println("일단 들어왔음");
			sql  = 	" SELECT ExhID, ExhPlaceAddr1, ExhName , ArtistName , ExhPlace,  ExhStartDate , ExhEndDate , ImageFile1 FROM artshowdb.artshow WHERE ( ExhName like ? OR ArtistName like ? OR ExhPlace like ? ) AND ActiveFlag='N' GROUP BY ExhID ORDER BY ExhEndDate DESC ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
			System.out.println("sql문 세팅!");
			rs = pstmt.executeQuery();
			System.out.println("sql문 실행!!됨!");
			list = new ArrayList<ExhibitionDto>();
			ExhibitionDto dto =null;
			
			while(rs.next()){
				dto = new ExhibitionDto();
				dto.setExhID(rs.getInt("ExhID"));
				dto.setExhPlaceAddr1(rs.getString("ExhPlaceAddr1"));
				dto.setExhName(rs.getString("ExhName"));
				dto.setArtistName(rs.getString("ArtistName"));
				dto.setExhPlace(rs.getString("ExhPlace"));
				dto.setExhStartDate(rs.getString("ExhStartDate"));
				dto.setExhEndDate(rs.getString("ExhEndDate"));
				dto.setImageFile1(rs.getString("ImageFile1"));
				list.add(dto);
				}
				 
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {if (rs != null) rs.close();} catch(Exception e) {}
				try {if (pstmt != null) pstmt.close();} catch(Exception e) {}
				try {if (conn != null) conn.close();} catch(Exception e) {}
			}
		
		return list;
		
	}
	
	//지도 페이지 넘어가는 처리
	public ArrayList<ExhibitionDto> searchMapExhibition() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<ExhibitionDto> lists =null;
		
		
		try {
			conn = ds.getConnection();
			sql  = 	" SELECT ExhID, ExhPlaceAddr1, ExhName , ArtistName , ExhPlace,  ExhStartDate , ExhEndDate , ImageFile1 FROM artshowdb.artshow WHERE ActiveFlag='N' GROUP BY ExhID ORDER BY ExhEndDate DESC ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			lists = new ArrayList<ExhibitionDto>();
			ExhibitionDto dto =null;
			
			while(rs.next()){
				dto = new ExhibitionDto();
				dto.setExhID(rs.getInt("ExhID"));
				dto.setExhPlaceAddr1(rs.getString("ExhPlaceAddr1"));
				dto.setExhName(rs.getString("ExhName"));
				dto.setArtistName(rs.getString("ArtistName"));
				dto.setExhPlace(rs.getString("ExhPlace"));
				dto.setExhStartDate(rs.getString("ExhStartDate"));
				dto.setExhEndDate(rs.getString("ExhEndDate"));
				dto.setImageFile1(rs.getString("ImageFile1"));
				lists.add(dto);
				}
				 
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {if (rs != null) rs.close();} catch(Exception e) {}
				try {if (pstmt != null) pstmt.close();} catch(Exception e) {}
				try {if (conn != null) conn.close();} catch(Exception e) {}
			}
		
		return lists;
		
	}

	//전시목록을 출력하는 메서드(전체보기, 내림차순)
	public List<ExhListDto> selectList(){
		System.out.println("##4번 ExhibitionDao실행 - selectList()");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT exhID, imageFile1, exhName, exhPlace, exhStartDate, exhEndDate FROM artshowdb.artshow ORDER BY exhID ASC";
		ArrayList<ExhListDto> lists = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			lists = new ArrayList<ExhListDto>();
			ExhListDto art = null;
			
			while(rs.next()) {
				art = new ExhListDto();
				
				art.setExhID(rs.getInt("exhID"));
				art.setImageFile1(rs.getString("imageFile1"));
				art.setExhName(rs.getString("exhName"));
				art.setExhPlace(rs.getString("exhPlace"));
				art.setExhStartDate(rs.getString("exhStartDate"));
				art.setExhEndDate(rs.getString("exhEndDate"));
				
				lists.add(art);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null) rs.close();} catch(Exception e) {}
		    try {if (pstmt != null) pstmt.close();} catch(Exception e) {}
		    try {if (conn != null) conn.close();} catch(Exception e) {}
		}
		
		System.out.println("lists : " + lists);
		return lists;
		
	}//end - public List<ExhibitionDto> selectList(){
	
	//전시 총 갯수를 구하는 메서드(artShow테이블의 레코드 건수를 구함)
	public int getListCount(){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int listCnt = 0;
		String sql = "SELECT count(*) FROM artshowdb.artshow";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
					
			if(rs.next()){
				listCnt = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null) rs.close();} catch(Exception e) {}
		    try {if (pstmt != null) pstmt.close();} catch(Exception e) {}
		    try {if (conn != null) conn.close();} catch(Exception e) {}
		}
		
		return listCnt;
		
	}//end - public int getListCount(){
	
	//정렬로 리스트 출력
	public List<ExhListDto> selectSortList(String sortBtn){
		System.out.println("##4-1번 ExhibitionDao실행 - selectSortList()");
			
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		String sql = "";
		ArrayList<ExhListDto> lists = null;
			
		try {
			conn = ds.getConnection();
			if(sortBtn.equals("sortBtn1")){ //진행중전시
				sql = "SELECT exhID, imageFile1, exhName, exhPlace, exhStartDate, exhEndDate FROM artshowdb.artshow WHERE DATE(exhStartDate)<=DATE(now()) AND DATE(exhEndDate)>=DATE(now()) ORDER BY exhStartDate DESC";
			}else if(sortBtn.equals("sortBtn2")){ //인기전시
				sql = "SELECT exhID, imageFile1, exhName, exhPlace, exhStartDate, exhEndDate FROM artshowdb.artshow ORDER BY exhReadCount DESC";
			}else if(sortBtn.equals("sortBtn3")){ //곧종료전시
				sql = "SELECT exhID, imageFile1, exhName, exhPlace, exhStartDate, exhEndDate FROM artshowdb.artshow WHERE DATE(exhEndDate)>=DATE(now()) ORDER BY exhEndDate ASC";
			}else if(sortBtn.equals("sortBtn4")){ //종료전시
				sql = "SELECT exhID, imageFile1, exhName, exhPlace, exhStartDate, exhEndDate FROM artshowdb.artshow WHERE DATE(exhEndDate)<DATE(now()) ORDER BY exhEndDate DESC";
			}
			pstmt = conn.prepareStatement(sql);
				
			rs = pstmt.executeQuery();
				
			lists = new ArrayList<ExhListDto>();
			ExhListDto art = null;
				
			while(rs.next()) {
				art = new ExhListDto();
					
				art.setExhID(rs.getInt("exhID"));
				art.setImageFile1(rs.getString("imageFile1"));
				art.setExhName(rs.getString("exhName"));
				art.setExhPlace(rs.getString("exhPlace"));
				art.setExhStartDate(rs.getString("exhStartDate"));
				art.setExhEndDate(rs.getString("exhEndDate"));
					
				lists.add(art);
			}
			
			
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null) rs.close();} catch(Exception e) {}
			try {if (pstmt != null) pstmt.close();} catch(Exception e) {}
			try {if (conn != null) conn.close();} catch(Exception e) {}
		}
		
		return lists;
			
	}
	
	//정렬로 전시갯수 
	public int getSortListCount(String sortBtn) {
		System.out.println("##4-2번 ExhibitionDao실행 - getTagListCount()");
			
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		int listCnt = 0;
		String sql = "SELECT count(*) FROM artshowdb.artshow";
			
		try {
			conn = ds.getConnection();
			if(sortBtn.equals("sortBtn1")){ //진행중전시
				sql = "SELECT count(*) FROM artshowdb.artshow WHERE DATE(exhStartDate)<=DATE(now()) AND DATE(exhEndDate)>=DATE(now())";
			}else if(sortBtn.equals("sortBtn2")){ //인기전시
				sql = "SELECT count(*) FROM artshowdb.artshow";
			}else if(sortBtn.equals("sortBtn3")){ //곧종료전시
				sql = "SELECT count(*) FROM artshowdb.artshow WHERE DATE(exhEndDate)>=DATE(now())";
			}else if(sortBtn.equals("sortBtn4")){ //종료전시
				sql = "SELECT count(*) FROM artshowdb.artshow WHERE DATE(exhEndDate)<DATE(now())";
			}
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
						
			if(rs.next()){
				listCnt = rs.getInt(1);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null) rs.close();} catch(Exception e) {}
		    try {if (pstmt != null) pstmt.close();} catch(Exception e) {}
		    try {if (conn != null) conn.close();} catch(Exception e) {}
		}
			
		return listCnt;
	}
		
	//태그로 리스트 출력
	public List<ExhListDto> selectTagList(String ctgBtn, String ctgName){
		System.out.println("##4-1번 ExhibitionDao실행 - selectTagList()");
				
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		String sql = "";
		ArrayList<ExhListDto> lists = null;
				
		try {
			conn = ds.getConnection();
			if(ctgBtn.equals("tagCtg")){ //태그로 찾기
				sql = "SELECT exhID, imageFile1, exhName, exhPlace, exhStartDate, exhEndDate FROM artshowdb.artshow WHERE exhid IN (SELECT exhid FROM artshowdb.artshowtag WHERE tagname=?)";
			}else if(ctgBtn.equals("locCtg")){ //위치로 찾기
				sql = "SELECT exhID, imageFile1, exhName, exhPlace, exhStartDate, exhEndDate FROM artshowdb.artshow WHERE ExhGubun4=? ORDER BY registerDate DESC";
			}else if(ctgBtn.equals("genCtg")){ //장르로 찾기
				sql = "SELECT exhID, imageFile1, exhName, exhPlace, exhStartDate, exhEndDate FROM artshowdb.artshow WHERE ExhGubun2=? ORDER BY registerDate DESC";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ctgName);
				
			rs = pstmt.executeQuery();
					
			lists = new ArrayList<ExhListDto>();
			ExhListDto art = null;
					
			while(rs.next()) {
				art = new ExhListDto();
						
				art.setExhID(rs.getInt("exhID"));
				art.setImageFile1(rs.getString("imageFile1"));
				art.setExhName(rs.getString("exhName"));
				art.setExhPlace(rs.getString("exhPlace"));
				art.setExhStartDate(rs.getString("exhStartDate"));
				art.setExhEndDate(rs.getString("exhEndDate"));
						
				lists.add(art);
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null) rs.close();} catch(Exception e) {}
		    try {if (pstmt != null) pstmt.close();} catch(Exception e) {}
			try {if (conn != null) conn.close();} catch(Exception e) {}
		}
				
		return lists;
				
	}

	//태그로 전시갯수 
	public int getTagListCount(String ctgBtn, String ctgName) {
		System.out.println("##4-2번 ExhibitionDao실행 - getTagListCount()");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int listCnt = 0;
		String sql = "SELECT count(*) FROM artshowdb.artshow";
		
		try {
			conn = ds.getConnection();
			if(ctgBtn.equals("tagCtg")){ //태그로 찾기
				sql = "SELECT count(*) FROM artshowdb.artshow WHERE exhid IN (SELECT exhid FROM artshowdb.artshowtag WHERE tagname=?)";
			}else if(ctgBtn.equals("locCtg")){ //위치로 찾기
				sql = "SELECT count(*) FROM artshowdb.artshow WHERE ExhGubun4=?";
			}else if(ctgBtn.equals("genCtg")){ //장르로 찾기
				sql = "SELECT count(*) FROM artshowdb.artshow WHERE ExhGubun2=?";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ctgName);
			
			rs = pstmt.executeQuery();
					
			if(rs.next()){
				listCnt = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null) rs.close();} catch(Exception e) {}
		    try {if (pstmt != null) pstmt.close();} catch(Exception e) {}
		    try {if (conn != null) conn.close();} catch(Exception e) {}
		}
		
		return listCnt;
	}
	
	//리스트 목록의 content를 불러오는 메서드
	public ExhibitionDto selectOne(int exhID){
		System.out.println("##4-2번 ExhibitionDao실행 - selectOne()");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ExhibitionDto content = null;
		String sql = "SELECT * FROM artshowdb.artshow WHERE exhID=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, exhID);
			
			rs = pstmt.executeQuery();
					
			if(rs.next()){
				content = new ExhibitionDto();
				
				content.setExhID(rs.getInt("exhID"));
				content.setExhGubun1(rs.getString("exhGubun1"));
				content.setExhGubun2(rs.getString("exhGubun2"));
				content.setExhGubun4(rs.getString("exhGubun4"));
				content.setExhName(rs.getString("exhName"));
				content.setExhGubun1(rs.getString("exhGubun1"));
				content.setArtistName(rs.getString("artistName"));
				content.setArtistInfo(rs.getString("artistInfo"));
				content.setExhContent(rs.getString("exhContent"));
				content.setExhPlace(rs.getString("exhPlace"));
				content.setExhUrl(rs.getString("exhUrl"));
				content.setExhGubun1(rs.getString("exhGubun1"));
				content.setExhPlaceAddr1(rs.getString("exhPlaceAddr1"));
				content.setExhStartDate(rs.getString("exhStartDate"));
				content.setExhEndDate(rs.getString("exhEndDate"));
				content.setOpTime(rs.getString("opTime"));
				content.setTel(rs.getString("tel"));
				content.setAdmFee(rs.getString("admFee"));
				content.setImageFile1(rs.getString("imageFile1"));
				content.setImageFile2(rs.getString("imageFile2"));
				//imageFile3과 4는 null값일 경우를 처리해줘야 함 -> 데이터를 뽑을 때 할것!!
				content.setImageFile3(rs.getString("imageFile3"));
				content.setImageFile4(rs.getString("imageFile4"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {if (rs != null) rs.close();} catch(Exception e) {}
		    try {if (pstmt != null) pstmt.close();} catch(Exception e) {}
		    try {if (conn != null) conn.close();} catch(Exception e) {}
		}
		
		return content;
		
	}//end - public ExhibitionDto selectOne(int exhID){
	
	//조회수 증가하는 메서드
	public void updateReadCount(int exhID){
		System.out.println("##4-1번 ExhibitionDao실행 - updateReadCount()");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE artshowdb.artshow SET exhReadCount=exhReadCount+1 WHERE exhID=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, exhID);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		    try {if (pstmt != null) pstmt.close();} catch(Exception e) {}
		    try {if (conn != null) conn.close();} catch(Exception e) {}
		}
		
	}//end - public void updateReadCount(int exhID){
	
	//exhID에 해당하는 리뷰 목록
	public List<ReviewListDto> revContent(int exhID){
		System.out.println("##4-4번 ExhibitionDao실행 - revContent()");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		ArrayList<ReviewListDto> revLists = null;
		
		try {
			conn = ds.getConnection();
			sql = "SELECT r.revContent, r.revDate, m.name, m.profileImg "
				+ "FROM artshow a, review r, member m "
				+ "WHERE r.email=m.email AND r.exhID=a.ExhID AND a.ExhID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, exhID);
			
			rs = pstmt.executeQuery();
			
			revLists = new ArrayList<ReviewListDto>();
			ReviewListDto rev = null;
			
			while(rs.next()) {
				rev = new ReviewListDto();
				rev.setRevContent(rs.getString("revContent"));
				rev.setRevDate(rs.getDate("revDate"));
				rev.setName(rs.getString("name"));
				rev.setProfileImg(rs.getString("profileImg"));
			
				revLists.add(rev);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null) rs.close();} catch(Exception e) {}
		    try {if (pstmt != null) pstmt.close();} catch(Exception e) {}
		    try {if (conn != null) conn.close();} catch(Exception e) {}
		}
		
		return revLists;
	}//end - public List<ReviewListDto> revContent(int exhID)
	
	//리뷰 총 갯수를 구하는 메서드(테이블의 레코드 건수를 구함)
	public int getRevCount(int exhID){
		System.out.println("##4-3번 ExhibitionDao실행 - getRevCount()");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		int RevCnt = 0;
		String sql = "SELECT count(*) FROM artshowdb.review WHERE exhID=?";
			
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, exhID);
			
			rs = pstmt.executeQuery();
						
			if(rs.next()){
				RevCnt = rs.getInt(1);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null) rs.close();} catch(Exception e) {}
			try {if (pstmt != null) pstmt.close();} catch(Exception e) {}
			try {if (conn != null) conn.close();} catch(Exception e) {}
		}
			
		return RevCnt;
			
	}//end - public int getRevCount(int exhID)
	
	//전시 상세정보를 불러오는 페이지를 로드할때, 로그인 되어있는 경우의 가고싶어요 여부 체크
	public int wishCheck(String email, int exhID) {
		System.out.println("##4-1-0번 ExhibitionDao실행 - wishCheck()");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int wishchk = 0;
		String 	sql = null;
		
		try {
			conn = ds.getConnection();
			sql	= "SELECT wishCheck FROM artshowdb.wishArt WHERE email=? AND exhID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setInt(2, exhID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				wishchk = rs.getInt("wishCheck");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(rs!= null)rs.close();} catch (SQLException e) {}
			try {if(pstmt!=null)pstmt.close();} catch (SQLException e) {}
			try {if(conn!=null)conn.close();} catch (SQLException e) {}
		}
		
		return wishchk;
	}//end - public int wishCheck(String email, int exhID)
	
//-------------------------------------------------------------------------------------------------------------
//	programmed by Hojeong - begin
//-------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------
//	public void insertExhibition(ExhibitionDto exhibition) - begin
// 	exhibition insert - 전시회 등록	
//-------------------------------------------------------------------------------------------------------------	
	public void insertExhibition(ExhibitionDto exhibition) {
		System.out.println("insertExhibition - Dao");
		Connection 			conn 		= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 				rs 			= null;
		int							num 		= 0;
		String 					sql 		= null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select max(exhID) from artshow");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1)+1;
			}else{
				num = 1;
			}
			
			sql = "INSERT INTO artshow(	exhID, "
					+ "							memberID, "
					+ "							exhGubun1, "
					+ "							exhGubun2, "
					+ "							exhGubun4, "
					+ "							exhName, "
					+ "							artistName, "
					+ "							artistInfo, "
					+ "							exhContent, "
					+ "							exhPlace, "
					+ "						  	exhPlaceZip, "
					+ "							exhPlaceAddr1, "
					+ "							exhPlaceAddr2, "
					+ "							exhUrl, "
					+ "							exhStartDate, "
					+ "							exhEndDate, "
					+ "							opTime, "
					+ "							tel, "
					+ "							admFee, "
					+ "							imageFile1, "
					+ "							imageFile2, "
					+ "							imageFile3, "
					+ "							imageFile4, "
					+ "							exhReadCount, "
					+ "							registerDate, "
					+ "							activeFlag) "
				+ "VALUES (?,?,?,?,?,?,?,?,?,?, "
				+ "			?,?,?,?,?,?,?,?,?,?, "
				+ "			?,?,?,?,?,? ) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, exhibition.getMemberID());
			pstmt.setString(3, exhibition.getExhGubun1());
			pstmt.setString(4, exhibition.getExhGubun2());
			pstmt.setString(5, exhibition.getExhGubun4());
			pstmt.setString(6, exhibition.getExhName());
			pstmt.setString(7, exhibition.getArtistName());
			pstmt.setString(8, exhibition.getArtistInfo());
			pstmt.setString(9, exhibition.getExhContent());
			pstmt.setString(10, exhibition.getExhPlace());
			//pstmt.setString(11, exhibition.getExhPlaceZip());
			pstmt.setString(12, exhibition.getExhPlaceAddr1());
			//pstmt.setString(13, exhibition.getExhPlaceAddr2());
			pstmt.setString(11, "001-001");
			//pstmt.setString(12, "addr1");
			pstmt.setString(13, "addr2");
			pstmt.setString(14, exhibition.getExhUrl());
			pstmt.setString(15, exhibition.getExhStartDate());
			pstmt.setString(16, exhibition.getExhEndDate());
			pstmt.setString(17, exhibition.getOpTime());
			pstmt.setString(18,  exhibition.getTel());
			pstmt.setString(19, exhibition.getAdmFee());
			pstmt.setString(20, exhibition.getImageFile1());
			pstmt.setString(21, exhibition.getImageFile2());
			pstmt.setString(22, exhibition.getImageFile3());
			pstmt.setString(23, exhibition.getImageFile4());
			pstmt.setInt(24, 0);
			pstmt.setTimestamp(25, exhibition.getRegisterDate());
			pstmt.setString(26,  "N");
	
			pstmt.executeUpdate();
			
			sql = "INSERT INTO artshowtag ( exhid, tagname ) values ( ?,? ) ";
			for (int i=0; i<exhibition.getExhGubun3().length; i++) {
				System.out.println("dao%%% "+exhibition.getExhGubun3()[i]);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, exhibition.getExhGubun3()[i]);
				pstmt.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null)rs.close();} catch (Exception e) {}
			try {if(pstmt!=null)pstmt.close();} catch (Exception e) {}
			try {if(conn!=null)conn.close();} catch (Exception e) {}
		}
	}
//-------------------------------------------------------------------------------------------------------------
//	public void insertExhibition(ExhibitionDto exhibition) - end
//-------------------------------------------------------------------------------------------------------------		
//-------------------------------------------------------------------------------------------------------------
//	public void updateExhibition(ExhibitionDto exhibition) - begin
//	exhibition update - 내가 등록한 전시회 수정	
//-------------------------------------------------------------------------------------------------------------			
	public void updateExhibition(ExhibitionDto exhibition) {
		System.out.println("updateExhibition - Dao");
		Connection 			conn 		= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 				rs 			= null;
		int							num 		= 0;
		String 					sql 		= null;
		
		try {
			conn = ds.getConnection();
			sql = "UPDATE artshow set	 	exhGubun1 	=?, "
					+ "							exhGubun2 	=?, "
					+ "							exhGubun4 	=?, "
					+ "							exhName 		=?, "
					+ "							artistName 		=?, "
					+ "							artistInfo 		=?, "
					+ "							exhContent 	=?, "
					+ "							exhPlace 		=?, "
					+ "						  	exhPlaceZip 	=?, "
					+ " 						exhPlaceAddr1 =?, "
					+ "							exhPlaceAddr2 =?, "
					+ "							exhUrl 			=?, "
					+ "							exhStartDate 	=?, "
					+ "							exhEndDate 	=?, "
					+ "							opTime 			=?, "
					+ "							tel 				=?, "
					+ "							admFee 			=?, "
					+ "							imageFile1 		=?, "
					+ "							imageFile2 		=?, "		// modified by Hojeong (20/01/03) ; 맨끝에 쉼표 추가함
					+ "							imageFile3 		=?, "
					+ "							imageFile4 		=? "
					+ "							WHERE exhID 	=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, exhibition.getExhGubun1());
			pstmt.setString(2, exhibition.getExhGubun2());
			pstmt.setString(3, exhibition.getExhGubun4());
			pstmt.setString(4, exhibition.getExhName());
			pstmt.setString(5, exhibition.getArtistName());
			pstmt.setString(6, exhibition.getArtistInfo());
			pstmt.setString(7, exhibition.getExhContent());
			pstmt.setString(8, exhibition.getExhPlace());
			pstmt.setString(9, "001-001");
			//pstmt.setString(9, exhibition.getExhPlaceZip());
			pstmt.setString(10, exhibition.getExhPlaceAddr1());
			//pstmt.setString(10, "addr1");
			//pstmt.setString(11, exhibition.getExhPlaceAddr2());
			pstmt.setString(11, "addr2");
			pstmt.setString(12, exhibition.getExhUrl());
			pstmt.setString(13, exhibition.getExhStartDate());
			pstmt.setString(14, exhibition.getExhEndDate());
			pstmt.setString(15, exhibition.getOpTime());
			pstmt.setString(16,  exhibition.getTel());
			pstmt.setString(17, exhibition.getAdmFee());
			pstmt.setString(18, exhibition.getImageFile1());
			pstmt.setString(19, exhibition.getImageFile2());
			pstmt.setString(20, exhibition.getImageFile3());
			pstmt.setString(21, exhibition.getImageFile4());
			pstmt.setInt(22, exhibition.getExhID());
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement( " DELETE FROM artshowtag WHERE exhID = ? ");
			pstmt.setInt(1, exhibition.getExhID());
			pstmt.executeUpdate();
			
			sql = "INSERT INTO artshowtag ( exhid, tagname ) values ( ?,? ) ";
			for (int i=0; i<exhibition.getExhGubun3().length; i++) {
				System.out.println("dao%%% "+exhibition.getExhGubun3()[i]);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, exhibition.getExhID());
				pstmt.setString(2, exhibition.getExhGubun3()[i]);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
				try {if(pstmt!=null)pstmt.close();} catch (Exception e) {}
				try {if(conn!=null)conn.close();} catch (Exception e) {}
		}
	}
//-------------------------------------------------------------------------------------------------------------
//	public void updateExhibition(ExhibitionDto exhibition) - end
//-------------------------------------------------------------------------------------------------------------	
//-------------------------------------------------------------------------------------------------------------
//	public ExhibitionDto selectExhibition(Integer exhID) - begin
//  내가 등록한 전시회 상세 정보 	
//-------------------------------------------------------------------------------------------------------------		
	public ExhibitionDto selectExhibition(Integer exhID) {
		System.out.println("selectExhibition - Dao");
		Connection 			conn 		= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 				rs 			= null;
		int							num 		= 0;
		String 					sql 		= null;
		ExhibitionDto exhibition = null;
		
		try {
			conn = ds.getConnection();
			pstmt =	conn.prepareStatement(" select * from artshow where exhID = ? and activeFlag = 'N'");
			pstmt.setInt(1, exhID);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				System.out.println("rs.next()");
				exhibition = new ExhibitionDto();
				exhibition.setExhID(rs.getInt("exhID"));
				exhibition.setMemberID(rs.getString("memberID"));
				exhibition.setExhGubun1(rs.getString("exhGubun1"));
				exhibition.setExhGubun2(rs.getString("exhGubun2"));
				exhibition.setExhGubun4(rs.getString("exhGubun4"));
				exhibition.setExhName(rs.getString("exhName"));
				exhibition.setArtistName(rs.getString("artistName"));
				exhibition.setArtistInfo(rs.getString("artistInfo"));
				exhibition.setExhContent(rs.getString("exhContent"));
				exhibition.setExhPlace(rs.getString("exhPlace"));
				exhibition.setExhPlaceAddr1(rs.getString("exhPlaceAddr1"));
				exhibition.setExhUrl(rs.getString("exhUrl"));
				exhibition.setExhStartDate(rs.getString("exhStartDate"));
				exhibition.setExhEndDate(rs.getString("exhEndDate"));
				exhibition.setOpTime(rs.getString("opTime"));
				exhibition.setTel(rs.getString("tel"));
				exhibition.setAdmFee(rs.getString("admFee"));
				exhibition.setImageFile1(rs.getString("imageFile1"));
				exhibition.setImageFile2(rs.getString("imageFile2"));
				exhibition.setImageFile3(rs.getString("imageFile3"));	//added by Hojeong 20/01/03
				exhibition.setImageFile4(rs.getString("imageFile4"));	//added by Hojeong 20/01/03
				exhibition.setRegisterDate(rs.getTimestamp("registerDate"));
				exhibition.setActiveFlag(rs.getString("activeFlag"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null)rs.close();} catch (Exception e) {}
			try {if(pstmt!=null)pstmt.close();} catch (Exception e) {}
			try {if(conn!=null)conn.close();} catch (Exception e) {}
		}
		return exhibition;	
	}
//-------------------------------------------------------------------------------------------------------------
//	public ExhibitionDto selectExhibition(Integer exhID) - end
//-------------------------------------------------------------------------------------------------------------		
//-------------------------------------------------------------------------------------------------------------
//	public ArrayList<TagDto> getTagList(Integer exhID) - begin
//	내가 등록한 전시회 tagList 가져오기	
//-------------------------------------------------------------------------------------------------------------		
	public ArrayList<TagDto> getTagList(Integer exhID) {
		System.out.println("getTags - Dao");
		Connection 			conn 		= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 				rs 			= null;
		int							count		= 0;
		String 					sql 		= null;
		String[] tags = null;
		ExhibitionDto exhibition = new ExhibitionDto();
		ArrayList<TagDto> tagList = new ArrayList<TagDto>();
		TagDto tag = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(" select count(*) from artshow, artshowTag "
					+ " where artshow.exhID = artshowTag.exhID and artshow.exhID=? ");
			pstmt.setInt(1, exhID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) count = rs.getInt(1);
	
			pstmt =	conn.prepareStatement(" select * from artshow, artshowTag "
					+ " where artshow.exhID = artshowTag.exhID and artshow.exhID=? ");
			pstmt.setInt(1, exhID);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				tag = new TagDto();
				tag.setExhID(rs.getInt("artshow.exhID"));
				tag.setExhTagName(rs.getString("tagName"));
				tagList.add(tag);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null)rs.close();} catch (Exception e) {}
			try {if(pstmt!=null)pstmt.close();} catch (Exception e) {}
			try {if(conn!=null)conn.close();} catch (Exception e) {}
		}
		
		return tagList;
	}
//-------------------------------------------------------------------------------------------------------------
//	public ArrayList<TagDto> getTagList(Integer exhID) - end
//	내가 등록한 전시회 tagList 가져오기	
//-------------------------------------------------------------------------------------------------------------		
//-------------------------------------------------------------------------------------------------------------
//	public List<ExhibitionDto> selectExhibitionMyList(String id) - begin
//	마이 페이지에서 내가 등록한 전시회 리스트 보기 
//-------------------------------------------------------------------------------------------------------------
	public List<ExhibitionDto> selectExhibitionMyList(String id) {
		System.out.println("selectExhibitionMyList - Dao" + id);
		Connection 			conn 		= null;
		PreparedStatement 	pstmt 	= null;
		ResultSet 				rs 			= null;
		int							count		= 0;
		String 					sql 		= null;
		List<ExhibitionDto> exhibitionList = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(" select * from artshow where memberID=? ");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				exhibitionList = new ArrayList<ExhibitionDto>();
				do {
					ExhibitionDto exhibition = new ExhibitionDto();
					exhibition.setExhID(rs.getInt("exhID"));
					exhibition.setMemberID(rs.getString("memberID"));
					exhibition.setExhGubun1(rs.getString("exhGubun1"));
					exhibition.setExhGubun2(rs.getString("exhGubun2"));
					exhibition.setExhGubun4(rs.getString("exhGubun4"));
					exhibition.setExhName(rs.getString("exhName"));
					exhibition.setArtistName(rs.getString("artistName"));
					exhibition.setArtistInfo(rs.getString("artistInfo"));
					exhibition.setExhContent(rs.getString("exhContent"));
					exhibition.setExhPlace(rs.getString("exhPlace"));
					exhibition.setExhPlaceAddr1(rs.getString("exhPlaceAddr1"));
					exhibition.setExhUrl(rs.getString("exhUrl"));
					exhibition.setExhStartDate(rs.getString("exhStartDate"));
					exhibition.setExhEndDate(rs.getString("exhEndDate"));
					exhibition.setOpTime(rs.getString("opTime"));
					exhibition.setTel(rs.getString("tel"));
					exhibition.setAdmFee(rs.getString("admFee"));
					exhibition.setImageFile1(rs.getString("imageFile1"));
					exhibition.setImageFile2(rs.getString("imageFile2"));
					exhibition.setImageFile3(rs.getString("imageFile3"));	//added by Hojeong 20/01/03
					exhibition.setImageFile4(rs.getString("imageFile4"));	//added by Hojeong 20/01/03
					exhibition.setRegisterDate(rs.getTimestamp("registerDate"));
					exhibition.setActiveFlag(rs.getString("activeFlag"));
					System.out.println("dao:"+exhibition.toString());
					exhibitionList.add(exhibition);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(rs!=null)rs.close();} catch (Exception e) {}
			try {if(pstmt!=null)pstmt.close();} catch (Exception e) {}
			try {if(conn!=null)conn.close();} catch (Exception e) {}
		}

		return exhibitionList;
	}

	

}
//-------------------------------------------------------------------------------------------------------------
//public List<ExhibitionDto> selectExhibitionMyList(String id) - end
//마이 페이지에서 내가 등록한 전시회 리스트 보기 
//-------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------
//programmed by Hojeong - end
//-------------------------------------------------------------------------------------------------------------
