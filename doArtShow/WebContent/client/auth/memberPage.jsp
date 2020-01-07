<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
@media (min-width: 1340px){
	#profileDiv{
		width : 20vw;
	}
}

</style>
</head>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
<body>
<jsp:include page="../../module/2body_first.jsp"></jsp:include>
<%-- <c:if test="${!empty sessionScope.member}"> --%>
<div class="container" id="mainContainer">
  <div class="row">
    <div class="col-md-4 container p-1" id="profileDiv">
        <div id="profileImg" style="margin: 20px;">
          <img src="../../memberProfileImages/default.jpg" class="rounded-circle" alt="default.jpg" width="170" height="170">
        </div>
        <div id="profile">
          <div style="font-size: 25pt; margin-left: 20px; margin-bottom: 20px;">${member.name}</div>
          <div style="float: left; width: 100%; margin-bottom: 60px;">
            <div class="iconDiv">
              <a class="nav-link" href="<%=request.getContextPath()%>/client/auth/wishList.do"><i class="fa fa-heart"></i><br>
              <label>가고싶어요</label></a></div>
            <div  class="iconDiv">
              <a class="nav-link" href="<%=request.getContextPath()%>/client/auth/visitList.do"><i class="fa fa-pencil"></i><br>
              <label>나의 리뷰</label></a></div>
            <div  class="iconDiv">
              <a class="nav-link" href="<%=request.getContextPath()%>/client/auth/memberDetail.do"><i class="fa fa-cog"></i><br>
              <label>설정</label></a></div>
          </div>
        </div>
    </div>
    
    <div class="col-sm-12 col-md-8" id="mainBox">
      <label style="font-size:15pt;">나의 리뷰&nbsp;<span style="color: skyblue;">0</span></label>
      <a class="seeAll" style="color: skyblue;">전체보기</a></p>   
       <c:choose>
	       <c:when test="">
	       <div class="container box">
		  	 <center><a href="<%=request.getContextPath()%>/client/exhibition/ExListView.do">+ 내가 가본 전시 리뷰를 작성해보세요</a></center>
		   </div>
		   </c:when>
		   <c:otherwise>
		   <div class="container">
		  	 
		   </div>
		   </c:otherwise>
	   </c:choose>
	   
      <label style="font-size: 15pt;">
      	가고 싶어요&nbsp;
      	<span style="color: skyblue;">
      		<c:if test="${empty requestScope.wishCount}">0</c:if>
      		<c:if test="${!empty requestScope.wishCount}">${wishCount}</c:if>
      	</span>
      </label>
      <a class="seeAll" style="color: skyblue;">전체보기</a></p>
      <c:choose>
	      <c:when test="${empty requestScope.wishList}">
		      <div class="container box">
		        <center><a href="<%=request.getContextPath()%>/client/exhibition/ExListView.do">+ 내가 가고 싶은 전시를 찾아보세요</a></center>
		      </div>
	      </c:when>
	      <c:otherwise>
	      	  <div class="container">
		      	<c:forEach var="exhibition" items="${wishList}">
		      		<div width="120px">
		      		${exhibition.exhID}<br>
		      		${exhibition.exhName}<br>
		      		<img src="${exhibition.imageFile1}">
		      		</div>
		      	</c:forEach>
		      </div>
	      </c:otherwise>
      </c:choose>
      
      <label style="font-size:15pt;">다녀왔어요&nbsp;<span style="color: skyblue;">0</span></label>
      <a class="seeAll" style="color: skyblue;">전체보기</a></p>   
       <c:choose>
	       <c:when test="${empty requestScope.visitList}">
	       <div class="container box">
		  	 <center><a href="<%=request.getContextPath()%>/client/exhibition/ExListView.do">+ 내가 가본 전시를 리뷰 해보세요</a></center>
		   </div>
		   </c:when>
		   <c:otherwise>
		   <div class="container" style="float:left;">
		  	 	<c:forEach var="exhibition" items="${visitList}">
		      		<div width="120px">
		      		${exhibition.exhID}<br>
		      		${exhibition.exhName}<br>
		      		${exhibition.imageFile1}
		      		</div>
		      	</c:forEach>
		   </div>
		   </c:otherwise>
	   </c:choose>  
      
      <label style="font-size: 15pt;">등록한 전시&nbsp;<span style="color: skyblue;">0</span></label>
      <a class="seeAll" style="color: skyblue;">전체보기</a></p>
      
      <c:choose>
      	<c:when test="">
      	<div class="container box">
	    	<center><a href="<%=request.getContextPath()%>/client/exhibition/addForm.do">+ 전시를 등록해보세요</a></center>
	    </div>
      	</c:when>
      	<c:otherwise>
      		<div class="container">
		      	
		    </div>
      	</c:otherwise>
      </c:choose> 
    </div>
  </div>
</div>
<%-- </c:if> --%>
<%-- <c:if test="${empty sessionScope.member}">
<div class="container" id="mainContainer">
    <div id="pDiv">
		<center>
			로그인이 필요한 페이지 입니다.
		</center>
	</div>
	<div align="center" >
		<a class="btn" href="javascript:addFormLogin();">로그인 하러 가기</a>
	</div>
</div>
</c:if> --%>
<jsp:include page="../../module/3body_last.html"></jsp:include>
</body>
</html>