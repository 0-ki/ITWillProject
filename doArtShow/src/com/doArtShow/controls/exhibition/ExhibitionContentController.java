package com.doArtShow.controls.exhibition;

import java.util.Map;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ExhibitionDao;

public class ExhibitionContentController implements Controller{
	ExhibitionDao exhibitionDao;
	
	public ExhibitionContentController setExhibitionDao(ExhibitionDao exhibitionDao) {
		this.exhibitionDao = exhibitionDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		System.out.println("##3번 ExhibitionContentController(페이지컨트롤러)실행");
		Integer exhID = (Integer)model.get("exhID");
		
		exhibitionDao.updateReadCount(exhID); //조회수 1 증가
		model.put("listOne", exhibitionDao.selectOne(exhID)); // 상세페이지에 뿌릴 데이터를 가져옴
		
		System.out.println("##5번 다시 ExhibitionContentController로 돌아와서 DispatcherRedirect로  url리턴");
		return "/clientView/exhibition/ExContentView.jsp";
	}

}
