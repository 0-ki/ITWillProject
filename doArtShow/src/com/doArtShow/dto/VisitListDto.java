package com.doArtShow.dto;

// 갔다온 전시 정보
public class VisitListDto {
	private String 	email;
	private int 	exhID;
	private int 	revCheck;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getExhID() {
		return exhID;
	}
	public void setExhID(int exhID) {
		this.exhID = exhID;
	}
	public int getRevCheck() {
		return revCheck;
	}
	public void setRevCheck(int revCheck) {
		this.revCheck = revCheck;
	}
	
}
