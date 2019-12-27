package com.doArtShow.dto;

import java.sql.Timestamp;

// 리뷰 정보
public class ReviewDto {
	private int revNo;
	private String id;
	private int ExhID;
	private String revContent;
	private Timestamp revDate;
	
	public ReviewDto() {}

	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getExhID() {
		return ExhID;
	}

	public void setExhID(int exhID) {
		ExhID = exhID;
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
	
}
