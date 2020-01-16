package com.doArtShow.dto;

import java.sql.Timestamp;

//마이페이지 리뷰목록을 위한 dto(artshow와 review의 항목이 모두 들어가있음.)
public class MyReviewDto {
	private int			exhID;		
	private String 		revContent;
	private Timestamp 	revDate;
	private String 		exhName;
	private String		imageFile1;
	
	public int getExhID() {
		return exhID;
	}
	public void setExhID(int exhID) {
		this.exhID = exhID;
	}
	public String getRevContent() {
		return revContent;
	}
	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}
	public Timestamp getRevDate() {
		return revDate;
	}
	public void setRevDate(Timestamp revDate) {
		this.revDate = revDate;
	}
	public String getExhName() {
		return exhName;
	}
	public void setExhName(String exhName) {
		this.exhName = exhName;
	}
	public String getImageFile1() {
		return imageFile1;
	}
	public void setImageFile1(String imageFile1) {
		this.imageFile1 = imageFile1;
	}
	
	
}
