package com.doArtShow.dto;

// 회원 정보
public class MemberDto {
	private String id;
	private String email;
	private String name;
	private String pw;
	private String img;

	public String getId() {
		return id;
	}

	public MemberDto setId(String id) {
		this.id = id;
		return this;
	}

	public String getEmail() {
		return email;
	}

	public MemberDto setEmail(String email) {
		this.email = email;
		return this;
	}

	public String getName() {
		return name;
	}

	public MemberDto setName(String name) {
		this.name = name;
		return this;
	}

	public String getPw() {
		return pw;
	}

	public MemberDto setPw(String pw) {
		this.pw = pw;
		return this;
	}

	public String getImg() {
		return img;
	}

	public MemberDto setImg(String img) {
		this.img = img;
		return this;
	}
	
	
}
