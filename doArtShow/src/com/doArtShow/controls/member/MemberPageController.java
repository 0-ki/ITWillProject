package com.doArtShow.controls.member;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ExhibitionDao;
import com.doArtShow.dao.MemberDao;
import com.doArtShow.dao.ReviewDao;
import com.doArtShow.dao.VisitListDao;
import com.doArtShow.dao.WishListDao;
import com.doArtShow.dto.ExhibitionDto;
import com.doArtShow.dto.MemberDto;
import com.doArtShow.dto.ReviewDto;

public class MemberPageController implements Controller{
	MemberDao					memberDao;
	ExhibitionDto 				exhInfoForRev;
	ArrayList<ExhibitionDto> 	exhInfoForRevList;
	
	public MemberPageController setMemberDao(MemberDao memberDao){
		this.memberDao = memberDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		HttpSession session = (HttpSession)model.get("session");
		
		if(session.getAttribute("member") != null) {
			MemberDto member = (MemberDto)session.getAttribute("member");
			
			String email = member.getEmail();
			
			//가고싶은 전시회 목록
			ArrayList<ExhibitionDto> wishList = memberDao.selectWishList(email);
			if(wishList != null) {
				model.put("wishList", wishList);
			}
			
			//가고싶은 전시 개수
			int wishCount = memberDao.countWishExh(email);
			if(wishCount != 0) {
				model.put("wishCount", wishCount);
			}
						
			//갔다온 전시회 목록
			ArrayList<ExhibitionDto> visitList = memberDao.selectVisitList(email);
			if(visitList != null) {
				model.put("visitList", visitList);
			}
			
			//갔다온 전시 개수
			int visitCount = memberDao.countVisitExh(email);
			if(visitCount != 0) {
				model.put("visitCount", visitCount);
			}
			
			//전시회 리뷰 목록
			ArrayList<ReviewDto> reviewList = memberDao.selectReviewList(email);
			if(reviewList != null) {
				model.put("reviewList", reviewList);
				for(ReviewDto review : reviewList) {
					int exhID = review.getExhID();
					exhInfoForRev = memberDao.selectInfoForRev(exhID);
					exhInfoForRevList.add(exhInfoForRev);
				}
				model.put("exhInfoForRevList", exhInfoForRevList);
			}
			
			//리뷰개수
			
			//등록한 전시
			
			//등록한 전시 개수
		}
		
		return "/client/auth/memberPage.jsp";
	}

}
