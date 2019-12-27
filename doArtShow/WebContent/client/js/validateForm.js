// 회원 로그인 유효성 검사
function validateLogin(loginForm){
    if(!loginForm.id.value){
        $("#chkId").text("아이디를 입력하세요");
        $("#chkId").css('color','red');
        loginForm.id.focus();
        return false;
    }
    if(!loginForm.pw.value){
        $("#chkPw").text("비밀번호를 입력하세요");
        $("#chkPw").css('color','red');
        loginForm.pw.focus();
        return false;
    }

    loginForm.action="memberLogIn.do"
    loginForm.submit();
}

//회원가입 유효성 검사
function validateSign(signUpForm){
	
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
	if(!signUpForm.name.value){
		$("#birth_check").text("이름을 입력하세요");
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
	if(!$("input:checkbox[name='agree']").is(":checked"))
		$("#checkbox_check").text("이용약관에 동의해주세요");
		$("#checkbox_check").css('color','red');
		return false;
	
	signUpForm.action = "memberAdd.do";
	signUpForm.submit();
}

//회원 정보수정(이름 수정)
function chkNameFn(updateNameForm){
	if(!updateNameForm.name.value){
        $("#chkName").text("수정할 이름을 입력하세요");
        $("#chkName").css('color','red');
        updateNameForm.name.focus();
        return false;
    }

	updateNameForm.action="memberUpdate.do"
	updateNameForm.submit();
}

//아이디 찾기 폼 유효성 검사
function chkFindIdForm(findIdForm){
	if(!findIdForm.email.value){
        $("#chkEmail").text("수정할 이메일을 입력하세요");
        $("#chkEmail").css('color','red');
        findIdForm.email.focus();
        return false;
    }
	if(!findIdForm.name.value){
		$("#chkName").text("수정할 이메일을 입력하세요");
		$("#chkName").css('color','red');
		findIdForm.name.focus();
		return false;
	}
	
	findIdForm.action="findId.do"
	findIdForm.submit();
}

//비밀번호 찾기 폼 유효성 검사
function chkFindPwForm(findPwForm){
	if(!findPwForm.email.value){
		 $("#chkEmail").text("수정할 이메일을 입력하세요");
	     $("#chkEmail").css('color','red');
	     findPwForm.email.focus();
		 return false;
	}
	if(!findPwForm.id.value){
		 $("#chkId").text("수정할 이메일을 입력하세요");
	     $("#chkId").css('color','red');
	     findPwForm.id.focus();
	     return false;
	}
	findPwForm.action = "findPw.do";
	findPwForm.submit();
}