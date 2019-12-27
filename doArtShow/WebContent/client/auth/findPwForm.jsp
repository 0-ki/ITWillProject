<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/validateForm.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" name="findPwForm">
	<table>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email" id="input_email"></td>
		</tr>
		<tr>
			<td colspan="2"><div id="email_check"></div></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text" name="birth" id="input_birth" placeholder="0000-00-00"></td>
		</tr>
		<tr>
			<td colspan="2"><div id="birth_check"></div></td>
		</tr>
		<tr>
			<td><input type="button" id="findPwBtn" value="인증번호 보내기" onclick="chkFindPwForm(this.form)"></td>
		</tr>
	</table>
</form>
<script type="text/javascript">
$(document).ready(function(){ 
	$("#input_email").keyup(function(){
		if($("#input_email").val() != ""){
			$("#email_check").text("")
		}
		var email = $("#input_email").val();
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if(filter.test(email)){
			$("#email_check").text("");
			$("#findPwBtn").attr("disabled", false);
		} else {
			$("#email_check").text("이메일 형식에 맞게 작성해주세요. 예시)123@art.com");
			$("#email_check").css('color','red');
			$("#findPwBtn").attr("disabled", true);
		}
	});
	$("#input_birth").keyup(function(){
		if($("#input_birth").val() != ""){
			$("#chkBirth").text("")
		}
		var birth = $("#input_birth").val();
		var filter =  /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		if(filter.test(birth)){
			$("#birth_check").text(" ");
			$("#findPwBtn").attr("disabled", false);
		} else {
			
			$("#birth_check").text("생년월일 8자리를 입력해주세요.");
			$("#birth_check").css('color','red');
			$("#findPwBtn").attr("disabled", true);
		}
	});
});
</script>
</body>
</html>