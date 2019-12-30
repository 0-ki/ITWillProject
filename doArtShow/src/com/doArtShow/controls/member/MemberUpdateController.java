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
		if(model.get("birth")!=null) {
			memberDao.updateBirth((String)model.get("birth"), (String)model.get("email"));
			
			MemberDto member = memberDao.selectInfo((String)model.get("email"));
			HttpSession session = (HttpSession)model.get("session");
			session.removeAttribute("member");
			
			session.setAttribute("member",member);
			
			return "redirect:memberDetail.do";
		}
		if(model.get("gender")!=null) {
			memberDao.updateGender((String)model.get("gender"), (String)model.get("email"));
			
			MemberDto member = memberDao.selectInfo((String)model.get("email"));
			HttpSession session = (HttpSession)model.get("session");
			session.removeAttribute("member");
			
			session.setAttribute("member",member);
			
			return "redirect:memberDetail.do";
		}
		if(model.get("pw")!=null) {
			memberDao.updatePw((String)model.get("pw"), (String)model.get("email"));
			
			MemberDto member = memberDao.selectInfo((String)model.get("email"));
			HttpSession session = (HttpSession)model.get("session");
			session.removeAttribute("member");
			session.setAttribute("member",member);
			
			return "redirect:memberDetail.do";
		}
		return "redirect:memberLogIn.do";
	}
	
}
