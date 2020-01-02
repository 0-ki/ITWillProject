<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="isLogin" value="${sessionScope.member}"/>

    <!-- 메인로고나 top 버튼 클릭시 최상단 좌표 역할 #page-top -->
    <!-- <span id="page-top">&nbsp;</span> -->
    <div id="page-top-div"></div>
    <!--최상단 Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top my-nav-top">
        <div class="container" id="top-container">
            <!-- 모바일에서 출력 -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" id="top-mainlogo-a" href="/doArtShow"><img src="/doArtShow/resourceImages/mainlogo1.png" id="top-mainlogo-img" alt="전시:해"></a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                <div id="top-searchbar" class="nav justify-content-center">
                 	<form name="searchForm" action="<%=request.getContextPath()%>/search.do" onsubmit="return chkSearch(this.form)" method="get">
                    	<input type="search" class="form-control" placeholder="전시 검색" id="search" name="search">
                    	<input type="submit" class="hidden" value="검색">
                    </form>
                </div>

                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="<%=request.getContextPath()%>/client/ExListView.do" id="top-list">전시목록</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="<%=request.getContextPath()%>/searchMap.do" id="top-list">지도</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    <!--/ 최상단 Navigation -->


    <!-- 로그인 Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content" id="login-content">
                <div class="modal-header">
                    <h4 class="modal-title"> </h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">

                    <div id="login-wrap">
                    
                        <form method="post" name="loginForm" action="<%=request.getContextPath()%>/client/auth/memberLogIn.do">
                            <div class="login-input">
                                <input class="form-control" type="text" placeholder="EMAIL" name="email" id="input_email">
                                <div style="margin-top:5px" id="chkEmail"></div>
                            </div>
                            
                            <div class="login-input">
                            	<input class="form-control" type="password" placeholder="PASSWORD" name="pw" id="input_pw">
                            	<div style="margin-top:5px" id="chkPw"></div>
                            </div>
                            <div class="login-input">
                                <a href="<%=request.getContextPath()%>/client/auth/findEmail.do">아이디</a> 
                                / <a href="<%=request.getContextPath()%>/client/auth/findPw.do">비밀번호 찾기</a><br>
                            </div>
                            <hr>
                            <div id="login-btngroup">
                                <input type="button" class="btn btn-info" id="submitBtn" value="로그인" onclick="validateLogin(this.form)">
                                <br>	
                                
                                 <a id="kakao-login-btn"></a>
                                 
							<script type='text/javascript'>

								//]]>
							</script>
							
							
							<!-- <a id="kakaoBtn" href="javascript:loginWithKakao()"><img src="/doArtShow/images/kakao_account_login_btn_medium_narrow.png" alt="카카오로그인"></a> -->
                               <!-- <button id="kakaoBtn" onclick="javascript:loginWithKakao()"><img src="/doArtShow/images/kakao_account_login_btn_medium_narrow.png" alt="카카오로그인"></button> -->
                            <br>
                             <a class="btn btn-danger" href="<%=request.getContextPath()%>/client/auth/memberAdd.do">회원가입</a>
                            </div>


                        </form>
                    </div>


                </div>
                <div id="login-footer">

                    <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>


    <div id="back-top">
    
    	
    
        <c:choose>
    	<c:when test="${empty isLogin}">
        
        <a data-toggle="modal" href="myBtn" id="myBtn" style="line-height:750%;">
        <span class="item" style="color: #F17F42; align-items: center; font-family: 'Noto Sans KR', sans-serif;">로그인</span>
        </a>
    	</c:when>
    	
    	
    	
    	<c:when test="${!empty isLogin}">
    	
    	<a href="<%=request.getContextPath()%>/client/auth/memberLogOut.do" id="myBtn" style="line-height:750%;">
        <span class="item" style="color: #F17F42; align-items: center; font-family: 'Noto Sans KR', sans-serif;">로그아웃</span>
        </a>
    	
    	</c:when>
        
    </c:choose>
        
        <a href="
        <c:choose>
        <c:when test="${!empty isLogin}">
        <%=request.getContextPath() %>/exhibition/addForm.do 		
        </c:when>
        
        <c:when test="${empty isLogin}">
        javascript:addFormLogin();
        </c:when>
        
    	</c:choose>
        ">
        <span class="item" style="color: #CE6D39; font-family: 'Noto Sans KR', sans-serif; "><br><br>전시<br><br>등록</span>
        </a>
        
        
        <a href="#" id="backtop"><i class="fa fa-angle-up"></i></a>
<!--         <a href="#page-top"><i class="fa fa-angle-up"></i></a> -->
    </div>
   
    
    
    
    
    
    
    
    
    
    
    