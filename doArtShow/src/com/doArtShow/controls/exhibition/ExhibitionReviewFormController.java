package com.doArtShow.controls.exhibition;

import java.util.Map;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ReviewDao;
import com.doArtShow.dao.VisitListDao;
import com.doArtShow.dto.ReviewDto;
import com.doArtShow.dto.VisitListDto;

public class ExhibitionReviewFormController implements Controller{
	ReviewDao reviewDao;
	VisitListDao visitDao;
	
	public ExhibitionReviewFormController setReviewDao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
		System.out.println("##3번 ExhibitionReviewFormController(페이지컨트롤러)실행");
		
		ReviewDto rev = (ReviewDto)model.get("rev");
		reviewDao.insertReview(rev);
		
		return "/client/exhibition/ExContentView.jsp";
	}
	
}
