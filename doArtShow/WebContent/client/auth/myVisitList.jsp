<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
<style>
.boxFull > table{
	margin-right: 10px;
	float:left;
	margin-top:15px;
	height:auto;
}
</style>
<body>
  <jsp:include page="../../module/2body_first.jsp"></jsp:include>
  <c:if test="${!empty sessionScope.member}">
    <div class="container" id="mainContainer">
        <!-- === 프로필 부분 (profileDiv) =================================================================== -->
        <jsp:include page="profile.jsp"></jsp:include>

		<div class="container col-lg-9" id="mainDiv">
          <!-- === 다녀 온 전시 =================================================================== -->
          <label style="font-size:15pt;">다녀왔어요&nbsp;
            <span style="color: skyblue;">
              <c:if test="${empty requestScope.visitCount}">0</c:if>
              <c:if test="${!empty requestScope.visitCount}">${visitCount}</c:if>
            </span>
          </label>
          <a href="<%=request.getContextPath()%>/client/auth/visitList.do" class="seeAll"
            style="color: skyblue;">전체보기</a></p>
          <c:choose>
            <c:when test="${empty requestScope.visitList}">
              <div class="box">
                <a href="<%=request.getContextPath()%>/client/exhibition/ExListView.do">+ 내가 가본 전시를 리뷰 해보세요</a>
              </div>
            </c:when>
            <c:otherwise>
              <div class="boxFull">
                <c:forEach var="exhibition" items="${visitList}">
                  <div style="text-align:center; width:15vw;; float:left; margin : 10px;">
                  <div>
                  <a href="<%=request.getContextPath()%>/client/exhibition/ExContentView.do?exhID=${exhibition.exhID}">
                  	<img class="imageForList" src="/doArtShow/exhibitionImages/${exhibition.imageFile1}" style="width:10vw; height:auto;">
                  </a>
                  </div>
                  <div>
                    <b>${exhibition.exhName}</b>
                  </div>
                </div>
                </c:forEach>
              </div>
            </c:otherwise>
          </c:choose>
         
        </div>
      </div>
  </c:if>
  
  
  <c:if test="${empty sessionScope.member}">
    <jsp:include page="askLogIn.jsp"></jsp:include>
  </c:if>
  <jsp:include page="../../module/3body_last.html"></jsp:include>
</body>
</html>