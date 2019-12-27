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
<form>
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
			<input type="button" value="이메일 사용" id="emailUseBtn" onclick="javascript:self.close()"></td>
		</tr>
	</table>
</form>

</body>
</html>