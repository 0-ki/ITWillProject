<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/validate.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<form name="findIdForm" method="post">
	<table>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email" id="input_email"></td>
		</tr>
		<tr>
			<td colspan="2"><div id="chkEmail"></div></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" id="input_name"></td>
		</tr>
		<tr>
			<td colspan="2"><div id="chkName"></div></td>
		</tr>
		<tr>
			<td><input type="button" value="다음" onclick="chkFindIdForm(this.form)"></td>
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
	$("#input_name").keyup(function(){
		if($("#input_name").val() != ""){
			$("#chkName").text("")
		}
	});
});
</script>
</body>
</html>