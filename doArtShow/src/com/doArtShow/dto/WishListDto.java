package com.doArtShow.dto;

// 가고 싶은 전시 정보
public class WishListDto {
	private String id;
	private int ExhID;
	private int wishArt;
	
	public WishListDto() {}

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

	public int getWishArt() {
		return wishArt;
	}

	public void setWishArt(int wishArt) {
		this.wishArt = wishArt;
	}
	
}
