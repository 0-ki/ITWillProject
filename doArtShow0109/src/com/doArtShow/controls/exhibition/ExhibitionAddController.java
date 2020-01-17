package com.doArtShow.controls.exhibition;

import java.io.PrintWriter;
import java.util.Map; 

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ExhibitionDao;
import com.doArtShow.dto.ExhibitionDto;


// 전시회 등록 컨트롤러
public class ExhibitionAddController implements Controller{
	ExhibitionDao exhibitionDao;
	
	//전시회 등록을 위한 컨트롤러이므로 ExhibitionDao를 받습니다. 
	//예를들어 전시 등록을 위한 컨트롤러 라면 Exhibition을 받는 식으로 수정해주세요!
	public ExhibitionAddController setExhibitionDao(ExhibitionDao exhibitionDao){
		this.exhibitionDao = exhibitionDao;
		return this;
	}
	
	@Override
	public String execute(Map<String, Object> model) throws Exception {
  		PrintWriter out = (PrintWriter) model.get("out");
		// get과 post방식을 모두 처리하기 때문에 request를 담은 model에 정보가 들어있는지에 따라서 처리 방식이 달라집니다.
		
		// 전시회 등록을 요청할때
		//if (model.get("exhibition") == null) {
			
			//return "/exhibition/registerForm.jsp";
		
		// 
		//} else { 

		ExhibitionDto exhibition = (ExhibitionDto)model.get("exhibition");
		int rsCnt = exhibitionDao.insertExhibition(exhibition);
		System.out.println("DispatcherServlet_add.do_rsCnt: " + rsCnt);
		if (rsCnt == 1) {
			 out.println("<html><body>");
			 out.println("<script>alert('전시회 등록이 완료되었습니다.');</script>");
			 out.println("</body></html>");
			 System.out.println("DispatcherServlet_add.do_sql insert succeded!");
		} else {
			 out.println("<html><body>");
			 out.println("<script>alert('전시회 등록에 실패했습니다. 잠시후 다시 시도하거나 관리자에게 문의하세요.');</script>");
			 out.println("</body></html>");
			 System.out.println("DispatcherServlet_add.do_sql insert failed!");
		}	
		return "../../index.jsp";	 
		//}
	}
}
