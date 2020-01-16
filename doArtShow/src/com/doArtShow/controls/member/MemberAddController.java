package com.doArtShow.controls.member;

import java.util.Map;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.MemberDao;
import com.doArtShow.dto.MemberDto;

// 회원 가입 컨트롤러
public class MemberAddController implements Controller{
	MemberDao memberDao;
	
	public MemberAddController setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		
		// 회원가입 입력폼을 요청할 때
		if (model.get("member") == null) {
			
			return "/client/auth/memberSignUp.jsp";
		
		// 회원 가입 후 등록을 요청할 때(로그인 페이지를 보여준다.)
		}else { 
			MemberDto member = (MemberDto)model.get("member");
			memberDao.insertMember(member);
		    
			return "/client/auth/memberWelcome.jsp";		 
		}
	}
}
