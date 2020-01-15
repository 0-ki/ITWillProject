<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
<script>
//--------------------------------------------------------------------------------
//	memberDetail.jsp	회원정보 수정 유효성 검사
//--------------------------------------------------------------------------------
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
		var filter = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
		if(filter.test(pw)){
			$("#pw_check").text("");
			$("#pwSubmitBtn").attr("disabled", false);
		} else {
			$("#pw_check").text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			$("#pw_check").css('color','red');
			$("#pwSubmitBtn").attr("disabled", true);
		}			
	});
	
	//비밀번호 확인이 이전 비밀번호와 일치하는지 검사
	$("#input_pw2").blur(function(){
		var pw = $("#input_pw").val();
		var pw2 = $("#input_pw2").val();
		if(pw2 != pw){
			$("#pw2_check").text("비밀번호가 일치하지 않습니다.");
			$("#pw2_check").css('color','red');
			$("#submitBtn").attr("disabled", true);
		} else {
			$("#pw2_check").text("");
			$("#submitBtn").attr("disabled", false);
		}
	});
});

</script>
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
                        <td><input class="form-control" type="password" name="pw" id="input_pw">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="check_tr" colspan="2">
                            <div id="pw_check"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><label class="tableLabel">비밀번호 확인</label></th>
                        <td><input class="form-control" type="password" name="pw2" id="input_pw2">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="check_tr" colspan="2">
                            <div id="pw2_check"></div>
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
                <img src="../../memberProfileImages/${member.profileImg}" alt="${member.profileImg}" width="120px" height="120px">
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
            <input class="btn" type="button" onclick="javascript:history.go(-1)" value="취소">
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