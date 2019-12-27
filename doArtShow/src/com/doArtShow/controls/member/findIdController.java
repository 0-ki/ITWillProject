package com.doArtShow.controls.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.MemberDao;
import com.doArtShow.dto.MemberDto;

public class findIdController implements Controller{
	MemberDao memberDao;
	
	public findIdController setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		if(model.get("findIdInfo") != null) {
			MemberDto member = (MemberDto)model.get("findIdInfo");
			String id = memberDao.findId(member.getEmail(), member.getName());
			
			HttpSession session = (HttpSession)model.get("session");
	        session.setAttribute("id", id);
	        
			return "/client/auth/findIdResult.jsp";
			
		} else {
			return "/client/auth/findIdForm.jsp";
		}
	}
}
