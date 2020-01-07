package com.doArtShow.dto;

import java.sql.Timestamp;

// 리뷰 정보
public class ReviewDto {
	private int 		revNo;
	private String 		email;
	private int 		exhID;
	private String 		revContent;
	private Timestamp 	revDate;
	
	public int getRevNo() {
		return revNo;
	}
	public ReviewDto setRevNo(int revNo) {
		this.revNo = revNo;
		return this;
	}
	public String getEmail() {
		return email;
	}
	public ReviewDto setEmail(String email) {
		this.email = email;
		return this;
	}
	public int getExhID() {
		return exhID;
	}
	public ReviewDto setExhID(int exhID) {
		this.exhID = exhID;
		return this;
	}
	public String getRevContent() {
		return revContent;
	}
	public ReviewDto setRevContent(String revContent) {
		this.revContent = revContent;
		return this;
	}
	public Timestamp getRevDate() {
		return revDate;
	}
	public ReviewDto setRevDate(Timestamp revDate) {
		this.revDate = revDate;
		return this;
	}
	
	
}
