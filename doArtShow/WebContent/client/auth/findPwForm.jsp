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
<form name="findPwForm">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" id="input_id"></td>
		</tr>
		<tr>
			<td colspan="2"><div id="chkId"></div></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email" id="input_email"></td>
		</tr>
		<tr>
			<td colspan="2"><div id="chkEmail"></div></td>
		</tr>
		<tr>
			<td><input type="button" value="인증번호 보내기" onclick="chkFindPwForm(this.form)"></td>
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
	$("#input_email").keyup(function(){
		if($("#input_email").val() != ""){
			$("#chkEmail").text("")
		}
	});
});
</script>
</body>
</html>