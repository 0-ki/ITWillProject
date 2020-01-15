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
        <!-- === 나의리뷰 =================================================================== -->
         <label style="font-size:15pt;">나의 리뷰&nbsp;
            <span style="color: skyblue;">
              <c:if test="${empty requestScope.reviewCount}">0</c:if>
              <c:if test="${!empty requestScope.reviewCount}">${reviewCount}</c:if>
            </span>
          </label>
          <a href="<%=request.getContextPath()%>/client/auth/reviewList.do" class="seeAll"
            style="color: skyblue;">전체보기</a>
          <c:choose>
            <c:when test="${empty requestScope.reviewList}">
              <div class="box">
                <a href="<%=request.getContextPath()%>/client/exhibition/ExListView.do">
                + 내가 가본 전시 리뷰를 작성해보세요</a>
              </div>
            </c:when>
            <c:otherwise>
              <div class="boxFull">
                <c:forEach var="review" items="${reviewList}" varStatus="vs">
                        <table style="" class="oneRev" id="review <c:out value='${vs.index}'/>">
                            <tbody style="margin:10px;">
                            <tr>
                                <td rowspan="2" style="width:30%"><img src="/doArtShow/exhibitionImages/${review.imageFile1}"
                                    style="width:auto; height:15vh; margin-bottom:10vh; padding: 5px;" ></td>
                                <td style="height:10px; overflow:hidden; padding:0px; text-align:left; font-size: 1.2em">
                                <div style="display: inline-block; padding:0px; width: 250px; white-space: nowrap; text-overflow: ellipsis;
                                     overflow: hidden;" id="revExhName<c:out value='${vs.index}'/>">
                                	<b style="font-size: 1.2em">${review.exhName}</b>
                                </div>
                                    
                                </td>
                            	<td rowspan="2">
                            		
                             		<div class="navbar dropleft float-right reviewNav" style="height:25vh;">		  	 	
                                    <div class="navbar-item dropdown">
                                        <a  class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                                        <i class="fa fa-ellipsis-v" style="margin-left:50px;"></i>
                                        </a>
                                        <div class="dropdown-menu" id="dropdown-menu">
                                            <a class="dropdown-item" href="javascript:openRevModal(<c:out value='${vs.index}'/>)">수정하기</a>
                                            <a class="dropdown-item" href="javascript:confirmDeleteRev(<c:out value='${vs.index}'/>)">삭제하기</a>
                                        </div>
                                    </div>
                                    </div>
                            	</td>
                            </tr>
                            <tr>
                                <td><div style="height:200px; padding:5px; background-color:#f5f5f5; overflow:hidden;">${review.revContent}</div></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="modal fade" id="revUpdateModal<c:out value='${vs.index}'/>" role="dialog">
                                <div class="modal-dialog">
                                    <form method="post" name="reviewUpdateForm">
                                        <!-- Modal 전체 -->
                                        <div class="modal-content">
                                            <!-- Modal header -->
                                            <div class="modal-header">
                                                <button type="button" class="close"
                                                    data-dismiss="modal">&times;</button>
                                            </div>

                                            <!-- Modal body -->
                                            <div class="modal-body"
                                                style="padding: 30px; padding-bottom: 40px; padding-top: 40px;">
                                                <h4 class="modal-title"><b>리뷰 수정하기</b></h4><br><br>
                                                <table class="table nanum">
                                                    <tr>
                                                        <td width="20%">전시 내용</td>
                                                        <td width="80%">
                                                            ${review.exhName}
                                                            <input type="hidden" name="exhID" readonly="readonly"
                                                                value="${review.exhID}">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%">리뷰 작성일</td>
                                                        <td width="80%">${review.revDate}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>리뷰 내용</td>
                                                        <td>
                                                            <textarea cols="60" rows="15" name="revContent"
                                                                placeholder="리뷰는 50자 이내로 작성 가능합니다.">${review.revContent}</textarea>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>

                                            <!-- Modal footer -->
                                            <div id="shareModal-footer<c:out value='${vs.index}'/>">
                                                <button type="button" class="btn btn-light"
                                                    onclick="javascript:chkreviewUpdateForm(this.form)">등록하기</button>
                                                <button type="button" class="btn btn-danger"
                                                    data-dismiss="modal">닫기</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                </c:forEach>
              </div>
            </c:otherwise>
          </c:choose>

          <!-- === 가고 싶은 전시 =================================================================== -->
          <label style="font-size: 15pt;">
            	가고 싶어요&nbsp;
            <span style="color: skyblue;">
              <c:if test="${empty requestScope.wishCount}">0</c:if>
              <c:if test="${!empty requestScope.wishCount}">${wishCount}</c:if>
            </span>
          </label>
          <a href="<%=request.getContextPath()%>/client/auth/wishList.do" class="seeAll"
            style="color: skyblue;">전체보기</a></p>
          <c:choose>
            <c:when test="${empty requestScope.wishList}">
              <div class="  box">
                <a href="<%=request.getContextPath()%>/client/exhibition/ExListView.do">
                + 내가 가고 싶은 전시를 찾아보세요</a>
              </div>
            </c:when>
            <c:otherwise>
              <div class="  boxFull">
                <c:forEach var="exhibition" items="${wishList}">
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

          <!-- === 내가 등록한 전시 =================================================================== -->
          <label style="font-size: 15pt;">등록한 전시&nbsp;
            <span style="color: skyblue;">
              <c:if test="${empty requestScope.myExhCount}">0</c:if>
              <c:if test="${!empty requestScope.myExhCount}">${myExhCount}</c:if>
            </span>
          </label>
          <a href="<%=request.getContextPath()%>/client/exhibition/myList.do" class="seeAll"
            style="color: skyblue;">전체보기</a></p>

          <c:choose>
            <c:when test="${empty requestScope.myExhList}">
              <div class="box">
                <a href="<%=request.getContextPath()%>/client/exhibition/addForm.do">+ 전시를 등록해보세요</a>
              </div>
            </c:when>
            <c:otherwise>
              <div class="boxFull">
                <c:forEach var="exhibition" items="${myExhList}">
                  <div style="text-align:center; width:15vw;; float:left; margin:10px;">
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