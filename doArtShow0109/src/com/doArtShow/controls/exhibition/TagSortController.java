package com.doArtShow.controls.exhibition;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
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
		String res = "";
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObj = (JSONObject)model.get("jsonObj");
		
		if(model.get("ctgBtn") != null && model.get("ctgName") != null) {
			System.out.println("##3번 TagSortController(페이지컨트롤러)실행");
		
			String ctgBtn = (String)model.get("ctgBtn");
			System.out.println("ctgGubun : " + ctgBtn);
			String ctgName =(String)model.get("ctgName");
			System.out.println("ctgName : " + ctgName);
		
			List<ExhListDto> lists = exhibitionDao.selectTagList(ctgBtn, ctgName);

			ArrayList<Map> list = new ArrayList<Map>();
			
			if(lists.size() > 0) {
				for(int i=0;i<lists.size();i++) {
					jsonObj.put("exhID", lists.get(i).getExhID());
					jsonObj.put("imageFile1", lists.get(i).getImageFile1());
					jsonObj.put("exhName", lists.get(i).getExhName());
					jsonObj.put("exhPlace", lists.get(i).getExhPlace());
					jsonObj.put("exhStartDate", lists.get(i).getExhStartDate());
					jsonObj.put("exhEndDate", lists.get(i).getExhEndDate());
					
					list.add(jsonObj);
				}
			}
			
			int listCnt = lists.size(); //태그로 찾을 경우의 전시갯수
			System.out.println(listCnt);
			JSONObject json = new JSONObject();
			json.put("listCnt", listCnt);
			list.add(json);
			
			jsonArray.add(list);
			result = jsonArray.toJSONString();
			int idx = result.indexOf("]");
			res = result.substring(1,idx+1);
		}
		
		return "json:" + res;
	}
	
}