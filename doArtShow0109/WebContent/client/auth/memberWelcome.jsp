<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>

<body>
    <jsp:include page="../../module/2body_first.jsp"></jsp:include>
    <div class="container" id="mainContainer">
        <div id="pDiv">
            <center>
                가입을 축하드립니다. 로그인을 해주세요!
            </center>
        </div>
        <div align="center">
            <a class="btn" href="javascript:addFormLogin();" style="color: white;">로그인 하러 가기</a>
            <a class="btn" href="<%=request.getContextPath()%>/index.jsp" style="color: white;">메인화면으로 가기</a>
        </div>
    </div>
    <jsp:include page="../../module/3body_last.html"></jsp:include>
</body>

</html>