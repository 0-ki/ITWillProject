<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 메인로고나 top 버튼 클릭시 최상단 좌표 역할 #page-top -->
    <span id="page-top">&nbsp;</span>
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
                <a class="navbar-brand page-scroll" id="top-mainlogo-a" href="/doArtShow"><img src="/doArtShow/images/mainlogo1.png" id="top-mainlogo-img" alt="전시:해"></a>
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
                        <a class="page-scroll" href="#services" id="top-list">지도</a>
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
                    
                    
                        <form>
                            <div class="login-input">
                                <input class="form-control" type="text" placeholder="ID" name="id" id="input_id">
                            </div>
                            <div class="login-input"><input class="form-control" type="password" placeholder="PASSWORD" name="pw" id="input_pw"></div>

                            <div class="login-input">
                                <a href="findId.jsp">아이디</a> / <a href="findPw.jsp">비밀번호 찾기</a><br>
                                <a href=""></a>

                            </div>
                            <hr>
                            <div id="login-btngroup">
                                <input type="submit" class="btn btn-info" id="submitLogin" value="로그인" onclick="validateLogin(this.form)">
                                <br>
                                
                                
                                 <a id="kakao-login-btn"></a>
							<script type='text/javascript'>
								//<![CDATA[
								// 사용할 앱의 JavaScript 키를 설정해 주세요.
								Kakao.init('3f954d79af6a536ec76db999e7f2ba5b');
								// 카카오 로그인 버튼을 생성합니다.
								Kakao.Auth.createLoginButton({
									container : '#kakao-login-btn',
									success : function(authObj) {
										// 로그인 성공시, API를 호출합니다.
										Kakao.API.request({
											url : '/v2/user/me',
											success : function(res) {
												console.log('\n res>>'+JSON.stringify(res));
												
												 console.log('\n authObj>>'+ JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력

									             console.log('\n res.id>>'+ res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)

									             console.log('\n res.email>>'+ res.kakao_account['email']);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)

									             console.log('\n res.nickname>>'+ res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 

									         // res.properties.nickname으로도 접근 가능 )

									             console.log('\n access_token>>'+ authObj.access_token);//<---- 콘솔 로그에 토큰값 출력



									
												
												
											},
											fail : function(error) {
												alert(JSON.stringify(error));
											}
										});
									},
									fail : function(err) {
										alert(JSON.stringify(err));
									}
								});
								//]]>
							</script>
							
							
							<!-- <a id="kakaoBtn" href="javascript:loginWithKakao()"><img src="/doArtShow/images/kakao_account_login_btn_medium_narrow.png" alt="카카오로그인"></a> -->
                               <!-- <button id="kakaoBtn" onclick="javascript:loginWithKakao()"><img src="/doArtShow/images/kakao_account_login_btn_medium_narrow.png" alt="카카오로그인"></button> -->
                            <br>
                            <input  type="button"  class="btn btn-danger" id="submitSignUp" value="회원가입" onclick="validateLogin(this.form)">
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
        <a data-toggle="modal" href="myBtn" id="myBtn" style="line-height:750%;"><span class="item" style="color: #F17F42; align-items: center; font-family: 'Noto Sans KR', sans-serif;">로그인</span></a>
        <a href="<%=request.getContextPath() %>/exhibition/addForm.do"><span class="item" style="color: #CE6D39; font-family: 'Noto Sans KR', sans-serif; "><br><br>전시<br><br>등록</span></a>
        <a href="#page-top"><i class="fa fa-angle-up"></i></a>
    </div>
    