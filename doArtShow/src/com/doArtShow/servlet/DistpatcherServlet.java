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

import com.doArtShow.controls.Controller;
import com.doArtShow.controls.exhibition.ExhibitionAddController;
import com.doArtShow.dto.ExhibitionDto;
import com.doArtShow.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@SuppressWarnings("serial")
@WebServlet("*.do")
public class DistpatcherServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//service메소드는 doPost와 doGet을 모두 처리합니다.
		 	response.setContentType("text/html; charset=UTF-8");
		    String servletPath = request.getServletPath();
		    System.out.println("###servletPath"+servletPath);
    
		    try {
		      ServletContext sc = this.getServletContext();
		      
		      HashMap<String,Object> model = new HashMap<String,Object>();
		      model.put("session", request.getSession());
		      
		      Controller pageController =  (Controller) sc.getAttribute(servletPath);
    
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
		      } else if("/exhibition/add.do".equals(servletPath)){
		    	  
		    	  if (request.getParameter("")==null){
		    		  
		    	  } else {
		    	  
					String[] filename = new String[2];
				    //String filename="";
					String realFolder = "";
					MultipartRequest multi = null;
					String saveFolder = "/imageFile";
					int fileSize = 5*1024*1024;
					ServletContext context = request.getServletContext();
					realFolder = context.getRealPath(saveFolder);
					DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

					try {
						// 전송을 담당할 컴포넌트를 생성하고 파일을 전송한다.
						// 전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 최대업로드될 파일크기, 문자코드, 기본보안적용
						multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
								new DefaultFileRenamePolicy());
						// 전송한 파일 정보를 가져와 출력한다.
						Enumeration<?> files = multi.getFileNames();

						// 파일정보가 있다면,
						int k = 0;
						while (files.hasMoreElements()) {
							// input 태그의 속성이 files인 태그의 name 속성값: 파라메터 이름
							String name = (String) files.nextElement();

							// 서버에 저장된 파일 이름
							filename[k] = multi.getFilesystemName(name);
							//filename = multi.getFilesystemName(name);
							System.out.println("filename"+k+":"+filename[k]);
							k++;
						}
					} catch (Exception e) {
						e.printStackTrace();
					} 
		    	  //System.out.println("filename[0]: " + filename[0]);
		    	  //System.out.println("filename[1]: " + filename[1]);
		    	  ExhibitionDto exhibitionDto = new ExhibitionDto();
		    	  //if(request.getParameter("id")!=null){
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
			    	  exhibitionDto.setExhPlaceAddr1(multi.getParameter("ExhPlaceAddr1"));
			    	  exhibitionDto.setExhUrl(multi.getParameter("exhUrl"));
			    	  exhibitionDto.setExhStartDate(multi.getParameter("exhStartDate"));
			    	  exhibitionDto.setExhEndDate(multi.getParameter("exhEndDate"));
			    	  exhibitionDto.setOpTime(multi.getParameter("opTime"));
			    	  exhibitionDto.setTel(
			    			  	 multi.getParameter("tel1") + "-"
			    			  + multi.getParameter("tel2") + "-"
			    			  + multi.getParameter("tel3"));
			    	  exhibitionDto.setAdmFee(multi.getParameter("admFee"));
			    	  exhibitionDto.setRegisterDate(new Timestamp(System.currentTimeMillis())); 
			    	  String exhGubun3[] = multi.getParameterValues("exhGubun3");
			    	  
			    	  for (int i=0; i<exhGubun3.length; i++) {
			    		  System.out.println(exhGubun3[i]);
			    	  }
		    		  exhibitionDto.setExhGubun3(exhGubun3);
		    		  for (int i=0; i<exhibitionDto.getExhGubun3().length; i++) {
			    		  System.out.println("exhGubun3%%% "+exhibitionDto.getExhGubun3()[i] );
		    		  }
		    		  
		    		  // if(filename == null) filename = "nothing.jpg";
		    		  exhibitionDto.setImageFile1(filename[0]);
		    		  exhibitionDto.setImageFile2(filename[1]);

			    	  System.out.println("###"+exhibitionDto.toString());
			    	  
			    	  model.put("exhibition", exhibitionDto); 
		    	  //}
		    	  }  
		      } else if("/exhibition/update.do".equals(servletPath)) {
		    	  if (request.getParameter("exhID") != null) {
			    		  System.out.println("$$$"+request.getParameter("exhID"));
			    		  model.put("ExhID", request.getParameter("exhID")); 
		    	  }  else { 
						String[] filename = new String[2];
					    //String filename="";
						String realFolder = "";
						MultipartRequest multi = null;
						String saveFolder = "/imageFile";
						int fileSize = 5*1024*1024;
						ServletContext context = request.getServletContext();
						realFolder = context.getRealPath(saveFolder);
						DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

						try {
							// 전송을 담당할 컴포넌트를 생성하고 파일을 전송한다.
							// 전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 최대업로드될 파일크기, 문자코드, 기본보안적용
							multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8",
									new DefaultFileRenamePolicy());
							// 전송한 파일 정보를 가져와 출력한다.
							Enumeration<?> files = multi.getFileNames();

							// 파일정보가 있다면,
							int k = 0;
							while (files.hasMoreElements()) {
								// input 태그의 속성이 files인 태그의 name 속성값: 파라메터 이름
								String name = (String) files.nextElement();

								// 서버에 저장된 파일 이름
								filename[k] = multi.getFilesystemName(name);
								//filename = multi.getFilesystemName(name);
								System.out.println("filename"+k+":"+filename[k]);
								k++;
							}
						} catch (Exception e) {
							e.printStackTrace();
						} 
			    	  //System.out.println("filename[0]: " + filename[0]);
			    	  //System.out.println("filename[1]: " + filename[1]);
			    	  ExhibitionDto exhibitionDto = new ExhibitionDto();
			    	  //if(request.getParameter("id")!=null){
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
				    	  exhibitionDto.setExhPlaceAddr1(multi.getParameter("ExhPlaceAddr1"));
				    	  exhibitionDto.setExhUrl(multi.getParameter("exhUrl"));
				    	  exhibitionDto.setExhStartDate(multi.getParameter("exhStartDate"));
				    	  exhibitionDto.setExhEndDate(multi.getParameter("exhEndDate"));
				    	  exhibitionDto.setOpTime(multi.getParameter("opTime"));
				    	  exhibitionDto.setTel(
				    			  	 multi.getParameter("tel1") + "-"
				    			  + multi.getParameter("tel2") + "-"
				    			  + multi.getParameter("tel3"));
				    	  exhibitionDto.setAdmFee(multi.getParameter("admFee"));
				    	  //exhibitionDto.setRegisterDate(new Timestamp(System.currentTimeMillis())); 
				    	  String exhGubun3[] = multi.getParameterValues("exhGubun3");
				    	  
				    	  for (int i=0; i<exhGubun3.length; i++) {
				    		  System.out.println(exhGubun3[i]);
				    	  }
			    		  exhibitionDto.setExhGubun3(exhGubun3);
			    		  for (int i=0; i<exhibitionDto.getExhGubun3().length; i++) {
				    		  System.out.println("exhGubun3%%% "+exhibitionDto.getExhGubun3()[i] );
			    		  }
			    		  
			    		  // if(filename == null) filename = "nothing.jpg";
			    		  exhibitionDto.setImageFile1(filename[0]);
			    		  exhibitionDto.setImageFile2(filename[1]);

				    	  System.out.println("###"+exhibitionDto.toString());
				    	  
				    	  model.put("exhibition", exhibitionDto); 
			    	  //}
			    	  }  		    	
		      }
		      //--------------------------------------------------------------------------------------
		      // 페이지 컨트롤러를 실행한다.
		      System.out.println("###");
		      String viewUrl = pageController.execute(model);

		      
		      // Map 객체에 저장된 값을 ServletRequest에 복사한다.
		      for (String key : model.keySet()) {
		        request.setAttribute(key, model.get(key));
		      }
		      
		      if (viewUrl.startsWith("redirect:")) {
		        response.sendRedirect(viewUrl.substring(9));
		        return;
		        
		      } else {
		    	System.out.println("jsp페이지 열기");  
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
