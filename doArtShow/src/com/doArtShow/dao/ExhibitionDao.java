package com.doArtShow.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import com.doArtShow.dto.ExhibitionDto;

// 전시 정보 dao
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
			sql  = 	" SELECT ExhID, ExhName , ArtistName , ExhPlace,  ExhStartDate , ExhEndDate , ImageFile1 FROM artshowdb.artshow WHERE ( ExhName like ? OR ArtistName like ? OR ExhPlace like ? ) AND ActiveFlag='N' GROUP BY ExhID ORDER BY ExhEndDate DESC ";
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
			if(rs    != null) try {rs.close();   } catch(SQLException ex) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException ex) {}
			if(conn  != null) try {conn.close(); } catch(SQLException ex) {}
		}
		
		return list;
		
	}
	
	
}
