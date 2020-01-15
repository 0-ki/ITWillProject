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
        <jsp:include page="../auth/profile.jsp"></jsp:include>

		<div class="container col-lg-9" id="mainDiv">
        <!-- === 나의리뷰 =================================================================== -->
         <label style="font-size:15pt;">등록한 전시&nbsp;
            <span style="color: skyblue;">
              <c:if test="${empty requestScope.myExhCount}">0</c:if>
              <c:if test="${!empty requestScope.myExhCount}">${myExhCount}</c:if>
            </span>
          </label>
          <a href="<%=request.getContextPath()%>/client/exhibition/myList.do" class="seeAll"
            style="color: skyblue;">전체보기</a>
          <c:choose>
            <c:when test="${empty requestScope.exhibitionList}">
              <div class="box">
                <a href="<%=request.getContextPath()%>/client/exhibition/addForm.do">
                + 전시를 등록해보세요</a>
              </div>
            </c:when>
            <c:otherwise>
              <div class="boxFull">
                <c:forEach var="exhibitionList" items="${exhibitionList}" varStatus="vs">
                        <table style="" class="" id="myExh<c:out value='${vs.index}'/>">
                            <tbody style="margin:10px;">
                            <tr>
                                <td rowspan="2" style="width:30%">
                                <img src="/doArtShow/exhibitionImages/${exhibitionList.imageFile1}" 
                                	 style="width:auto; height:15vh; margin-bottom:10vh;">
                                </td>
                                <td style="height:10px; overflow:hidden; padding:0px; text-align:left; font-size: 1.1em">
	                                <div style="display: inline-block; width: 250px; white-space: nowrap; text-overflow: ellipsis;
	                                     overflow: hidden;" id="myExhName<c:out value='${vs.index}'/>">
	                                	<b style="margin:auto;">${exhibitionList.exhName}</b>
	                                </div>
                                </td>
                                
                            	<td rowspan="2">
                             		<div class="navbar dropleft float-right reviewNav" style="height:25vh;">		  	 	
                                    <div class="navbar-item dropdown">
                                        <a  class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                                        <i class="fa fa-ellipsis-v" style="margin-left:50px;"></i>
                                        </a>
                                        <div class="dropdown-menu" id="dropdown-menu">
                                            <a class="dropdown-item" href="<%=request.getContextPath()%>/client/exhibition/update.do?exhID=${exhibitionList.exhID}">수정하기</a>
                                            <%-- 삭제요청으로 바꿔야할지
                                             <a class="dropdown-item" href="javascript:confirmDeleteRev(<c:out value='${vs.index}'/>)">삭제하기</a>
                                             --%>
                                        </div>
                                    </div>
                                    </div>
                            	</td>
                            </tr>
                            <tr>
                                <td><div style="height:200px; padding : 0px; overflow:hidden;">${review.revContent}</div></td>
                            </tr>
                            </tbody>
                        </table>
                </c:forEach>
              </div>
            </c:otherwise>
          </c:choose>
          
        </div>
      </div>
  </c:if>
  
  
  <c:if test="${empty sessionScope.member}">
    <div class=" " id="mainContainer">
      <div id="pDiv">
        <center>
          로그인이 필요한 페이지 입니다.
        </center>
      </div>
      <div align="center">
        <a class="btn" href="javascript:addFormLogin();">로그인 하러 가기</a>
      </div>
    </div>
  </c:if>
  <jsp:include page="../../module/3body_last.html"></jsp:include>
</body>
</html>