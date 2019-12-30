package com.doArtShow.listener;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

import com.doArtShow.controls.member.ExhibitionContentController;
import com.doArtShow.controls.member.ExhibitionListController;
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
			sc.setAttribute("/client/auth/memberSignUp.do", new MemberAddController().setMemberDao(memberDao));
			
			//회원 로그인
			sc.setAttribute("/client/auth/memberLogIn.do", new MemberLoginController().setMemberDao(memberDao));
			
			//전시 목록 
			sc.setAttribute("/client/ExListView.do", new ExhibitionListController().setExhibitionDao(exhibitionDao));

			//전시글 상세내용 보기 
			sc.setAttribute("/client/ExContentView.do", new ExhibitionContentController().setExhibitionDao(exhibitionDao));
			
			//--------------------------------------------------------------------------------------
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {}
}
