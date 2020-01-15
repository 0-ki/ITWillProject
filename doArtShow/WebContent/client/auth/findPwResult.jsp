<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
<body>
<jsp:include page="../../module/2body_first.jsp"></jsp:include>
<div class="container" id="mainContainer">
	<div id="pDiv">
		<center>
			임시 비밀번호를 이메일로 보냈습니다.<br>
			임시비밀번호로 로그인 후 비밀번호를 수정해주세요.
		</center>
	</div>
	<div align="center" >
		<a class="btn" href="javascript:addFormLogin()">로그인 바로 하기</a>
		<a class="btn" href="<%=request.getContextPath()%>/index.jsp">메인화면 바로가기</a>
	</div>
</div>
<jsp:include page="../../module/3body_last.html"></jsp:include>
</body>
</html>