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
		if(model.get("name")!=null) {
			memberDao.updateName((String)model.get("name"), (String)model.get("id"));
			MemberDto member = memberDao.selectInfo((String)model.get("id"));
			HttpSession session = (HttpSession)model.get("session");
			session.removeAttribute("member");
			session.setAttribute("member",member);
//			
			return "redirect:memberDetail.do";
		}
		if(model.get("email")!=null) {
			memberDao.updateEmail((String)model.get("email"), (String)model.get("id"));
			MemberDto member = memberDao.selectInfo((String)model.get("id"));
			HttpSession session = (HttpSession)model.get("session");
			session.removeAttribute("member");
			session.setAttribute("member",member);
			
			return "redirect:memberDetail.do";
		}
		return "redirect:memberLogIn.do";
	}
	
}
