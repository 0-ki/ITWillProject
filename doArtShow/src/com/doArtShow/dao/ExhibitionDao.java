package com.doArtShow.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.doArtShow.dto.ExhibitionDto;
import com.doArtShow.dto.TagDto;

// 전시회 정보 dao
public class ExhibitionDao {
	DataSource ds;
	
	public void setDataSource(DataSource ds){
		this.ds = ds;
	}

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
					+ " 							exhPlaceAddr1 =?, "
					+ "							exhPlaceAddr2 =?, "
					+ "							exhUrl 			=?, "
					+ "							exhStartDate 	=?, "
					+ "							exhEndDate 	=?, "
					+ "							opTime 			=?, "
					+ "							tel 				=?, "
					+ "							admFee 			=?, "
					+ "							imageFile1 		=?, "
					+ "							imageFile2 		=? "
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
