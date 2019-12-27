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
	<form method="post" name="loginForm">
		<table>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email" id="input_email"></td>
		</tr>
		<tr>
			<td colspan="2"><div id="chkEmail"></div></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw" id="input_pw"></td>
		</tr>
		<tr>
			<td><a href="findEmail.do">이메일 찾기</a></td>
			<td><a href="findPw.do">비밀번호 찾기</a></td>
		</tr>
		<tr>
			<td colspan="2"><div id="chkPw"></div></td>
		</tr>
		<tr>
			<td><input type="button" id="submitBtn" value="로그인" onclick="validateLogin(this.form)"></td>
		</tr>
		</table>
	</form>
<script type="text/javascript">
$(document).ready(function(){
	$("#input_email").keyup(function(){
		if($("#input_email").val() != ""){
			$("#chkEmail").text("")
		}
	});
	$("#input_pw").keyup(function(){
		if($("#input_pw").val() != ""){
			$("#chkPw").text("")
		}
	});
});
</script>
</body>
</html>