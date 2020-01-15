package com.doArtShow.dto;

// 갔다온 전시 정보
public class VisitListDto {
	private String 	email;
	private int 	exhID;
	private int 	revCheck;
	
	public String getEmail() {
		return email;
	}
	public VisitListDto setEmail(String email) {
		this.email = email;
		return this;
	}
	public int getExhID() {
		return exhID;
	}
	public VisitListDto setExhID(int exhID) {
		this.exhID = exhID;
		return this;
	}
	public int getRevCheck() {
		return revCheck;
	}
	public VisitListDto setRevCheck(int revCheck) {
		this.revCheck = revCheck;
		return this;
	}
	
}
