<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/validate.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<title>나의 계정 페이지</title>
</head>
<body>
<c:if test="${!empty sessionScope.member}">
<h1>내계정</h1>
<table>
	<tr>
		<td>id</td>
		<td>${member.id}</td>
		<td><a href="memberLogOut.do">로그아웃</a></td>
	</tr>
	<tr>
		<td>name</td>
		<form method="post" name="updateNameForm">
		<td><input type="text" value="${member.name}" name="name" id="input_name"></td>
		<!-- <td><input type="submit" id="nameSubmitBtn" value="수정"></td> -->
		<td><input type="button" onclick="chkNameFn(this.form)"id="nameSubmitBtn" value="수정"></td>
		</form>
	</tr>
	<tr>
		<td><div id="chkName"></div></td>
	</tr>
	<tr>
		<td>email</td>
		<form  action="memberUpdate.do" method="post" name="updateEmailForm">
		<td><input type="text" value="${member.email}" name="email" id="input_email"></td>
		<td><input type="submit" id="emailSubmitBtn" value="수정"></td>
		</form>
	</tr>
	<tr>
		<td><div id="chkEmail"></div></td>
	</tr>
	<tr>
		<td>가보고 싶은 전시</td>
	</tr>
	<tr>
		<td colspan="3">
			<jsp:include page="/client/auth/wishList.jsp"/>
		</td>
	</tr>
	<tr>
		<td>가본 전시</td>
	</tr>
	<tr>
		<td colspan="3">
			<jsp:include  page="/client/auth/visitList.jsp"/>
		</td>
	</tr>
	<tr>
		<td colspan="3"><a href="">탈퇴하기</a></td>
	</tr>
</table>
</c:if>
<c:if test="${empty sessionScope.member}">
로그인이 필요한 페이지 입니다. 로그인해주세요
<a href="memberLogIn.do">로그인 하러 가기</a>
</c:if>
<script type="text/javascript">
$(document).ready(function(){
	//이름칸에 입력을하고 나면 알림 부분을 비워준다.
	$("#input_name").keyup(function(){
		if($("#input_name").val() != null){
			$("#chkName").text("")
		}
	});
	
	//이메일 유효검사
	$("#input_email").keyup(function(){
		var email = $("#input_email").val();
		var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if(filter.test(email)){
			$("#chkEmail").text("");
			$("#emailSubmitBtn").attr("disabled", false);
		} else {
			$("#chkEmail").text("이메일 형식에 맞게 작성해주세요. 예시)123@art.com");
			$("#chkEmail").css('color','red');
			$("#emailSubmitBtn").attr("disabled", true);
		}
	});
});
</script>
</body>
</html>