package com.doArtShow.controls.exhibition;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ExhibitionDao;
import com.doArtShow.dto.ExhListDto;

public class TagSortController implements Controller{
	ExhibitionDao exhibitionDao;
	
	public TagSortController setExhibitionDao(ExhibitionDao exhibitionDao){
		this.exhibitionDao = exhibitionDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		String result = "";
		JSONObject jsonObj = (JSONObject)model.get("jsonObj");
		
		if(model.get("ctgBtn") != null && model.get("ctgName") != null) {
			System.out.println("##3번 TagSortController(페이지컨트롤러)실행");
		
			String ctgBtn = (String)model.get("ctgBtn");
			System.out.println("ctgGubun : " + ctgBtn);
			String ctgName =(String)model.get("ctgName");
			System.out.println("ctgName : " + ctgName);
		
			String list = "";
			List<ExhListDto> lists = exhibitionDao.selectTagList(ctgBtn, ctgName);
			if(lists != null) {
				for(int i=0;i<lists.size();i++) {
					System.out.println(lists.get(i));
					list += lists.get(i).toString()+" ";
					jsonObj.put("lists", list);
				}
			}
			
			int listCnt = exhibitionDao.getTagListCount(ctgBtn, ctgName); //태그로 찾을 경우의 전시갯수
			jsonObj.put("listCnt", listCnt);
			
			result = jsonObj.toJSONString();
		}
		
		return "json:" + result;
	}
	
}