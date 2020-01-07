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
		//로그인 화면을 요청할 때
		if(model.get("loginInfo") == null){
			return "/auth/memberLogInForm.jsp";
			
		} else {
			MemberDto loginInfo = (MemberDto)model.get("loginInfo");
			
			MemberDto member = memberDao.checkMember(
					loginInfo.getEmail(), loginInfo.getPw());
			
			//로그인 정보에 맞는 회원이 db에 있다면 세션을 생성하고
			if (member != null) {
		        HttpSession session = (HttpSession)model.get("session");
		        session.setAttribute("member", member);
		        return "redirect:../auth/memberDetail.do";
		        
		     } else {
		    	 
		        return "/auth/memberLogInFail.jsp";
		     }
		}
	}
}
