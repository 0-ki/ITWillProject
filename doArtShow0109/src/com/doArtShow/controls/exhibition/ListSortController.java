package com.doArtShow.controls.exhibition;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ExhibitionDao;
import com.doArtShow.dto.ExhListDto;

public class ListSortController implements Controller{
	ExhibitionDao exhibitionDao;
	
	public ListSortController setExhibitionDao(ExhibitionDao exhibitionDao){
		this.exhibitionDao = exhibitionDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String result = "";
		JSONObject jsonObj = (JSONObject)model.get("jsonObj");

		if(model.get("sortBtn") != null){
			System.out.println("##3번 TagSortController(페이지컨트롤러)실행");
			
			String sortBtn = (String)model.get("sortBtn");
			System.out.println("sortBtn : " + sortBtn);
			
			String list = "";
			List<ExhListDto> lists = exhibitionDao.selectSortList(sortBtn); //sortBtn값에 따라 dao에서 다른 쿼리문 실행하여 리스트 리턴받아옴
			if(lists != null) {
				System.out.println("갯수 있음");
				for(int i=0;i<lists.size();i++) {
					System.out.println(lists.get(i));
					list += lists.get(i).toString()+" ";
					jsonObj.put("lists", list);
				}
			}
			int listCnt = exhibitionDao.getSortListCount(sortBtn); //태그로 찾을 경우의 전시갯수
			jsonObj.put("listCnt", listCnt);
			
			result = jsonObj.toJSONString();
		}
		
		return "json:" + result;
	}
	
	
}
