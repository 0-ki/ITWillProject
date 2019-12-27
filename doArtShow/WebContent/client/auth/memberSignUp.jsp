<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="../js/checkForm.js"></script>
<script src="../js/validateForm.js"></script>
<script type="text/javascript"></script>
<script>
function emailChkModal()
{
	if($("#input_email").val()==""){
		$("#email_check").text("아이디를 입력하세요");
		$("#email_check").css('color','red');
		$("#emailChkButton").attr("disabled", true);
		return;
	} else {
		url = "chkEmail.jsp?email=" + document.signUpForm.email.value;
		
		window.open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=500, height=200");	
		$("#input_email").attr("disabled", true);
		$("#emailChkButton").attr("disabled", true);
	}
} 
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SignUpForm</title>
</head>
<body>
<h2>회원가입</h2>
	<form method="post" name="signUpForm">
    	<table>
    	 		<tr>
	                <td>이메일</td>
	                <td><input type="text" name="email" id="input_email" value=""></td>
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
	                    <input type="button" value="회원가입" id="submitBtn" onclick="validateSign(this.form)">
	                </td>
	                <td>
	                	<div id="checkbox_check"></div>
	                </td>
	            </tr>
		</table>
	</form>
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
            $("#input_id").keyup(function(){
                if($("#input_id").val()!=""){
                	$("#id_check").text("");
                	$("#idChkButton").attr("disabled", false);
                }
            });
            
        });
        
    </script>
</body>
</html>