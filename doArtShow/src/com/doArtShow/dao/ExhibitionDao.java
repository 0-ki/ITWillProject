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
		
	}
	
	//전시 갯수를 구하는 메서드(artShow테이블의 레코드 건수를 구함)
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
		
	}
	
	
}
