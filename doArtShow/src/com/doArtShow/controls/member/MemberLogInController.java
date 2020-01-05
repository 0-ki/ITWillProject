package com.doArtShow.controls.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.MemberDao;
import com.doArtShow.dto.MemberDto;

// 회원 로그인 컨트롤러
public class MemberLogInController implements Controller{
	MemberDao memberDao;
	
	public MemberLogInController setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		//로그인 요청
		if(model.get("loginInfo") != null){
			MemberDto loginInfo = (MemberDto)model.get("loginInfo");
			
			//로그인 정보 확인
			MemberDto member = memberDao.checkMember(
					loginInfo.getEmail(), loginInfo.getPw());
			
			if (member != null) {
				// 로그인 정보 있음. 세션 생성 
		        HttpSession session = (HttpSession)model.get("session");
		        session.setAttribute("member", member);
		        return "redirect:memberDetail.do";
		        
		     } else {
		    	 // 로그인 정보 없음(로그인 실패)
		        return "redirect:memberLogInFail.do";
		     }
		//로그인 폼 요청
		} else {
			return "/clientView/auth/memberLogInForm.jsp";

		}
	}
}
