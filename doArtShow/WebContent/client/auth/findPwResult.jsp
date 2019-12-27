<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
</head>
<body>
<c:if test="${empty sessionScope.pw}">
아이디가 없습니다
</c:if>
<c:if test="${!empty sessionScope.pw}">
아이디 : ${pw}
</c:if>
</body>
</html>