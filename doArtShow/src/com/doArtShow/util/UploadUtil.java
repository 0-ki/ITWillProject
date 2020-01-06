package com.doArtShow.util;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UploadUtil {
	//--------------------------------------------------------------------------------------------------
	// begin: fileUpload(String saveFolder, int fileSize, HttpServletRequest request) - 단일 파일을 업로드하는 메소드  
	// programmed by Hojeong 20.01.02
	//--------------------------------------------------------------------------------------------------
	// newly added by Hojeong 20/01/03(yy/mm/dd)
	public static MultipartRequest multi;				// MultipartRequest for fileUpload static 변수 선언
	public static String fileUpload(String saveFolder, int fileSize, HttpServletRequest request) {
		String realFolder = "";															 
		ServletContext context = request.getServletContext();					 
		realFolder = context.getRealPath(saveFolder);								 
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();	 
		String filename = null;
		
		try {				
				// 전송을 담당할 컴포넌트를 생성하고 파일을 전송한다.
			// 전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 최대업로드될 파일크기, 문자코드, 기본보안적용
			multi = new MultipartRequest(request, realFolder, 					
					fileSize, "UTF-8", new DefaultFileRenamePolicy());
			// 전송한 파일 정보를 가져와 출력한다.

			Enumeration<?> files = multi.getFileNames();

			// 파일정보가 있다면,
			while (files.hasMoreElements()) {
				// input 태그의 속성이 files인 태그의 name 속성값: 파라메터 이름
				String name = (String) files.nextElement();
					if(multi.getFilesystemName(name)!=null){
					// 서버에 저장된 파일 이름
					filename = multi.getFilesystemName(name);
					}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filename;
	}
	//--------------------------------------------------------------------------------------------------
	// End: fileUpload(String saveFolder, int fileSize, HttpServletRequest request) - 단일 파일을 업로드하기위한 메소드  
	// programmed by Hojeong 20.01.02
	//--------------------------------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------------------------------
	// begin: filesUpload(String saveFolder, int fileSize, HttpServletRequest request) - 다중 파일을 업로드하기위한 메소드 
	// programmed by Hojeong 20.01.02
	//--------------------------------------------------------------------------------------------------
	public static String[] filesUpload(String saveFolder, int fileSize, HttpServletRequest request) {
		String realFolder = "";															 
		ServletContext context = request.getServletContext();					 
		realFolder = context.getRealPath(saveFolder);								 
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();	 
		String[] filename = new String[4];	
		
		try {				
			System.out.println("$$$filesupload");
			// 전송을 담당할 컴포넌트를 생성하고 파일을 전송한다.
			// 전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 최대업로드될 파일크기, 문자코드, 기본보안적용
			multi = new MultipartRequest(request, realFolder, 					
					fileSize, "UTF-8", new DefaultFileRenamePolicy());
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
		return filename;
	}
	//--------------------------------------------------------------------------------------------------
	// end: filesUpload(String saveFolder, int fileSize, HttpServletRequest request) - 다중 파일을 업로드하는 메소드  
	// programmed by Hojeong 20.01.02
	//--------------------------------------------------------------------------------------------------
	
}
