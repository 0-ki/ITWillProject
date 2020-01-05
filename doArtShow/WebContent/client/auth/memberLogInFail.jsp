<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
<body>
<jsp:include page="../../module/2body_first.jsp"></jsp:include>
<div class="container p-3" style="padding-top:50px; text-align: center; height:700px;">
        <h3>가입하지 않은 이메일이거나, 잘못된 비밀번호입니다.</h3>
        <br>
        <a class="btn btn-light" href="findEmail.do">이메일 찾기</a>&nbsp;
        <a class="btn btn-light" href="findPw.do">비밀번호 찾기</a>&nbsp;
        <a class="btn btn-light" href="memberAdd.do">회원가입</a>&nbsp;
</div>
<jsp:include page="../../module/3body_last.html"></jsp:include>	
</body>
</html>