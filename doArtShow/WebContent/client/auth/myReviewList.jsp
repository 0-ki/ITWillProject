<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>      
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
<body>
<jsp:include page="../../module/2body_first.jsp"></jsp:include>
<c:if test="${!empty sessionScope.member}">
<div class="container" id="mainContainer">
  <div class="row">
  	<!-- === 프로필 부분  =================================================================== -->
	<jsp:include page="profile.jsp"></jsp:include>
	
    <!-- === 나의리뷰 =================================================================== -->
    <div class="col-sm-12 col-md-8" id="mainBox">
      <label style="font-size:15pt;">나의 리뷰&nbsp;
	      <span style="color: skyblue;">
	      	<c:if test="${empty requestScope.reviewCount}">0</c:if>
      		<c:if test="${!empty requestScope.reviewCount}">${reviewCount}</c:if>
	      </span>
      </label>
      <a href="<%=request.getContextPath()%>/client/auth/reviewList.do" class="seeAll" style="color: skyblue;">전체보기</a></p>   
       <c:choose>
	       <c:when test="${empty requestScope.reviewList}">
	       <div class="container box">
		  	 <center><a href="<%=request.getContextPath()%>/client/exhibition/ExListView.do">+ 내가 가본 전시 리뷰를 작성해보세요</a></center>
		   </div>
		   </c:when>
		   <c:otherwise>
		   <div class="container boxFull">
		  	 <c:forEach var="review" items="${reviewList}">
		  	 	<div>
		  	 	${review.exhName}<br>
		  	 	${review.imageFile1}<br>
		  	 	${review.revContent}<br>
		  	 	<%-- <c:set var="date" value="${review.revDate}"/>
		  	 	<c:set var = "length" value="${fn:length(date)}"/>
		  	 	${fn:substring(date,length-8,length)} --%>
		  	 	</div>
		  	 </c:forEach>
		   </div>
		   </c:otherwise>
	   </c:choose>
	  </div>
	</div>
</div>
</c:if>
<c:if test="${empty sessionScope.member}">
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
</c:if>
<jsp:include page="../../module/3body_last.html"></jsp:include>
</body>
</html>