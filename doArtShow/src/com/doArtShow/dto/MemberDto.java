package com.doArtShow.dto;

// 회원 정보
public class MemberDto {
	private String 	email;
	private String 	name;
	private String 	birth;
	private String 	gender;
	private String 	pw;
	private String 	profileImg;

	
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

	public String getBirth() {
		return birth;
	}

	public MemberDto setBirth(String birth) {
		this.birth = birth;
		return this;
	}

	public String getGender() {
		return gender;
	}
	
	public MemberDto setGender(String gender) {
		this.gender = gender;
		return this;
	}

	public String getPw() {
		return pw;
	}

	public MemberDto setPw(String pw) {
		this.pw = pw;
		return this;
	}
	
	public String getProfileImg() {
		return profileImg;
	}
	
	public MemberDto setProfileImg(String profileImg) {
		this.profileImg = profileImg;
		return this;
	}
}
