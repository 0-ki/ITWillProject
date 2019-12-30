package com.doArtShow.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.doArtShow.dto.ExhibitionDto;

// 전시 정보 dao
public class ExhibitionDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}
	
	//전시목록을 출력하는 메서드(전체보기, 내림차순)
	public List<ExhibitionDto> selectList() throws Exception{
		System.out.println("##4번 ExhibitionDao실행 - selectList()");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT exhID, imageFile1, exhName, exhPlace, exhStartDate, exhEndDate FROM artshow ORDER BY exhID ASC";
		ArrayList<ExhibitionDto> lists = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			lists = new ArrayList<ExhibitionDto>();
			ExhibitionDto art = null;
			
			while(rs.next()) {
				art = new ExhibitionDto();
				
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
		
	}//end - public List<ExhibitionDto> selectList() throws Exception{
	
	//전시 총 갯수를 구하는 메서드(artShow테이블의 레코드 건수를 구함)
	public int getListCount() throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int rtnCount = 0;
		String sql = "SELECT count(*) FROM artshow";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
					
			if(rs.next()){
				rtnCount = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if (rs != null) rs.close();} catch(Exception e) {}
		    try {if (pstmt != null) pstmt.close();} catch(Exception e) {}
		    try {if (conn != null) conn.close();} catch(Exception e) {}
		}
		
		return rtnCount;
		
	}//end - public int getListCount() throws Exception{
	
	//리스트 목록의 content를 불러오는 메서드
	public ExhibitionDto selectOne(int exhID) throws Exception{
		System.out.println("##4-2번 ExhibitionDao실행 - selectOne()");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ExhibitionDto content = null;
		String sql = "SELECT * FROM artshow WHERE exhID=?";
		
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
				//for문으로 배열에 있는 exhGubun3 빼주기
//				for(int i=0;i<rs.getString("exhGubun3").length();i++){
//					content.setExhGubun3();
//				}
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
		
	}//end - public ExhibitionDto selectOne(int exhID) throws Exception{
	
	//조회수 증가하는 메서드
	public void updateReadCount(int exhID){
		System.out.println("##4-1번 ExhibitionDao실행 - updateReadCount()");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE artshow SET exhReadCount=exhReadCount+1 WHERE exhID=?";
		
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
	
	
}
