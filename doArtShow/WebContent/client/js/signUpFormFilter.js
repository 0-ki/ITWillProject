//회원가입 폼 유효성 검사
$(document).ready(function(){
	
	//이메일 유효검사
	$("#input_email").blur(function(){
		var email = $("#input_email").val();
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if(filter.test(email)){
			$("#email_check").text("");
			$("#emailChkButton").attr("disabled", false);
			$("#submitBtn").attr("disabled", false);
		} else {
			$("#email_check").text("이메일 형식에 맞게 작성해주세요. 예시)123@art.com");
			$("#email_check").css('color','red');
			$("#emailChkButton").attr("disabled", true);
			$("#submitBtn").attr("disabled", true);
		}
//		if($("#input_email").is('[readonly]')){
//			$("#submitBtn").attr("disabled", false);
//		} else {
//			alert("이메일 중복확인을 해주세요");
//			$("#submitBtn").attr("disabled", true);
//		}
	});
	
	//이름 유효검사(특수문자가 있을 경우 다시입력)
	$("#input_name").blur(function(){
		var name = $("#input_name").val();
		var filter = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		console.log(filter.test(name));
		if(filter.test(name)){
			$("#name_check").text("특수문자를 사용하지 마세요.");
			$("#name_check").css('color','red');
			$("#submitBtn").attr("disabled", false);
		} else {
			$("#name_check").text("");
			$("#submitBtn").attr("disabled", true);
		}					
	});
	
	//생년월일 유효검사(숫자가 아닐 경우  다시입력)
	$("#input_birth").blur(function(){
		var birth = $("#input_birth").val();
		var filter =  /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		if(filter.test(birth)){
			$("#birth_check").text(" ");
			$("#submitBtn").attr("disabled", false);
		} else {
			
			$("#birth_check").text("생년월일 8자리를 입력해주세요.");
			$("#birth_check").css('color','red');
			$("#submitBtn").attr("disabled", true);
		}					
	});
	
	//비밀번호 유효검사
	$("#input_pw").blur(function(){
		var pw = $("#input_pw").val();
		var filter = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
		if(filter.test(pw)){
			$("#pw_check").text("");
			$("#submitBtn").attr("disabled", false);
		} else {
			$("#pw_check").text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			$("#pw_check").css('color','red');
			$("#submitBtn").attr("disabled", true);
		}			
	});
	
	
	//비밀번호 확인이 이전 비밀번호와 일치하는지 검사
	$("#input_pw2").blur(function(){
		var pw = $("#input_pw").val();
		var pw2 = $("#input_pw2").val();
		if(pw2 != pw){
			$("#pw2_check").text("비밀번호가 일치하지 않습니다.");
			$("#pw2_check").css('color','red');
			$("#submitBtn").attr("disabled", true);
		} else {
			$("#pw2_check").text("");
			$("#submitBtn").attr("disabled", false);
		}
	});
});
