package com.doArtShow.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Enumeration;
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
import com.doArtShow.controls.exhibition.ExhibitionListController;
import com.doArtShow.dao.MemberDao;
import com.doArtShow.dto.ExhibitionDto;
import com.doArtShow.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.do")
public class DistpatcherServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//service메소드는 doPost와 doGet을 모두 처리합니다.
		 	response.setContentType("text/html; charset=UTF-8");
		    String servletPath = request.getServletPath();
		    System.out.println("##1번 웹브라우저에서 DistpatcherServlet(프런트컨트롤러)에 요청");
		    System.out.println(servletPath);
		    
		    try {
		      ServletContext sc = this.getServletContext();
		      
		      HashMap<String,Object> model = new HashMap<String,Object>();
		      HttpSession session = request.getSession();
		      model.put("session", request.getSession());
		      
		      //페이지컨트롤러는 ServletContext보관소에 저장되어있으므로 이 보관소에서 페이지컨트롤러를 꺼낼때 서블릿 URL을 사용한다
		      Controller pageController = (Controller) sc.getAttribute(servletPath);
		      
		      //--------------------------------------------------------------------------------------
			  //각자 추가하는 Controller에 따라서 수정될 수 있습니다.
		      
		      //--------------------------------------------------------------------------------------
		      //jungmi-start
		      //--------------------------------------------------------------------------------------
		      //회원 가입 시 이메일 중복확인
		      if("/client/auth/checkEmail.do".equals(servletPath)){
		             if(request.getParameter("email")!=null){
		                JSONObject jsonObj = new JSONObject();
		                model.put("jsonObj", jsonObj);
		                
		                model.put("checkEmailInfo", request.getParameter("email"));
		                 
		             }
		      //회원가입
		      } else if ("/client/auth/memberAdd.do".equals(servletPath)) {
		    	  if(request.getParameter("email")!=null){
		    		  model.put("member", new MemberDto()
		    				  .setEmail(request.getParameter("email"))
		    				  .setName(request.getParameter("name"))
		                      .setBirth(request.getParameter("birth"))
		                      .setGender(request.getParameter("gender"))
		                      .setPw(request.getParameter("pw")));
		    	  }
		      //회원 로그인   
		      } else if("/client/auth/memberLogIn.do".equals(servletPath)){
		    	  if(request.getParameter("email")!=null){
	                  model.put("loginInfo", new MemberDto()
	                        .setEmail(request.getParameter("email"))
	                        .setPw(request.getParameter("pw"))); 
	               }
		      //회원정보 불러오기
		      } else if("/client/auth/memberDetail.do".equals(servletPath)){
		    	  if(session.getAttribute("member")!=null){
		    		  MemberDto member = (MemberDto)session.getAttribute("member");
		              model.put("email", member.getEmail()); 
		          }
		      //회원정보수정
		      } else if("/client/auth/memberUpdate.do".equals(servletPath)){
		    	  if(request.getParameter("birth")!=null){
		    		  model.put("member", new MemberDto()
		    				  .setBirth(request.getParameter("birth"))
		    				  .setGender(request.getParameter("gender"))
		    				  .setPw(request.getParameter("pw"))
		    				  .setProfileImg(request.getParameter("profileImg")));
		    	  }
		          MemberDto member = (MemberDto)session.getAttribute("member");
	              model.put("email", member.getEmail());
		      //이메일찾기
		      } else if("/client/auth/findEmail.do".equals(servletPath)){
		               if(request.getParameter("name")!=null) {
		                  model.put("findEmailInfo", new MemberDto()
		                        .setName(request.getParameter("name"))
		                        .setBirth(request.getParameter("birth")));
		               }
		      //비밀번호찾기     
		      } else if("/client/auth/findPw.do".equals(servletPath)){
		               if(request.getParameter("email")!=null) {
		                  model.put("findPwInfo", new MemberDto()
		                        .setEmail(request.getParameter("email"))
		                        .setBirth(request.getParameter("birth")));
		               }
		      //회원탈퇴
		      } else if("/client/auth/memberDelete.do".equals(servletPath)){
		    	  if(request.getParameter("email")!=null) {
		    		  model.put("memberDelInfo", new MemberDto()
		    				  .setEmail(request.getParameter("email")));		    	  }
		               
		      //--------------------------------------------------------------------------------------
		 	  //jungmi-end
		 	  //--------------------------------------------------------------------------------------
		 		      
		      } else if("/search.do".equals(servletPath)){
			    	  if(request.getParameter("search")!=null) {
			    		  
			    		  model.put("search", request.getParameter("search"));
			    	  }
			  } else if("/client/exhibition/ExContentView.do".equals(servletPath)){
		    	  if(request.getParameter("exhID") != null){
		    		  int exhID = Integer.parseInt(request.getParameter("exhID"));

		    		  model.put("exhID", exhID);
		    	  }
		      } else if ("/client/exhibition/addForm.do".equals(servletPath)) {
		   
		  				 
		      } else if ("/client/exhibition/add.do".equals(servletPath)) {
		    	  String[] filename = new String[4];
		    	  String realFolder = "";
		    	  MultipartRequest multi = null;
		    	  String saveFolder = "/clientImages";
		    	  int fileSize = 7 * 1024 * 1024;
		    	  ServletContext context = request.getServletContext();
		    	  realFolder = context.getRealPath(saveFolder);
		    	  DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

		  		  try {
		  			  // 전송을 담당할 컴포넌트를 생성하고 파일을 전송한다.
		  			  // 전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 최대업로드될 파일크기, 문자코드, 기본보안적용
		  			  multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		  			  // 전송한 파일 정보를 가져와 출력한다.

		  			  Enumeration<?> files = multi.getFileNames();

		  			  // 파일정보가 있다면,
		  			  int k = 0;
		  			  while (files.hasMoreElements()) {
		  				  // input 태그의 속성이 files인 태그의 name 속성값: 파라메터 이름
		  				  String name = (String) files.nextElement();
		  				  System.out.println("filename#" + k + ":" + multi.getFilesystemName(name));
		  				  if(multi.getFilesystemName(name)!=null){
		  					  // 서버에 저장된 파일 이름
		  					  filename[k] = multi.getFilesystemName(name);
		  					  // filename = multi.getFilesystemName(name);
		  					  System.out.println("filename*" + k + ":" + filename[k]);
		  					  k++;
		  				  }
		  			  }
		  		  } catch (Exception e) {
		  			  e.printStackTrace();
		  		  }
		  		
		  		  ExhibitionDto exhibitionDto = new ExhibitionDto();
		  		  // exhibitionDto.setExhID(Integer.parseInt(multi.getParameter("exhID")));
		  		  exhibitionDto.setMemberID(multi.getParameter("memberID"));
		  		  exhibitionDto.setExhGubun1(multi.getParameter("exhGubun1"));
		  		  exhibitionDto.setExhGubun2(multi.getParameter("exhGubun2"));
		  		  exhibitionDto.setExhGubun4(multi.getParameter("exhGubun4"));
		  		  exhibitionDto.setExhName(multi.getParameter("exhName"));
		  		  exhibitionDto.setArtistName(multi.getParameter("artistName"));
		  		  exhibitionDto.setArtistInfo(multi.getParameter("artistInfo"));
		  		  exhibitionDto.setExhContent(multi.getParameter("exhContent"));
		  		  exhibitionDto.setExhPlace(multi.getParameter("exhPlace"));
		  		  exhibitionDto.setExhPlaceAddr1(multi.getParameter("exhPlaceAddr1"));
		  		  exhibitionDto.setExhUrl(multi.getParameter("exhUrl"));
		  		  exhibitionDto.setExhStartDate(multi.getParameter("exhStartDate"));
		  		  exhibitionDto.setExhEndDate(multi.getParameter("exhEndDate"));
		  		  exhibitionDto.setOpTime(multi.getParameter("opTime"));
		  		  exhibitionDto.setTel(multi.getParameter("tel1") + "-" + multi.getParameter("tel2") + "-" + multi.getParameter("tel3"));
		  		  exhibitionDto.setAdmFee(multi.getParameter("admFee"));
		  		  exhibitionDto.setRegisterDate(new Timestamp(System.currentTimeMillis()));
		  				
		  		  String exhGubun3[] = multi.getParameterValues("exhGubun3");
		  		  for (int i = 0; i < exhGubun3.length; i++) {
		  			  System.out.println(exhGubun3[i]);
		  		  }
		  		  exhibitionDto.setExhGubun3(exhGubun3);
		  		  for (int i = 0; i < exhibitionDto.getExhGubun3().length; i++) {
		  			  System.out.println("exhGubun3%%% " + exhibitionDto.getExhGubun3()[i]);
		  		  }

		  		  // if(filename == null) filename = "nothing.jpg";
		  		  exhibitionDto.setImageFile1(filename[0]);
		  		  exhibitionDto.setImageFile2(filename[1]);
		  		  exhibitionDto.setImageFile3(filename[2]);
		  		  exhibitionDto.setImageFile4(filename[3]);

		  		  System.out.println("###" + exhibitionDto.toString());

		  		  model.put("exhibition", exhibitionDto);
		  		  // }
		  		  // }
		      } else if ("/client/exhibition/update.do".equals(servletPath)) {
		    	  if (request.getParameter("exhID") != null) {
		  			  System.out.println("$$$" + request.getParameter("exhID"));
		  			  model.put("exhID", request.getParameter("exhID"));
		  		  } else {
		  			  String[] filename = new String[4];
		  			  // String filename="";
		  			  String realFolder = "";
		  			  MultipartRequest multi = null;
		  			  String saveFolder = "/clientImages";
		  			  int fileSize = 7 * 1024 * 1024;
		  			  ServletContext context = request.getServletContext();
		  			  realFolder = context.getRealPath(saveFolder);
		  			  DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

		  			  try {
		  				  // 전송을 담당할 컴포넌트를 생성하고 파일을 전송한다.
		  				  // 전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 최대업로드될 파일크기, 문자코드,
		  				  // 기본보안적용
		  				  multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
		  						  new DefaultFileRenamePolicy());
		  				  // 전송한 파일 정보를 가져와 출력한다.
		  				  Enumeration<?> files = multi.getFileNames();

		  				  // 파일정보가 있다면,
		  				  int k = 0;
		  				  while (files.hasMoreElements()) {
		  					  // input 태그의 속성이 files인 태그의 name 속성값: 파라메터 이름
		  					  String name = (String) files.nextElement();
		  					  System.out.println("filename" + k + ":" + name);
		  					  if(name!=null){
		  						  // 서버에 저장된 파일 이름
		  						  filename[k] = multi.getFilesystemName(name);
		  						  // filename = multi.getFilesystemName(name);
		  						  System.out.println("filename" + k + ":" + filename[k]);
		  						  k++;
		  					  }
		  				  }
		  			  } catch (Exception e) {
		  				  e.printStackTrace();
		  			  }
		  			  // System.out.println("filename[0]: " + filename[0]);
		  			  // System.out.println("filename[1]: " + filename[1]);
		  			  ExhibitionDto exhibitionDto = new ExhibitionDto();
		  			  // if(request.getParameter("id")!=null){
		  			  exhibitionDto.setExhID(Integer.parseInt(multi.getParameter("exhID")));
		  			  exhibitionDto.setMemberID(multi.getParameter("memberID"));
		  			  exhibitionDto.setExhGubun1(multi.getParameter("exhGubun1"));
		  			  exhibitionDto.setExhGubun2(multi.getParameter("exhGubun2"));
		  			  exhibitionDto.setExhGubun4(multi.getParameter("exhGubun4"));
		  			  exhibitionDto.setExhName(multi.getParameter("exhName"));
		  			  exhibitionDto.setArtistName(multi.getParameter("artistName"));
		  			  exhibitionDto.setArtistInfo(multi.getParameter("artistInfo"));
		  			  exhibitionDto.setExhContent(multi.getParameter("exhContent"));
		  			  exhibitionDto.setExhPlace(multi.getParameter("exhPlace"));
		  			  exhibitionDto.setExhPlaceAddr1(multi.getParameter("exhPlaceAddr1"));
		  			  exhibitionDto.setExhUrl(multi.getParameter("exhUrl"));
		  			  exhibitionDto.setExhStartDate(multi.getParameter("exhStartDate"));
		  			  exhibitionDto.setExhEndDate(multi.getParameter("exhEndDate"));
		  			  exhibitionDto.setOpTime(multi.getParameter("opTime"));
		  			  exhibitionDto.setTel(multi.getParameter("tel1") + "-" + multi.getParameter("tel2") + "-" + multi.getParameter("tel3"));
		  			  exhibitionDto.setAdmFee(multi.getParameter("admFee"));
		  			  // exhibitionDto.setRegisterDate(new
		  			  // Timestamp(System.currentTimeMillis()));
		  			  String exhGubun3[] = multi.getParameterValues("exhGubun3");

		  			  for (int i = 0; i < exhGubun3.length; i++) {
		  				  System.out.println(exhGubun3[i]);
		  			  }
		  			  exhibitionDto.setExhGubun3(exhGubun3);
		  			  for (int i = 0; i < exhibitionDto.getExhGubun3().length; i++) {
		  				  System.out.println("exhGubun3%%% " + exhibitionDto.getExhGubun3()[i]);
		  			  }

		  			  // if(filename == null) filename = "nothing.jpg";
		  			  exhibitionDto.setImageFile1(filename[0]);
		  			  exhibitionDto.setImageFile2(filename[1]);
		  			  exhibitionDto.setImageFile3(filename[2]);
		  			  exhibitionDto.setImageFile4(filename[3]);

		  			  System.out.println("###" + exhibitionDto.toString());

		  			  model.put("exhibition", exhibitionDto);
		  			  // }
		  		  }
		  	  } else if ("/client/exhibition/list.do".equals(servletPath)) {
		  		  model.put("id", "id01");

		  	  }
		      
		      
		      //--------------------------------------------------------------------------------------

		      
		      // 페이지 컨트롤러를 실행한다.
		      System.out.println("##2번 페이지컨트롤러 호출");
		      String viewUrl = pageController.execute(model); //페이지 컨트롤러의 execute()메서드로 이동하며 데이터를 주고받을 바구니 역할을 하는 Map객체(model)를 넘긴다
		      System.out.println(viewUrl);
		      //viewUrl은 execute()의 반환값으로 화면에 출력을 수행할 JSP의 URL이다
		      
		      // Map 객체에 저장된 값을 ServletRequest에 복사한다.
		      for (String key : model.keySet()) {
		        request.setAttribute(key, model.get(key));
		      }
		      
		      //view(JSP)로 실행을 위임하거나 리다이렉트한다
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

