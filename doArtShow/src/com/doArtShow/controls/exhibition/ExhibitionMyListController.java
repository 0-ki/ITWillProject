package com.doArtShow.controls.exhibition;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ExhibitionDao;
import com.doArtShow.dto.ExhibitionDto;

public class ExhibitionMyListController implements Controller {
	ExhibitionDao exhibitionDao;

	// 전시회 등록을 위한 컨트롤러이므로 ExhibitionDao를 받습니다.
	// 예를들어 전시 등록을 위한 컨트롤러 라면 Exhibition을 받는 식으로 수정해주세요!
	public ExhibitionMyListController setExhibitionDao(ExhibitionDao exhibitionDao) {
		this.exhibitionDao = exhibitionDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		//내가 등록한 전시회 리스트를 요청할 때,
		String id = (String) model.get("id");
		System.out.println("controller id:" + id);
		List<ExhibitionDto> exhibitionList = exhibitionDao.selectExhibitionMyList("id01");
		model.put("exhibitionList", exhibitionList);

		return "/exhibition/myList.jsp";
	}
}