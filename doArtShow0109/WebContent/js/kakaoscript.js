
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
	         // res.properties.nickname으로도 접근 가능 )
	             console.log('\n access_token>>'+ authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
	 
	             console.log('\n\n res.id>>'+ res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
	             console.log('\n res.nickname>>'+ res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
	             console.log('\n res.email>>'+ res.kakao_account['email']);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
	             console.log('\n res.birthday>>'+ res.kakao_account.birthday);
	             console.log('\n res.age_range>>'+ res.kakao_account.age_range);
	             console.log('\n res.gender>>'+ res.kakao_account.gender);
	             var kid = res.id; 
	             var email = res.kakao_account['email'];
	             var name = res.properties['nickname'];
	             var raw_birth = res.kakao_account.birthday;
	             var birth = '0000-'+raw_birth.substring(0,2)+'-'+raw_birth.substring(2,4);
	             var gender = res.kakao_account.gender;
	             if(gender=='male'){
	            	 gender='남성'}else{
	            		 gender='여성'};
	             console.log(kid+'\n'+email+'\n'+name+'\n'+birth+'\n'+gender);
	             
	         	$.ajax({
	        		type: "POST",
	        		url: "kakaoLogin.do",
	        		/*data: data,*/
	        		data: {'kid':kid, 'email':email,'name':name,'birth':birth,'gender':gender},
	        		success: function(data){
	        			if(data.res==1){alert("전시 등록 신청이 완료됐습니다.");
	        				location.replace('/doArtShow/client/auth/memberPage.do');}
	        		},
	        		error: function(e){
	        			alert('전시 등록에 실패했습니다.');
	        		}
	        	});
	             
			},
			fail : function(error) {
				alert(JSON.stringify(error)+'API 회원정보 접근 실패');
			}
		});
	},
	fail : function(err) {
		alert(JSON.stringify(err)+'API 호출 실패');
	}
});