package com.doArtShow.listener;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

import com.doArtShow.controls.exhibition.ExhibitionAddController;
import com.doArtShow.controls.exhibition.ExhibitionAddFormController;
import com.doArtShow.controls.exhibition.ExhibitionMyListController;
import com.doArtShow.controls.exhibition.ExhibitionUpdateController;
import com.doArtShow.controls.member.MemberAddController;
import com.doArtShow.controls.member.MemberLoginController;
import com.doArtShow.dao.ExhibitionDao;
import com.doArtShow.dao.ManagerDao;
import com.doArtShow.dao.MemberDao;
import com.doArtShow.dao.ReviewDao;
import com.doArtShow.dao.VisitListDao;
import com.doArtShow.dao.WishListDao;

// datasource 주입, 컨트롤러 객체에 dao주입
@WebListener
public class ContextLoaderListener implements ServletContextListener{
	@Override
	public void contextInitialized(ServletContextEvent event) {
	    try {
	    	ServletContext sc = event.getServletContext();
			InitialContext initialContext = new InitialContext();
			DataSource ds = (DataSource)initialContext.lookup("java:comp/env/jdbc/artshowdb");
			
			// 각 dao마다 datasource를 주입합니다.
			ExhibitionDao exhibitionDao = new ExhibitionDao();
			exhibitionDao.setDataSource(ds);
			
			ManagerDao managerDao = new ManagerDao();
			managerDao.setDataSource(ds);
			
			MemberDao memberDao = new MemberDao();
			memberDao.setDataSource(ds);
			
			ReviewDao reviewDao = new ReviewDao();
			reviewDao.setDataSource(ds);
			
			VisitListDao visitListDao = new VisitListDao();
			visitListDao.setDataSource(ds);
			
			WishListDao wishListDao = new WishListDao();
			wishListDao.setDataSource(ds);
			
			//--------------------------------------------------------------------------------------
			//각자 추가하는 Controller에 따라서 수정될 수 있습니다.
			//회원 가입(추가)
			sc.setAttribute("/auth/memberSignUp.do", new MemberAddController().setMemberDao(memberDao) );
			
			//회원 로그인
			sc.setAttribute("/auth/memberLogIn.do", new MemberLoginController().setMemberDao(memberDao));
			
			//-------------------------------------------------------------------------------------------------------------
			//			programmed by Hojeong - begin
			//-------------------------------------------------------------------------------------------------------------			
			//전시회 등록폼
			sc.setAttribute("/exhibition/addForm.do", new ExhibitionAddFormController().setExhibitionDao(exhibitionDao));
			
			//전시회 등록
			sc.setAttribute("/exhibition/add.do", new ExhibitionAddController().setExhibitionDao(exhibitionDao));
			
			//전시회 수정
			sc.setAttribute("/exhibition/update.do", new ExhibitionUpdateController().setExhibitionDao(exhibitionDao));
			
			//마이 전시회 리스트 
			sc.setAttribute("/exhibition/myList.do", new ExhibitionMyListController().setExhibitionDao(exhibitionDao));
			//-------------------------------------------------------------------------------------------------------------
			//			programmed by Hojeong - end
			//-------------------------------------------------------------------------------------------------------------			
			
			//--------------------------------------------------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {}
}
