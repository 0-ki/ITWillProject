package com.doArtShow.controls.member;

import java.util.Map;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.MemberDao;
import com.doArtShow.dto.MemberDto;

//탈퇴하기 페이지 컨트롤러
public class MemberDeleteController implements Controller{
	MemberDao memberDao;
	
	public MemberDeleteController setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		if((MemberDto)model.get("memberDelInfo")!=null) {
			MemberDto memberDelInfo = (MemberDto)model.get("memberDelInfo");
			
			memberDao.deleteMember(memberDelInfo.getEmail());
			
			return "/index.jsp";
		} else {
			return "/client/auth/memberDelete.jsp";
		}
	}
}
