package com.doArtShow.controls.member;

import java.util.Map;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.MemberDao;
import com.doArtShow.dto.MemberDto;

// 회원 가입 컨트롤러
public class MemberAddController implements Controller{
	MemberDao memberDao;
	
	//회원 가입을 위한 컨트롤러이므로 MemberDao를 받습니다. 
	//예를들어 전시 등록을 위한 컨트롤러 라면 Exhibition을 받는 식으로 수정해주세요!
	public MemberAddController setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		// get과 post방식을 모두 처리하기 때문에 request를 담은 model에 정보가 들어있는지에 따라서 처리 방식이 달라집니다.
		
		// 회원가입 입력폼을 요청할 때
		if (model.get("member") == null) {
			
			return "/auth/memberSignUp.jsp";
		
		// 회원 가입 후 등록을 요청할 때(로그인 페이지를 보여준다.)
		}else { 
			MemberDto member = (MemberDto)model.get("member");
			memberDao.insertMember(member);
		    
			return "redirect:memberLogIn.do";		 
		}
	}
}
