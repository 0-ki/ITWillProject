package com.doArtShow.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.doArtShow.controls.Controller;
import com.doArtShow.dao.MemberDao;
import com.doArtShow.dto.MemberDto;

@WebServlet("*.do")
public class DistpatcherServlet extends HttpServlet{
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//service메소드는 doPost와 doGet을 모두 처리합니다.
		 	response.setContentType("text/html; charset=UTF-8");
		    String servletPath = request.getServletPath();
		    System.out.println(servletPath);
		    
		    try {
		      ServletContext sc = this.getServletContext();
		      
		      HashMap<String,Object> model = new HashMap<String,Object>();
		      HttpSession session = request.getSession();
		      model.put("session", request.getSession());
		      
		      Controller pageController = (Controller) sc.getAttribute(servletPath);
		      System.out.println("servletPath : "+servletPath);
		      
		      
		      //--------------------------------------------------------------------------------------
			  //각자 추가하는 Controller에 따라서 수정될 수 있습니다.
		    if("/client/auth/checkEmail.do".equals(servletPath)){
		    	if(request.getParameter("email")!=null){
			    	JSONObject jsonObj = new JSONObject();
			    	model.put("jsonObj", jsonObj);
			    	
			    	model.put("checkEmailInfo", request.getParameter("email"));
			        
		    	}
		    } else if ("/client/auth/memberAdd.do".equals(servletPath)) {
		    	if(request.getParameter("id")!=null){
		    		  model.put("member", new MemberDto()
		    				  .setId(request.getParameter("id"))
		    				  .setEmail(request.getParameter("email"))
		    				  .setName(request.getParameter("name"))
		    				  .setPw(request.getParameter("pw")));
		    	  }
		    	  
		      } else if("/client/auth/memberLogIn.do".equals(servletPath)){
		    	  if(request.getParameter("id")!=null){
			    	  model.put("loginInfo", new MemberDto()
			    			  .setId(request.getParameter("id"))
			    			  .setPw(request.getParameter("pw"))); 
		    	  }
		    	  
		      } else if("/client/auth/memberDetail.do".equals(servletPath)){
		    	  if(session.getAttribute("member")!=null){
		    		  MemberDto member = (MemberDto)session.getAttribute("member");
		    		  model.put("id", member.getId()); 
		    	  }
		      } else if("/client/auth/memberUpdate.do".equals(servletPath)){
		    	 if(request.getParameter("name")!=null) {
		    		 model.put("name",request.getParameter("name"));
		    		 
		    		 MemberDto member = (MemberDto)session.getAttribute("member");
		    		 String id = member.getId();
		    		 model.put("id", id);
		    	 }
		    	 if(request.getParameter("email")!=null) {
		    		 model.put("email",request.getParameter("email"));
		    		 
		    		 MemberDto member = (MemberDto)session.getAttribute("member");
		    		 String id = member.getId();
		    		 model.put("id", id);
		    	 }
		      } else if("/client/auth/findId.do".equals(servletPath)){
		    	  if(request.getParameter("email")!=null) {
		    		  model.put("findIdInfo", new MemberDto()
		    				  .setEmail(request.getParameter("email"))
		    				  .setName(request.getParameter("name")));
		    	  }
		      } else if("/client/auth/findPw.do".equals(servletPath)){
		    	  if(request.getParameter("id")!=null) {
		    		  model.put("findPwInfo", new MemberDto()
		    				  .setId(request.getParameter("id"))
		    				  .setEmail(request.getParameter("email")));
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
		        
		      } else if (viewUrl.startsWith("json:")) {
		    	  response.setContentType("json:application/json");
		    	  response.getWriter().print(viewUrl.substring(5));
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
