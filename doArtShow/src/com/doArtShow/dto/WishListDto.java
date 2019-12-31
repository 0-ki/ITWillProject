package com.doArtShow.dto;

// 가고 싶은 전시 정보
public class WishListDto {
	private String 	email;
	private int 	exhID;
	private int 	wishArt;
	
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
	public int getWishArt() {
		return wishArt;
	}
	public void setWishArt(int wishArt) {
		this.wishArt = wishArt;
	}
	
}
