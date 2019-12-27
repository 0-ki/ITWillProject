package com.doArtShow.controls.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.MemberDao;
import com.doArtShow.dto.MemberDto;

public class findPwController implements Controller{
	MemberDao memberDao;
	
	public findPwController setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		if(model.get("findPwInfo") != null) {
			MemberDto member = (MemberDto)model.get("findPwInfo");
			String pw = memberDao.findPw(member.getEmail(), member.getBirth());
			
			HttpSession session = (HttpSession)model.get("session");
	        session.setAttribute("pw", pw);
	        
			return "/client/auth/findPwResult.jsp";
			
		} else {
			return "/client/auth/findPwForm.jsp";
		}
	}
	

}
