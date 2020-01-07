<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
<body>
<jsp:include page="../../module/2body_first.jsp"></jsp:include>

<!-- 가입되어있는 이메일이 없는 경우 -->
<c:if test="${empty sessionScope.email}">
<div class="container" id="mainContainer">
<div id="pDiv"><center>가입되어 있는 이메일이 없습니다</center></div>
<div align="center" >
	<a class="btn" href="javascript:addFormLogin()">다시 로그인 하기</a>
	<a class="btn" href="<%=request.getContextPath()%>/client/auth/findEmail.do">이메일 찾기</a>
</div>
</div>
</c:if>

<!-- 가입되어있는 이메일이 있는 경우 -->
<c:if test="${!empty sessionScope.email}">
<div class="container border" id="mainContainer">
<div style="margin-top:15%; margin-bottom:50px; font-size:1.8em;"><center>회원님의 이메일은 <b>${email }</b>입니다.</center></div>
<div align="center" >
	<a class="btn" href="javascript:addFormLogin()">다시 로그인 하기</a>
	<a class="btn" href="<%=request.getContextPath()%>/client/auth/findPw.do">비밀번호 찾기</a>
</div>
</div>
</c:if>
<jsp:include page="../../module/3body_last.html"></jsp:include>
</body>
</html>