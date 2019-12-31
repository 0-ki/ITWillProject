<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 계정 페이지</title>
</head>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
<body>
<jsp:include page="../../module/2body_first.jsp"></jsp:include>
<br>
<c:if test="${!empty sessionScope.member}">
<h1>내계정</h1>
<table>
	<tr>
		<td>이메일</td>
		<td>${member.email}</td>
		<td><a href="memberLogOut.do">로그아웃</a></td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${member.name}</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<form method="post" name="updateBirthForm">
		<td><input type="text" value="${member.birth}" name="birth" id="input_birth" placeholder="0000-00-00"></td>
		<td><input type="button" onclick="chkBirthFn(this.form)"id="birthSubmitBtn" value="수정"></td>
		</form>
	</tr>
	<tr>
		<td><div id="birth_check"></div></td>
	</tr>
	<tr>
		<td>성별</td>
		<form method="post" name="updateGenderForm" action ="memberUpdate.do">
		<td>
			<input type="radio" name="gender" id="male"   value="남성" <c:if test="${member.gender eq '남성'}">checked="checked"</c:if>>남성
			<input type="radio" name="gender" id="female" value="여성" <c:if test="${member.gender eq '여성'}">checked="checked"</c:if>>여성
		</td>
		<td><input type="submit" value="수정"></td>
		</form>
	</tr>
	<tr>
		<td>비밀번호</td>
		<form method="post" name="updatePwForm">
		<td><input type="text" value="${member.pw}" name="pw" id="input_pw"></td>
		<td><input type="button" onclick="chkPwFn(this.form)"id="pwSubmitBtn" value="수정"></td>
		</form>
	</tr>
	<tr>
		<td><div id="pw_check"></div></td>
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
<jsp:include page="../../module/3body_last.html"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	//생년월일 입력을하고 나면 알림 부분을 비워준다.
	$("#input_birth").keyup(function(){
		if($("#input_birth").val() != null){
			$("#birth_check").text("")
		}
	});
	
	//비밀번호 입력을하고 나면 알림 부분을 비워준다.	
	$("#input_pw").keyup(function(){
		if($("#input_pw").val() != null){
			$("#pw_check").text("")
		}
	});
	
	//생년월일 유효성검사
	$("#input_birth").blur(function(){
		var birth = $("#input_birth").val();
		var filter =  /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		if(filter.test(birth)){
			$("#birth_check").text("");
			$("#birthSubmitBtn").attr("disabled", false);
		} else {
			
			$("#birth_check").text("생년월일 8자리를 입력해주세요.");
			$("#birth_check").css('color','red');
			$("#birthSubmitBtn").attr("disabled", true);
		}					
	});

	//비밀번호 유효검사
	$("#input_pw").blur(function(){
		var pw = $("#input_pw").val();
		var filter = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		if(filter.test(pw)){
			$("#pw_check").text("");
			$("#pwSubmitBtn").attr("disabled", false);
		} else {
			$("#pw_check").text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			$("#pw_check").css('color','red');
			$("#pwSubmitBtn").attr("disabled", true);
		}			
	});
});
</script>
</body>
</html>