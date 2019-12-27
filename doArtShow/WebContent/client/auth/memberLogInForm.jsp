<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/validate.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" name="loginForm">
		<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" id="input_id"></td>
		</tr>
		<tr>
			<td colspan="2"><div id="chkId"></div></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw" id="input_pw"></td>
		</tr>
		<tr>
			<td><a href="findId.jsp">아이디 찾기</a></td>
			<td><a href="findPw.jsp">비밀번호 찾기</a></td>
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
	$("#input_id").keyup(function(){
		if($("#input_id").val() != ""){
			$("#chkId").text("")
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