package com.doArtShow.controls.exhibition;

import java.util.Map;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ExhibitionDao;
import com.doArtShow.dto.ExhibitionDto;


// 회원 가입 컨트롤러
public class ExhibitionAddController implements Controller{
	ExhibitionDao exhibitionDao;
	
	//회원 가입을 위한 컨트롤러이므로 MemberDao를 받습니다. 
	//예를들어 전시 등록을 위한 컨트롤러 라면 Exhibition을 받는 식으로 수정해주세요!
	public ExhibitionAddController setExhibitionDao(ExhibitionDao exhibitionDao){
		this.exhibitionDao = exhibitionDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		// get과 post방식을 모두 처리하기 때문에 request를 담은 model에 정보가 들어있는지에 따라서 처리 방식이 달라집니다.
		
		// 전시회 등록폼을 요청할때
		if (model.get("exhibition") == null) {
			
			return "/exhibition/ExhRegisterForm.jsp";
		
		// 
		} else { 
			System.out.println("*****");
			ExhibitionDto exhibition = (ExhibitionDto)model.get("exhibition");
			exhibitionDao.insertExhibition(exhibition);
		    
			//return "redirect:index.do";		 
			return "../index.jsp";	 
		}
	}
}
