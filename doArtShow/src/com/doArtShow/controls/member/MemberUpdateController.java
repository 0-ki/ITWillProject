package com.doArtShow.controls.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.MemberDao;
import com.doArtShow.dto.MemberDto;

public class MemberUpdateController implements Controller{
	MemberDao memberDao;
	
	public MemberUpdateController setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
		return this;
	}
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		if(model.get("member")!=null) {
			MemberDto member = (MemberDto)model.get("member");
			memberDao.updateBirth(member.getBirth(), 
					member.getGender(),
					member.getPw(),
					member.getProfileImg(),
					(String)model.get("email"));
			
			member = memberDao.selectInfo((String)model.get("email"));
			HttpSession session = (HttpSession)model.get("session");
			session.removeAttribute("member");
			
			session.setAttribute("member",member);
			
			return "redirect:memberDetail.do";
		}
		return "redirect:memberLogIn.do";
	}
	
}
