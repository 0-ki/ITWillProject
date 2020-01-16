<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>

<body>
    <jsp:include page="../../module/2body_first.jsp"></jsp:include>
    <div class="container" id="mainContainer">
        <div id="pDiv">
            <center>
                가입하지 않은 이메일이거나, 잘못된 비밀번호입니다.
            </center>
        </div>
        <div align="center">
            <a class="btn" href="<%=request.getContextPath()%>/client/auth/findEmail.do">이메일 찾기</a>
            <a class="btn" href="<%=request.getContextPath()%>/client/auth/findPw.do">비밀번호 찾기</a>
            <a class="btn" href="<%=request.getContextPath()%>/client/auth/memberAdd.do">회원가입</a>
        </div>
    </div>
    <jsp:include page="../../module/3body_last.html"></jsp:include>
</body>

</html>