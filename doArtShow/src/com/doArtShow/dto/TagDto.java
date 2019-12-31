package com.doArtShow.dto;

public class TagDto {
	private int		exhID;
	private String	exhTagName;
	
	public int getExhID() {
		return exhID;
	}
	public void setExhID(int exhID) {
		this.exhID = exhID;
	}
	public String getExhTagName() {
		return exhTagName;
	}
	public void setExhTagName(String exhTagName) {
		this.exhTagName = exhTagName;
	}
	@Override
	public String toString() {
		return "TagInfo [exhID=" + exhID + ", exhTagName=" + exhTagName + "]";
	}
	
	
}
