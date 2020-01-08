<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
<body>
<jsp:include page="../../module/2body_first.jsp"></jsp:include>
<div class="container" id="mainContainer">
	<form name="findEmailForm" method="post">
        <table align="center">
        	<tr>
        		<td id="formTitle" colspan="2">이메일 찾기</td>
        	</tr>
        	<tr>
                <td class="check_tr" colspan="2"></td>
            </tr>
            <tr>
                <th><label class="tableLabel">이름</label></th>
                <td><input class="form-control" type="text" name="name" id="input_name" placeholder="이름"></td>
            </tr>
            <tr>
            	<td></td>
                <td class="check_tr"><div id="chkName"></div></td>
            </tr>
            <tr>
                <th><label class="tableLabel">생년월일</label></td>
                <td><input class="form-control" type="text" name="birth" id="input_birth" 
                placeholder="생년월일(8자리)" maxlength="10"></td>
            </tr>
            <tr>
            	<td></td>
                <td class="check_tr" colspan="2"><div id="chkBirth"></div></td>
            </tr>
            <tr colspan="2">
                <td><input class="btn" type="button" value="다음" onclick="chkFindEmailForm(this.form)"></td>
            </tr>
        </table>
    </form>
</div>
<jsp:include page="../../module/3body_last.html"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	$("#input_birth").keyup(function(){
		if($("#input_birth").val() != ""){
			$("#chkBirth").text("")
		}
	});
	$("#input_name").keyup(function(){
		if($("#input_name").val() != ""){
			$("#chkName").text("")
		}
	});
});
function autoHyphen(obj){
	var number = obj.value.trim().replace(/[^0-9]/g, "");
	var birth = "";
	
	if(number.length<4){
		return number;
		
	} else if(number.length < 6){
		birth += number.substr(0,4);
		birth += "-";
		birth += number.substr(4);
		
	} else  if(number.length < 7){
		birth += number.substr(0,4);
		birth += "-";
		birth += number.substr(4,6);
		birth += "-";
		birth += number.substr(6);
		
	} else  if(number.length < 8){
		birth += number.substr(0,4);
		birth += "-";
		birth += number.substr(4,6);
		birth += "-";
		birth += number.substr(6);
		
	} else {
		birth += number.substr(0,4);
		birth += "-";
		birth += number.substr(4,6);
		birth += "-";
		birth += number.substr(6);
	}
	obj.value = birth;
}


</script>
</body>
</html>