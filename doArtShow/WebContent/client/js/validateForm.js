// 회원 로그인 유효성 검사
function validateLogin(loginForm){
	var email 	= loginForm.email.value;
	var pw 		= loginForm.pw.value;
	$.ajax({
		url : 'memberLogIn.do?email='+email+'&pw='+pw,
		type : 'GET',
		datatype : 'JSON',
		success : function(data){
			if(data.res == 1){
				//이메일이 중복 되는 경우
				$("#chkLoginEmail").text("이메일 또는 아이디가 일치하지 않습니다.");
				$("#chkLoginEmail").css('color','red');
			} else {
				//이메일이 중복 되지 않는 경우
				//이메일 형식 검사
				var filter =  /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				if(filter.test(email)){
					$("#email_result").text("사용가능한 이메일입니다.");
					$("#email_result").css('color','green');
					$("#emailUseBtn").attr("disabled", false);
					$('#email_value').attr('readonly', true);
				} else {
					$("#email_result").text("이메일 형식에 맞게 작성해주세요. 예시)123@art.com");
					$("#email_result").css('color','red');
					$("#emailUseBtn").attr("disabled", true);
				}
			}
		},
		error: function(request, status, error){
			var msg = "ERROR : <br>"
				msg += reqeust.status +"<br>"+ request.responseText +"<br>"+ error;
		}
	});
	
	if(!loginForm.email.value){
        $("#chkLoginEmail").text("이메일을 입력하세요");
        $("#chkLoginEmail").css('color','red');
        loginForm.email.focus();
        return false;
    }
    if(!loginForm.pw.value){
        $("#chkLoginPw").text("비밀번호를 입력하세요");
        $("#chkLoginPw").css('color','red');
        loginForm.pw.focus();
        return false;
    }

    loginForm.submit();
}
$(document).ready(function(){
	$("#login_email").keyup(function(){
		if($("#login_email").val() != ""){
			$("#chkLoginEmail").text("")
		}
	});
	$("#login_pw").keyup(function(){
		if($("#login_pw").val() != ""){
			$("#chkLoginPw").text("")
		}
	});
});

//회원가입 유효성 검사
function validateSignUp(signUpForm){
	console.log(signUpForm.email.value);
	
	//이메일 입력여부 검사
	if(!signUpForm.email.value){
		$("#email_check").text("이메일을 입력하세요");
		$("#email_check").css('color','red');
		signUpForm.email.focus();
		return false;  
	}

	//이름 입력여부 검사
	if(!signUpForm.name.value){
		$("#name_check").text("이름을 입력하세요");
		$("#name_check").css('color','red');
		signUpForm.name.focus();
		return false;
	}
	
	//생년월일 입력여부 검사
	if(!signUpForm.birth.value){
		$("#birth_check").text("생년월일을 입력하세요");
		$("#birth_check").css('color','red');
		signUpForm.birth.focus();
		return false;
	}
	
	//비밀번호 입력여부 검사
	if(!signUpForm.pw.value){
		$("#pw_check").text("비밀번호를 입력하세요");
		$("#pw_check").css('color','red');
		signUpForm.pw.focus();
		return false;
	}
	
	//비밀번호확인 입력여부 검사
	if(!signUpForm.pw2.value){
		$("#pw2_check").text("비밀번호를 다시 입력하세요");
		$("#pw2_check").css('color','red');
		signUpForm.pw2.focus();
		return false;
	}
	
	//체크박스 체크여부 검사
	if($("input:checkbox[name='agree']").is(":checked") == false){
		$("#checkbox_check").text("이용약관에 동의해주세요");
		$("#checkbox_check").css('color','red');
		return false;
	} else {
		$("#checkbox_check").text("");
	}
	signUpForm.action = "memberAdd.do?email="+signUpForm.email.value;
	signUpForm.submit();
}

//회원 정보수정(생년월일 수정)
function checkUpdateForm(updateForm){
	if(!updateForm.birth.value){
        $("#birth_check").text("수정할 생년월일 입력하세요");
        $("#birth_check").css('color','red');
        updateForm.birth.focus();
        return false;
    }
	if(!updateForm.pw.value){
		$("#pw_check").text("본인인증을 위해 비밀번호를 입력하세요");
		$("#pw_check").css('color','red');
		updateForm.pw.focus();
		return false;
	}
	
	confirm("회원정보를 수정하시겠습니까?")
	updateForm.action="memberUpdate.do"
	updateForm.submit();
}

//이메일 찾기 폼 유효성 검사
function chkFindEmailForm(findEmailForm){
	if(!findEmailForm.name.value){
		$("#chkName").text("이름을 입력하세요");
		$("#chkName").css('color','red');
		findEmailForm.name.focus();
		return false;
	}
	if(!findEmailForm.birth.value){
        $("#chkBirth").text("생년월일을 입력하세요");
        $("#chkBirth").css('color','red');
        findEmailForm.birth.focus();
        return false;
    }
	
	findEmailForm.action="findEmail.do"
	findEmailForm.submit();
}	

//비밀번호 찾기 폼 유효성 검사
function chkFindPwForm(findPwForm){
	if(!findPwForm.email.value){
		 $("#chkEmail").text("이메일을 입력하세요");
	     $("#chkEmail").css('color','red');
	     findPwForm.email.focus();
		 return false;
	}
	if(!findPwForm.birth.value){
		 $("#chkBirth").text("생년월일을 입력하세요");
	     $("#chkBirth").css('color','red');
	     findPwForm.birth.focus();
	     return false;
	}
	findPwForm.action = "findPw.do";
	findPwForm.submit();
}