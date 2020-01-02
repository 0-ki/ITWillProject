<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/module/1doctype_head.jsp"></jsp:include>       
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page import ="com.doArtShow.dto.ExhibitionDto"%> 
<%@ page import = "java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
 -->
<body>
<%
//List<ExhibitionDto> exhibitionList = (List<ExhibitionDto>)request.getAttribute("exhibitionList"); 
//for (int i = 0; i <exhibitionList.size(); i++)
//	System.out.println("$$$"+exhibitionList.get(i).getExhID());
%> 

<div class="container">
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr class="info">
				<th>번호</th>
				<th>전시회명</th>
				<th>전시관</th>
				<th>전시시작일</th>
				<th>전시종료일</th>
				<th>작성일</th>
				<th>수정</th>
				<th>삭제</th>				
			</tr>
		</thead>
		<tbody>
		<c:set var="i" value="1" />
		<c:forEach items="${exhibitionList}" var="exhibitionList">
			<tr>
				<!-- <td>${exhibitionList.exhID}</td>  -->
				<td>${i}	</td>
				<td>${exhibitionList.exhName}</td>
				<td>${exhibitionList.exhPlace}</td>					
				<td>${exhibitionList.exhStartDate}</td>
				<td>${exhibitionList.exhEndDate}</td>
				<td>${exhibitionList.registerDate}</td>								
				<td>
					<a href="update.do?exhID=${exhibitionList.exhID}">수정</a>
				</td>
				<td>
					<a href="delete.do?exhID=${exhibitionList.exhID}">삭제</a>
				</td>				
			</tr>
			<c:set var="i" value="${i+1}" />
		</c:forEach>
		<c:out value="${sum}"/>
		</tbody>
	</table>
</div>
</body>
</html>