package com.doArtShow.controls.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.MemberDao;
import com.doArtShow.dto.MemberDto;

public class MemProfileUpdateController implements Controller{
	MemberDao memberDao;
	HttpSession session;
	
	public MemProfileUpdateController setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
		return this;
	}
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String profileImg = (String)model.get("profileImg");
		
		session = (HttpSession)model.get("session");
		MemberDto member = (MemberDto)session.getAttribute("member");			
		String email = member.getEmail();
		
		memberDao.updateProfileImg(profileImg, email);
		
		return "/client/auth/profileImgUpdateRes.jsp";

	}
}
