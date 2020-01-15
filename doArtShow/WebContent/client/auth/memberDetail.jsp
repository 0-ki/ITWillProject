<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>

<body>

    <jsp:include page="../../module/2body_first.jsp"></jsp:include>

    <c:if test="${!empty sessionScope.member}">
        <div class="container" id="mainContainer">
            <form method="post" name="updateForm" id="updateForm">
                <table align="center">
                    <tr>
                        <td id="formTitle" colspan="3">회원정보수정</td>
                        <td>
                            <a href="<%=request.getContextPath()%>/client/auth/memberDelete.jsp"
                                style="color:gray; font-size:0.8em">탈퇴하기</a>
                        </td>
                    </tr>
                    <tr>
                        <td class="check_tr" colspan="3"></td>
                    </tr>
                    <tr>
                        <th><label class="tableLabel">이메일</label></th>
                        <td>${member.email}</td>
                    </tr>
                    <tr>
                        <td class="check_tr" colspan="3">
                            <div></div>
                        </td>
                    </tr>
                    <tr>
                        <th><label class="tableLabel">이름</label></th>
                        <td>${member.name}</td>
                    </tr>

                    <tr>
                        <td class="check_tr" colspan="3">
                            <div></div>
                        </td>
                    </tr>
                    <tr>
                        <th><label class="tableLabel">비밀번호</label></th>
                        <td><input class="form-control" type="password" value="${member.pw}" name="pw" id="input_pw">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="check_tr" colspan="2">
                            <div id="pw_check"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><label class="tableLabel">생년월일</label></th>
                        <td><input class="form-control" type="text" value="${member.birth}" name="birth"
                                id="input_birth" placeholder="생년월일(8자리)"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="check_tr" colspan="2">
                            <div id="birth_check"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><label class="tableLabel">성별</label></th>
                        <td>
                            <input class="form-check-input" type="radio" name="gender" id="male" value="남성" <c:if
                                test="${member.gender eq '남성'}">checked="checked"
    </c:if>>남성
    <input class="form-check-input" type="radio" name="gender" id="female" value="여성" <c:if
        test="${member.gender eq '여성'}">checked="checked"</c:if>>여성
    </td>
    </tr>
    <tr>
        <td class="check_tr" colspan="3">
            <div></div>
        </td>
    </tr>
    <tr>
        <th><label class="tableLabel">프로필 사진</label></th>
        <td>
            <a href="javascript:profileImgUpdate();">
                <img src="../../memberProfileImages/${member.profileImg}" width="120px" height="120px">
            </a>
        </td>
    </tr>
    <tr>
        <td class="check_tr" colspan="3">
            <div></div>
        </td>
    </tr>
    <tr>
        <td class="check_tr" colspan="3">
            <input class="btn" type="button" onclick="checkUpdateForm(this.form)" value="수정">
        </td>
    </tr>
    </table>
    </form>
    </div>
    </c:if>
    <c:if test="${empty sessionScope.member}">
        <jsp:include page="askLogIn.jsp"></jsp:include>
    </c:if>
    <jsp:include page="../../module/3body_last.html"></jsp:include>
</body>

</html>