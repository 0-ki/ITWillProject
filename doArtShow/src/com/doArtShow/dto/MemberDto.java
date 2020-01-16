package com.doArtShow.dto;

// 회원 정보
public class MemberDto {
	private String 	email;			//이메일
	private String 	name;			//이름
	private String 	birth;			//생년월일
	private String 	gender;			//성별
	private String 	pw;				//비밀번호
	private String 	profileImg;		//프로필 사진

	
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

	@Override
	public String toString() {
		return "MemberDto [email=" + email + ", name=" + name + ", birth=" + birth + ", gender=" + gender + ", pw=" + pw
				+ ", profileImg=" + profileImg + "]";
	}
	
	
}
