package com.doArtShow.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doArtShow.controls.Controller;
import com.doArtShow.dto.MemberDto;

public class DistpatcherServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//service메소드는 doPost와 doGet을 모두 처리합니다.
		 	response.setContentType("text/html; charset=UTF-8");
		    String servletPath = request.getServletPath();
		    
		    try {
		      ServletContext sc = this.getServletContext();
		      
		      HashMap<String,Object> model = new HashMap<String,Object>();
		      model.put("session", request.getSession());
		      
		      Controller pageController = (Controller) sc.getAttribute(servletPath);
		      
		      
		      //--------------------------------------------------------------------------------------
			  //각자 추가하는 Controller에 따라서 수정될 수 있습니다.
		      if ("/auth/memberSignUp.do".equals(servletPath)) {
		    	  MemberDto memberDto = new MemberDto();
		    	  if(request.getParameter("id")!=null){
		    		  memberDto.setId(request.getParameter("id"));
			    	  memberDto.setEmail(request.getParameter("email"));
			    	  memberDto.setName(request.getParameter("name"));
			    	  memberDto.setPw(request.getParameter("pw"));
			    	  memberDto.setImg("default.jpg");
		    	  }
		    	  
		    	  model.put("member", memberDto);
		    	  
		      } else if("/auth/memberLogIn.do".equals(servletPath)){
		    	  MemberDto memberDto = new MemberDto();
		    	  if(request.getParameter("id")!=null){
		    		  memberDto.setId(request.getParameter("id"));
			    	  memberDto.setPw(request.getParameter("pw"));
			        	
			    	  model.put("loginInfo", memberDto); 
		    	  }
		      }
		      
		      
		      
		      //--------------------------------------------------------------------------------------

		      
		      // 페이지 컨트롤러를 실행한다.
		      String viewUrl = pageController.execute(model);
		      
		      // Map 객체에 저장된 값을 ServletRequest에 복사한다.
		      for (String key : model.keySet()) {
		        request.setAttribute(key, model.get(key));
		      }
		      
		      if (viewUrl.startsWith("redirect:")) {
		        response.sendRedirect(viewUrl.substring(9));
		        return;
		        
		      } else {
		        RequestDispatcher rd = request.getRequestDispatcher(viewUrl);
		        rd.include(request, response);
		      }
		      
		    } catch(Exception e){
		    	 e.printStackTrace();
		         request.setAttribute("error", e);
		         RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
		         rd.forward(request, response);
		    }
	}
}
