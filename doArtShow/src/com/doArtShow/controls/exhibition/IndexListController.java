package com.doArtShow.controls.exhibition;

import java.util.ArrayList;
import java.util.Map;

import org.json.simple.JSONObject;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ExhibitionDao;
import com.doArtShow.dto.ExhibitionDto;

public class IndexListController implements Controller {
	ExhibitionDao exhibitionDao;
	
	//MemberDao를 주입받기 위한 인스턴수 변수와 셋터 메서드를 추가
	public IndexListController setExhibitionDao(ExhibitionDao exhibitionDao){
		this.exhibitionDao = exhibitionDao;
		return this;
	}
	//이렇게 써줌으로써 외부에서 MemberDao객체를 주입해줄것이기 때문에 밑에 execute()에서 Map객체에서 MemberDao를 꺼낼 필요가 없다
	
	@Override
	public String execute(Map<String, Object> model) throws Exception{
		String res = null;
		
		JSONObject jsonObj = (JSONObject)model.get("jsonObj");	
		ArrayList<ExhibitionDto> indexLists = exhibitionDao.indexExhibition();
		
		/*for(int i=0; i<indexLists.size(); i++){
			ExhibitionDto dto = indexLists.get(i);
		}*/
		
		jsonObj.put("indexLists", indexLists);
		jsonObj.put("isGood", "GOOD");
		/*res = jsonObj.toJSONString();*/
		
		model.put("jsonObj", jsonObj);
		/*model.put("isGood", "GOOD");*/
		
		return "json:";
	}
	
}





