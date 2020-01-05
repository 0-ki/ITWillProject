<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
</head>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
<body>
<jsp:include page="../../module/2body_first.jsp"></jsp:include>
<p>임시 비밀번호를 이메일로 보냈습니다. 임시비밀번호로 로그인 후 비밀번호를 수정해주세요.
<a href="<%=request.getContextPath()%>/client/auth/memberLogInForm.jsp">로그인 바로가기</a>&nbsp;
<a href="<%=request.getContextPath()%>/index.jsp">메인화면 바로가기</a>
<jsp:include page="../../module/3body_last.html"></jsp:include>
</body>
</html>