package com.doArtShow.controls.exhibition;

import java.io.PrintWriter;
import java.util.Map;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.ExhibitionDao;

public class ExhibitionDeleteController implements Controller {
	ExhibitionDao exhibitionDao;

	// 전시회 수정을 위한 컨트롤러이므로 ExhibitionDao를 받습니다.
	// 예를들어 전시 등록을 위한 컨트롤러 라면 Exhibition을 받는 식으로 수정해주세요!
	public ExhibitionDeleteController setExhibitionDao(ExhibitionDao exhibitionDao) {
		this.exhibitionDao = exhibitionDao;
		return this;
	}

	@Override
	public String execute(Map<String, Object> model) throws Exception {
		PrintWriter out = (PrintWriter) model.get("out");
		int exhID = Integer.parseInt(String.valueOf(model.get("exhID")));
		//out.println("<html><body>");
		//out.println("<script>");
		//out.println("if(confirm('증말로 진짜루 삭제하시렵니까?')){");
		int rsCnt = exhibitionDao.deleteExhibition(exhID);
		//out.println("}else{");	
		//	out.println("alert('삭제를 취소하셨습니다.');");
		//	out.println("self.location.href='/client/exhibition/myList.do");
		//out.println("</script>");
		System.out.println("DispatcherServlet_delete.do_rsCnt: " + rsCnt);
		// return "redirect:list.do";
		/*
		 * if (rsCnt == 1) {
		 
			 out.println("<html><body>");
			 out.println("<script>alert('전시회 삭제가 완료되었습니다.');</script>");
			 out.println("</body></html>");
			 System.out.println("DispatcherServlet_delete.do_sql update succeded!");
		} else {
			 out.println("<html><body>");
			 out.println("<script>alert('전시회 삭제에 실패했습니다. 잠시 후 다시 시도하거나 관리자에게 문의하세요.');</script>");
			 out.println("</body></html>");
			 System.out.println("DispatcherServlet_delete.do_sql update failed!");
		}*/	
		//return "../../index.jsp";
		
		return "redirect:myList.do?dRsCnt"+rsCnt;
	}

}
