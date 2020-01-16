<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>

<body>
    <jsp:include page="../../module/2body_first.jsp"></jsp:include>
    <c:if test="${!empty sessionScope.member}">
        <div class="container" id="mainContainer">
            <!-- === 프로필 부분 (profileDiv) =================================================================== -->
            <jsp:include page="../auth/profile.jsp"></jsp:include>

            <div class="container col-lg-9" id="mainDiv">

                <!-- === 내가 등록한 전시 =================================================================== -->
                <label style="font-size: 15pt;">등록한 전시&nbsp;
                    <span style="color: skyblue;">
                        <c:if test="${empty requestScope.myExhCount}">0</c:if>
                        <c:if test="${!empty requestScope.myExhCount}">${myExhCount}</c:if>
                    </span>
                </label>
                <a href="<%=request.getContextPath()%>/client/exhibition/myList.do" class="seeAll">전체보기</a>

                <c:choose>
                    <c:when test="${empty requestScope.exhibitionList}">
                        <div class="box2">
                            <a href="<%=request.getContextPath()%>/client/exhibition/addForm.do"><p>+ 전시를 등록해보세요</p></a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="boxFull">
                            <c:forEach var="exhibitionList" items="${exhibitionList}">
                                <div class="oneExhDiv">
                                    <div class="exhImgDiv">
                                        <a class="exhImgDivA"
                                            href="<%=request.getContextPath()%>/client/exhibition/ExContentView.do?exhID=${exhibitionList.exhID}">
                                            <img src="/doArtShow/exhibitionImages/${exhibitionList.imageFile1}">
                                        </a>
                                    </div>
                                    <%-- <div class="exhNameDiv">
                                        <b>${exhibitionList.exhName}</b>
                                    </div> --%>
                                    
                                    
                                    <div class="navbar" style="width:18vw;">
                                                <span class="revExhNameSpan">
                                                    ${exhibitionList.exhName}
                                                </span>
                                                <div class="navbar-item dropup">

                                                    <a class="nav-link" href="#" data-toggle="dropdown">
                                                        <span style="float: right; font-size: 1.2em; margin-top:5px;"><i
                                                                class="fa fa-ellipsis-v"></i>
                                                        </span>
                                                    </a>
                                                    <div class="dropdown-menu  dropdown-menu-right" id="dropdown-menu">
                                                        <a class="dropdown-item"
                                                            href="<%=request.getContextPath()%>/client/exhibition/update.do?exhID=${exhibitionList.exhID}">수정하기</a>                                                  </div>
                                                </div>
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
        <jsp:include page="../auth/askLogIn.jsp"></jsp:include>
    </c:if>
    <jsp:include page="../../module/3body_last.html"></jsp:include>
</body>

</html>