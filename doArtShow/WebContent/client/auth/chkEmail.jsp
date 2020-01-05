<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="../js/checkEmail.js"></script>
<title>이메일 중복확인</title>
</head>
<body>
<form name="emailChkForm">
    <table>
	    <tr>
			<td>이메일</td>
	    	<td><input type="text" name="email" id="email_value" value="<%= request.getParameter("email")%>"></td>
	        <td><input type="button" id="emailChkModalBtn" value="중복확인"></td>	                
		</tr>
		<tr>
	        <td colspan="3"><div id="email_result"></div></td>
	   </tr>
		<tr>
			<td>
			<input type="button" value="이메일 사용" id="emailUseBtn" onclick="setId()"></td>
		</tr>
	</table>
</form>
<script language="javascript">
$(document).ready(function(){
	$("#emailUseBtn").attr("disabled", true);
    $("#emailChkModalBtn").click(function(){
        	$("#emailUseBtn").attr("disabled", false);
        	$("#submitBtn").attr("disabled", true);
    });
});
function setId(){
	opener.document.signUpForm.email.value=document.emailChkForm.email.value;
	$("#submitBtn").attr("disabled", false);
	self.close();
}
</script>
</body>
</html>