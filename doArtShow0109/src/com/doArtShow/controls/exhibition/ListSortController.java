package com.doArtShow.controls.exhibition;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
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
		System.out.println("##3번 TagSortController(페이지컨트롤러)실행");
		
		String result = "";
		String res = "";
		JSONArray jsonArray = new JSONArray();
		
		int inputSort = (int)model.get("inputSort");
		int inputTag = (int)model.get("inputTag");
		int inputLoc = (int)model.get("inputLoc");
		int inputGen = (int)model.get("inputGen");
		int inputPage = (int)model.get("inputPage");
		
		/*확인*/
		System.out.println("inputSort : " + inputSort);
		System.out.println("inputTag : " + inputTag);
		System.out.println("inputLoc : " + inputLoc);
		System.out.println("inputGen : " + inputGen);
		System.out.println("inputPage : " + inputPage);
		
		
		/*String sortBtn = null;
		String ctgBtn = null;
		String ctgName = null;

		if(model.get("sortBtn") != null){
			sortBtn = (String)model.get("sortBtn");
		}
		if(model.get("ctgBtn") != null && model.get("ctgName") != null){
			ctgBtn = (String)model.get("ctgBtn");
			ctgName =(String)model.get("ctgName");
			ctgBtn = ctgBtn.substring(0, 6);
		}
		
		System.out.println("sortBtn : " + sortBtn);
		System.out.println("ctgBtn : " + ctgBtn);
		System.out.println("ctgName : " + ctgName);
		
		
		if(sortBtn != null && ctgBtn != null){ //둘다 누른 경우
			lists = exhibitionDao.selectSortList1(sortBtn, ctgBtn, ctgName); //sortBtn값에 따라 dao에서 다른 쿼리문 실행하여 리스트 리턴받아옴
		}else if(sortBtn == null && ctgBtn != null){ //카테고리만 누른 경우
			lists = exhibitionDao.selectSortList2(ctgBtn, ctgName);
		}else if(sortBtn != null && ctgBtn == null){ //정렬만 누른 경우
			lists = exhibitionDao.selectSortList3(sortBtn);
		}
		//그 전에 눌렀던 애를 어떻게 계속 유지시키지..?
*/		
		
		List<ExhListDto> lists = null;
		lists = exhibitionDao.selectSortList(inputSort, inputTag, inputLoc, inputGen, inputPage);
		
		
		ArrayList<Map> list = new ArrayList<Map>();
		JSONObject jsonObj = null;
			
		if(lists.size() > 0) {
			for(int i=0;i<lists.size();i++) {
				jsonObj = new JSONObject();
				jsonObj.put("exhID", lists.get(i).getExhID());
				jsonObj.put("imageFile1", lists.get(i).getImageFile1());
				jsonObj.put("exhName", lists.get(i).getExhName());
				jsonObj.put("exhPlace", lists.get(i).getExhPlace());
				jsonObj.put("exhStartDate", lists.get(i).getExhStartDate());
				jsonObj.put("exhEndDate", lists.get(i).getExhEndDate());
					
				list.add(jsonObj);
			}
		}
			
		int listCnt = lists.size(); //정렬로 찾을 경우의 전시갯수
		System.out.println(listCnt);
		jsonObj = new JSONObject();
		jsonObj.put("listCnt", listCnt);
		list.add(jsonObj);
			
		jsonArray.add(list);
		result = jsonArray.toJSONString();
		int idx = result.indexOf("]");
		res = result.substring(1,idx+1);
				
		return "json:" + res;
	}
	
	
}
