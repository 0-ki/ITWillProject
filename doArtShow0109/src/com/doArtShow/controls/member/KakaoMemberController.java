package com.doArtShow.controls.member;

import java.io.PrintWriter;
import java.util.Map;
import org.json.simple.JSONObject;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ExhibitionDao;
import com.doArtShow.dao.MemberDao;
import com.doArtShow.dto.ExhibitionDto;


// 전시회 등록 컨트롤러
public class KakaoMemberController implements Controller{
	MemberDao memberDao;
	
	public KakaoMemberController setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
  		String result= null;
		
		JSONObject jsonObj = (JSONObject)model.get("jsonObj");
		ExhibitionDto exhibition = (ExhibitionDto)model.get("exhibition");
		/*int rsCnt = memberDao.insertExhibition(exhibition);
		System.out.println("DispatcherServlet_add.do_rsCnt: " + rsCnt);
        jsonObj.put("res",rsCnt);
        result = jsonObj.toJSONString();*/
		
		return "json:"+result;
		
	}
}
