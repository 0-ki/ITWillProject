<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지</title>
</head>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
<body>
<jsp:include page="../../module/2body_first.jsp"></jsp:include>
<br>
<h2>회원가입</h2>
	<form method="post" name="signUpForm">
    	<table>
    	 		<tr>
	                <td>이메일</td>
	                <td><input type="text" name="email" id="input_email"></td>
 	                <td><input type="button" id="emailChkButton" value="중복확인" onclick="emailChkModal(document.signUpForm.email.value)"></td>
 	            </tr>
	            <tr>
	                <td colspan="3"><div id="email_check"></div></td>
	            </tr>
	            <tr>
	                <td>이름</td>
	                <td>
	                    <input type="text" name="name" id="input_name">
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2"><div id="name_check"></div></td>
	            </tr>
	            <tr>
	                <td>생년월일</td>
	                <td>
	                    <input type="text" name="birth" id="input_birth" placeholder="0000-00-00">
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2"><div id="birth_check"></div></td>
	            </tr>
	            <tr>
	                <td>성별</td>
	                <td>
	                    <input type="radio" name="gender" id="male" value="남성">남
	                	<input type="radio" name="gender" id="female" checked="checked" value="여성">여
	                </td>
	            </tr>
	            <tr>
	                <td>비밀번호</td>
	                <td><input type="password" name="pw" id="input_pw"></td>
	            </tr>
	            <tr>
	                <td colspan="2"><div  id="pw_check"></div></td>
	            </tr>
	            <tr>
	                <td>비밀번호 확인</td>
	                <td><input type="password" name="pw2" id="input_pw2"></td>
	            </tr>
	            <tr>
	                <td colspan="2"><div id="pw2_check"></div></td>
	            </tr>
	            <tr>
	                <td colspan="2">
	                    <input type="checkbox" id="agreeAll">모두 동의합니다.
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2">개인정보 수집 / 이용 동의(필수)</td>
	            </tr>
	            <tr>
	                <td colspan="2">
	                    <iframe width="" src="../etc/constraint1.html"></iframe>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2">
	                    <input type="checkbox" name="agree">위의 이용 약관에 동의합니다.
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2">이용 약관 동의(필수)</td>
	            </tr>
	            <tr>
	                <td colspan="2">
	                    <iframe width="" src="../etc/constraint2.html"></iframe>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2">
	                    <input type="checkbox" name="agree">위의 이용 약관에 동의합니다.
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <input type="button" value="회원가입" id="submitBtn" onclick="javascript:validateSignUp(this.form)">
	                </td>
	                <td>
	                	<div id="checkbox_check"></div>
	                </td>
	            </tr>
		</table>
	</form>
	<jsp:include page="../../module/3body_last.html"></jsp:include>
	<script type="text/javascript">
	
	</script>
    <script>
        $(document).ready(function(){
            $("#agreeAll").click(function(){
                if($("#agreeAll").prop("checked")){
                    $("input[name=agree]").prop("checked", true);
                }
                else {
                    $("input[name=agree]").prop("checked",false);
                }
            }); 
        });
        
    </script>
</body>
</html>