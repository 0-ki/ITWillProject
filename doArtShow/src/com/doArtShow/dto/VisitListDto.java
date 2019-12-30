package com.doArtShow.dto;

// 갔다온 전시 정보
public class VisitListDto {
	private String id;
	private int ExhID;
	private int revCheck;
	
	public VisitListDto() {}

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

	public int getRevCheck() {
		return revCheck;
	}

	public void setRevCheck(int revCheck) {
		this.revCheck = revCheck;
	}
	
}
