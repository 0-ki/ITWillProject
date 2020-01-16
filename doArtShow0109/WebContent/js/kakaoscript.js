
//검색어를 입력하지 않고 검색창에서 엔터를 입력할 시 alert
function chkSearch(searchForm){
	var _search = $('#inpt_search');
	if(!_search.val()){
		alert('검색어를 입력해주세요.');
		_search.focus();
		return false;
	}else {
		return true;
	}
}

// 로그인 되지 않은 상태에서 '전시등록'을 누르면 로그인 화면 모달 활성화
function addFormLogin() {
	$("#myModal").modal({
		backdrop : true
	});
}

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
		alert(JSON.stringify(err)+'으아악');
	}
});