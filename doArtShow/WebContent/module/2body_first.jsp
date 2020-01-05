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
                <a class="navbar-brand page-scroll" id="top-mainlogo-a" href="/doArtShow"><img src="/doArtShow/resourcesImages/mainlogo2.png" id="top-mainlogo-img" alt="전시:해"></a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                <div id="top-searchbar" class="nav justify-content-center">
                 	<form name="searchForm" action="<%=request.getContextPath()%>/search.do" onsubmit="return chkSearch(this.form)" method="get">
                    	<input type="search" class="form-control" placeholder="전시 검색" id="search" name="search">
                    	<input type="submit" class="hidden" value="검색">
                    </form>
                </div>

<!-- 

<div class="section">
    <div class="section__item">
        <a href="#0" class="sm-link sm-link_padding-all sm-link1">
            <span class="sm-link__label">Hover effect #1</span>
        </a>
    </div>
</div>


 -->


                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll sm-link sm-link_padding-all sm-link1" href="<%=request.getContextPath()%>/client/exhibition/ExListView.do" id="top-list">
                       <span class="sm-link__label">전시목록</span>
                        </a>
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
        <%=request.getContextPath() %>/client/exhibition/addForm.do 		
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
   
    <style>
    
/*
* core styles
*/

.sm-link{
	--uismLinkDisplay: var(--smLinkDisplay, inline-flex);	
	--uismLinkTextColor: var(--smLinkTextColor);
	--uismLinkTextColorHover: var(--smLinkTextColorHover);	
	
	display: var(--uismLinkDisplay);
	color: var(--uismLinkTextColor);
	position: relative;
	overflow: hidden;
}

a.sm-link{
	text-decoration: none;
}

.sm-link__label{
  display: block;
}

/* sm-link_padding-all */ 

.sm-link_padding-all{
	--uismLinkLineWeight: var(--smLinkLineWeight, 2px);
	--uismLinkLineColor: var(--smLinkLineColor, #000);
	--uismLinkPadding: var(--smLinkPadding, 5px);
	
	padding: var(--uismLinkPadding);
}

.sm-link_padding-all::before, 
.sm-link_padding-all::after{
  width: 100%;
  height: var(--uismLinkLineWeight);
  left: 0;
}

.sm-link_padding-all::before{
  top: 0;
}

.sm-link_padding-all::after{
  bottom: 0;
}

.sm-link_padding-all .sm-link__label::before,
.sm-link_padding-all .sm-link__label::after{
  width: var(--uismLinkLineWeight);
  height: 100%;
  top: 0;
}

.sm-link_padding-all .sm-link__label::before{
  left: 0;
}

.sm-link_padding-all .sm-link__label::after{
  right: 0;
}

.sm-link_padding-all::before,
.sm-link_padding-all::after,
.sm-link_padding-all .sm-link__label::before,
.sm-link_padding-all .sm-link__label::after{
  content: "";     
	background-color: var(--uismLinkLineColor);
  position: absolute; 
	opacity: 0;
	
	will-change: transform, opacity;
	transition-property: transform, opacity;
}

.sm-link_padding-all:hover::before,
.sm-link_padding-all:hover::after,
.sm-link_padding-all:hover .sm-link__label::before,
.sm-link_padding-all:hover .sm-link__label::after{
	opacity: 1;
}

/* sm-link_padding-bottom */ 

.sm-link_padding-bottom{
	--uismLinkLineWeight: var(--smLinkLineWeight, 2px);
	--uismLinkLineColor: var(--smLinkLineColor, #000);	
	
	padding-bottom: var(--uismLinkLineWeight);	
	position: relative;
}

.sm-link_padding-bottom::after{
  content: "";
  width: 100%;
  height: var(--uismLinkLineWeight);
	background-color: var(--uismLinkLineColor);
	
  position: absolute;
  left: 0;
  bottom: 0;
}

/* sm-link_bg */ 

.sm-link_bg {
	--uismLinkLineColor: var(--smLinkLineColor, #000);	
	--uismLinkTextColorHover: var(--smLinkTextColorHover, #fff);	
	--uismLinkPadding: var(--smLinkPadding, 5px);
	
	padding: var(--uismLinkPadding);
	transition: color .3s ease-out;
}

.sm-link_bg::before, 
.sm-link_bg::after{
  content: "";
	background-color: var(--uismLinkLineColor);	
  opacity: 0;
  position: absolute;
	
	transition: transform .2s ease-out, opacity .2s ease-out .03s;
}

.sm-link_bg .sm-link__label{
  position: relative;
  z-index: 2;
}

.sm-link_bg:hover::before, 
.sm-link_bg:hover::after{
  opacity: 1;
	transition-duration: .35s, .35s;
	transition-delay: 0s, 0s;
}

.sm-link_bg:hover{
	color: var(--uismLinkTextColorHover);
}

/* sm-link_text */ 

.sm-link_text::before{
  content: attr(data-sm-link-text);
	color: var(--uismLinkTextColorHover);
  position: absolute;
}

.sm-link_text::before, 
.sm-link_text .sm-link__label{
  transition-property: transform;
	transition-timing-function: cubic-bezier(.86, .6, .08, 1.01); 
	transition-duration: .3s;
}

.sm-link_text:hover::before,
.sm-link_text:hover .sm-link__label{
	transition-duration: .4s;
}

/* effect 1 */

.sm-link1::before{
  transform: translate3d(-105%, 0, 0);
}

.sm-link1::after{
  transform: translate3d(105%, 0, 0);
}

.sm-link1 .sm-link__label::before{
  transform: translate3d(0%, -100%, 0);
}

.sm-link1 .sm-link__label::after{
  transform: translate3d(0%, 100%, 0);
}

.sm-link1::before,
.sm-link1::after,
.sm-link1 .sm-link__label::before,
.sm-link1 .sm-link__label::after{
	transition-timing-function: ease-out;
	transition-duration: .2s, .15s;
	transition-delay: 0s, .15s;
}

.sm-link1:hover::before,
.sm-link1:hover::after,
.sm-link1:hover .sm-link__label::before,
.sm-link1:hover .sm-link__label::after{
  transform: translate3d(0, 0, 0);
	opacity: 1;
	
	transition-duration: .25s;
	transition-delay: 0s;
}


/*
SETTINGS
*/

.sm-link{
	--smLinkPadding: 10px 15px;
	--smLinkLineWeight: 5px;
	--smLinkLineColor: #fff373;
	--smLinkTextColor: #fff373;
	--smLinkTextColorHover: #1b255a;
}

.sm-link_bg{
	--smLinkTextColorHover: #fff;
}
    
    
    </style>
    
    
    
    
    
    
    
    
    
    