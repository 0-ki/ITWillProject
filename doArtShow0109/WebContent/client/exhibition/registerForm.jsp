<%@page import="java.text.SimpleDateFormat" %> 
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<jsp:include page="/module/1doctype_head.jsp"></jsp:include>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8"); 
/*
String memberID="";
try {
	member=(String)session.getAttribute("member");
	//세션값이 없으면 정상적으로 로그인을 하지 않은 경우이므로 쫓아낸다. 
	if(managerId==null || managerId.equals("")) {
		response.sendRedirect("../logon/memberLoginForm.jsp");
	}else{
		//정상적으로 로그인하고 들어온경우는 페이지를 보여준다. 
	}
*/
%>
 
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../js/jquery-3.4.1.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/exhFunction.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=c5326277ad64b2569191adafedd5fbbc&libraries=services"></script>
	<title>㈜ 전시해 - 전시회 등록</title> 
</head>	-->
<style>
.updateForm1{
display: inline-block;
}
</style>
<body>
<jsp:include page="/module/2body_first.jsp"></jsp:include>
<c:if test="${!empty sessionScope.member}">
<%	Date nowTime = new Date();
	//SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
	SimpleDateFormat sf = new SimpleDateFormat("yyMMdd");
	SimpleDateFormat year = new SimpleDateFormat("yyyy");
	SimpleDateFormat month = new SimpleDateFormat("MM");
	SimpleDateFormat day = new SimpleDateFormat("dd");
%> 
    <div class="container">
        <!--  <h3 style ="width:100%; text-align:center">(주) 전시해</h3> -->
        <h3 style ="width:100%; border-bottom:2px; solid #000; padding-bottom:14px;">전시회 등록하기</h3>
        <form action="add.do" method="post" enctype="multipart/form-data" name="exhRegisterForm">   
            <table class="table nanum table-hover" >
				<colgroup>
					<col class="col-sm-1">
					<col class="col-sm-3">
				</colgroup>
				<tbody>
                <tr>
                    <th>*분류</th>
                    <td>
                        <select name="exhGubun1" id="exhGubun1" required>
                            <option value="">전시회 분류를 선택하세요</option>
                            <option value="개인전">개인전</option>
                            <option value="단체전">단체전</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>
                        <label for="">*신청자</label>
                    </th>
                    <td><input type="text" class="updateForm" name="memberID" id="memberID" value="${memberID }" readonly></td>
                </tr>
                <tr>
                    <th>
                        <label for="">*장르</label>
                    </th>
                    <td>          
                        <select name="exhGubun2" required>
                            <option value="">				장르를 선택하세요</option>
                            <option value="서양화">		서양화</option>
                            <option value="동양화">		동양화</option>
                            <option value="유화">			유화</option>
                            <option value="조각">			조각</option>
                            <option value="설치미술">	설치미술</option>
                            <option value="미디어아트">	미디어아트</option>
                            <option value="사진">			사진</option>
                            <option value="디자인">		디자인</option>
                            <option value="공예">			공예</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <th><label for="">*태그</label>
                    <p style="font-size:14px; line-height:22px; letter-spacing:-0.6px; font-weight:300;">(최대 3개 선택)</p></th>
                    <td>
                       <label for="exhGubun31" style="font-weight:300;">
                       <input class="updateForm1" name="exhGubun3" id="exhGubun31" type="checkbox" value="데이트" >
                       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                       #데이트
                       </label><br>
                       <label for="exhGubun32" style="font-weight:300;">
                       <input class="updateForm1" name="exhGubun3" id="exhGubun32" type="checkbox" value="인생샷" >
                       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                       #인생샷
                       </label><br> 
                       <label for="exhGubun33" style="font-weight:300;">
                       <input class="updateForm1" name="exhGubun3" id="exhGubun33" type="checkbox" value="친구와함께" >
                       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                       #친구와함께             
                       </label><br> 
                       <label for="exhGubun34" style="font-weight:300;">
                       <input class="updateForm1" name="exhGubun3" id="exhGubun34" type="checkbox" value="나혼자문화생활" >
                       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                       #나혼자문화생활  
                       </label><br> 
                       <label for="exhGubun35" style="font-weight:300;">     
                       <input class="updateForm1" name="exhGubun3" id="exhGubun35" type="checkbox" value="부모님과함께" >
                       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                       #부모님과함께 
                       </label><br> 
                       <label for="exhGubun36" style="font-weight:300;">     
                       <input class="updateForm1" name="exhGubun3" id="exhGubun36" type="checkbox" value="아이와함께" >
                       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                       #아이와함께 
                       </label><br> 
                       <label for="exhGubun37" style="font-weight:300;">      
                       <input class="updateForm1" name="exhGubun3" id="exhGubun37" type="checkbox" value="교육전시" >
                       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                       #교육전시   
                       </label><br> 
                    </td>   
                </tr>
                <tr>
                    <th><label for="">*전시회명</label></th>
                    <td><input type="text" class="updateForm" name="exhName" id="exhName" placeholder="필수입력사항"></td>
                </tr>
                <tr>
              <tr>
                    <th><label for="">*작가명</label></th>
                    <td><input type="text" class="updateForm" name="artistName" id="artistName" placeholder="필수입력사항"></td>
                </tr>
                <tr>                
                    <th>	<label for="">작가정보</label>
                    		<p style="font-size:14px; line-height:22px; letter-spacing:-0.6px; font-weight:300;">작가 정보<br/>(전시,수상이력 등)를<br/>입력해주세요</p>
                    </th>
                    <td><textarea name="artistInfo" id="artistInfo" cols="40" rows="15" style="width:100%; height:250px;"></textarea></td>
                </tr>
                <tr>
                	<th>	<label for="">전시내용</label>
                			<p style="font-size:14px; line-height:22px; letter-spacing:-0.6px; font-weight:300;">텍스트, 평론</p>	
                	</th>
                    <td><textarea name="exhContent" id="exhContent" cols="40" rows="15" style="width:100%; height:250px;"></textarea></td>
                </tr>
                <tr>
                	<!--  전시관 주소 등록 기능 To be required -->
                	<th>*전시관</th>
                	<td>
                		<input type="text" class="updateForm" name="exhPlace" id="exhPlace" placeholder="필수입력사항">
                	</td>
                </tr>
                <tr>
                        <th>*전시관 주소</th>
                        <td>
               			<input type="text" class="updateForm" id="exhPlaceAddr1" name="exhPlaceAddr1" id="exhPlaceAddr1" placeholder="주소" style="width:90%;" readOnly onclick="sample6_execDaumPostcode_1()"> 
                		<input type="button" class="updateForm" onclick="sample6_execDaumPostcode_1()" value="주소 검색" style="width:9%;"><br> 
						<!--  <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>-->
						<!-- <input type="button" onclick="execDaumPostcode()" value="주소 검색" style="width:9%;"><br> 
						<div id="conDiv" style="border:1px solid;width:500px;height:300px;margin:0 0;padding:0 0;position:relative"></div> -->   
						</td>
				</tr>
				
				<!-- ### 아트맵에서 퍼옴-->
				
				<style>
				.my_layer_span { margin-top:15px; display:inline-block; text-align:center; width:33%; padding:5px 15px; font-size:13px; line-height:24px; letter-spacing:-0.64px; cursor:pointer; }
				</style>
				
				<tr id="museum_tr" >
				<th></th> 
				<td colspan="3">
					<div style="width:100%; height:150px; border:1px solid #c8c8c8; overflow:auto;" id="m_list">
						<span onclick="chk_museum('1','대백프라자갤러리/대구')" class="my_layer_span" style='width:20%;'>대백프라자갤러리/대구</span>
						<span onclick="chk_museum('1','대백프라자갤러리/대구')" class="my_layer_span">대구</span>
						<span onclick="chk_museum('1','대백프라자갤러리/대구')" class="my_layer_span" style='width:40%;'>대구 중구 대봉동 214 대백프라자 12층</span>
												<span onclick="chk_museum('2','경북대학교박물관/대구')" class="my_layer_span" style='width:20%;'>경북대학교박물관/대구</span>
						<span onclick="chk_museum('2','경북대학교박물관/대구')" class="my_layer_span">대구</span>
						<span onclick="chk_museum('2','경북대학교박물관/대구')" class="my_layer_span" style='width:40%;'>대구 북구 산격동 1370-1</span>
												<span onclick="chk_museum('3','국립대구박물관/대구')" class="my_layer_span" style='width:20%;'>국립대구박물관/대구</span>
						<span onclick="chk_museum('3','국립대구박물관/대구')" class="my_layer_span">대구</span>
						<span onclick="chk_museum('3','국립대구박물관/대구')" class="my_layer_span" style='width:40%;'>대구 수성구 황금동 70</span>
												<span onclick="chk_museum('4','삼성미술관 플라토/서울')" class="my_layer_span" style='width:20%;'>삼성미술관 플라토/서울</span>
						<span onclick="chk_museum('4','삼성미술관 플라토/서울')" class="my_layer_span">서울</span>
						<span onclick="chk_museum('4','삼성미술관 플라토/서울')" class="my_layer_span" style='width:40%;'>서울 중구 태평로2가 150 삼성생명</span>
												<span onclick="chk_museum('5','백남준아트센터/경기')" class="my_layer_span" style='width:20%;'>백남준아트센터/경기</span>
						<span onclick="chk_museum('5','백남준아트센터/경기')" class="my_layer_span">경기</span>
						<span onclick="chk_museum('5','백남준아트센터/경기')" class="my_layer_span" style='width:40%;'>경기 용인시 기흥구 상갈동 85</span>
												<span onclick="chk_museum('6','대구문화예술회관/대구')" class="my_layer_span" style='width:20%;'>대구문화예술회관/대구</span>
						<span onclick="chk_museum('6','대구문화예술회관/대구')" class="my_layer_span">대구</span>
						<span onclick="chk_museum('6','대구문화예술회관/대구')" class="my_layer_span" style='width:40%;'>대구 달서구 성당동 187</span>
												<span onclick="chk_museum('7','봉산문화회관/대구')" class="my_layer_span" style='width:20%;'>봉산문화회관/대구</span>
						<span onclick="chk_museum('7','봉산문화회관/대구')" class="my_layer_span">대구</span>
						<span onclick="chk_museum('7','봉산문화회관/대구')" class="my_layer_span" style='width:40%;'>대구 중구 봉산동 125</span>
												<span onclick="chk_museum('9','수성아트피아/대구')" class="my_layer_span" style='width:20%;'>수성아트피아/대구</span>
						<span onclick="chk_museum('9','수성아트피아/대구')" class="my_layer_span">대구</span>
						<span onclick="chk_museum('9','수성아트피아/대구')" class="my_layer_span" style='width:40%;'>대구 수성구 지산동 1137-3</span>
                    </div>                
               	</td>
				</tr>
                
                <!-- ### 아트맵에서 퍼옴-->
                
                <tr>
                    <th> 
                        <label for="">*전시관지역</label>
                    </th>
                    <td>          
                        <select name="exhGubun4">
                            <option value="">전시관지역를 선택하세요</option>
                            <option value="서울">			서울			</option>
                            <option value="인천/경기">	인천/경기	</option>
                            <option value="대전/충청">	대전/충청	</option>
                            <option value="광주/전라">	광주/전라	</option>
                            <option value="부산/경상">	부산/경상	</option>
                            <option value="강원">			강원			</option>
                            <option value="제주">			제주			</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th><label for="">전시회 홈페이지 주소</label></th>
                    <td><input type="text" class="updateForm" name="exhUrl" id="exhUrl"></td>
                </tr>
                <tr>
                	<th>*전시일정</th>
                	<td>
                		<input type="date" class="updateForm" name="exhStartDate" id = "exhStartDate" style="width:30%;">부터 
                		<input type="date" class="updateForm" name="exhEndDate" id = "exhEndDate" style="width:30%;">까지
                	</td>
                </tr>
                <tr>
                    <th><label for="">*전시운영시간</label></th>
                    <td><input type="text" class="updateForm" name="opTime" id="opTime"></td>
                </tr>    
             	<tr>   
					<th><label>*전화번호</label></th>
					<td>
						<select name="tel1" id="tel1" style="width:20%;">
							<option value="">선택하세요</option>
							<option value="02">02</option>
							<option value="051">051</option>
							<option value="053">053</option>
							<option value="032">032</option>
							<option value="062">062</option>
							<option value="042">042</option>
							<option value="052">052</option>
							<option value="044">044</option>
							<option value="031">031</option>
							<option value="033">033</option> 
							<option value="043">043</option> 
							<option value="041">041</option> 
							<option value="063">063</option>
							<option value="061">061</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="064">064</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
							<option value="070">070</option>
						</select>
						-
						<input type="text" name="tel2"  id="tel2" class="updateForm"
							maxlength="4" placeholder="Tel" style="width:20%;">
						<input type="text" name="tel3" id="tel3"  class="updateForm"
							maxlength="4" placeholder="Tel" style="width:20%;">
					</td>		
				</tr>                
                <tr>
                    <th><label for="">*입장료</label></th>
                    <td> 	유료<input type="radio" class="updateForm" name="admFee" value="유료" style="width:5%;" required>
                    	   	무료<input type="radio" class="updateForm" name="admFee" value="무료" style="width:5%;" required>
                    </td>
                </tr>                
                <tr>
					<th class="td_left"><label for="">*포스터</label></th>
					<td class="td_right"><pre class="brush:html">
						<input type="file" class="updateForm" name="file1" id="profile_pt1" accept="image/*" onchange="previewImage(this,'View_area1')">
						<div id='View_area1' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div>
					</td>
				</tr>
				<tr> 
					<th class="td_left"><label for="">*작품사진1</label></th>
					<td class="td_right"><pre class="brush:html">
						<input type="file" class="updateForm" name="file2" id="profile_pt2" 
							 accept="image/*"  onchange="previewImage2(this,'View_area2')"> 
						<div id='View_area2' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div>
					</td>
				</tr>
				<tr>
					<th class="td_left"><label for="">작품사진1-이름</label></th>
					<td><input type="text" class="updateForm" name="imageName2" id="imageName2"></td>
				</tr>
				<tr>
					<th class="td_left"><label for="">작품사진1-설명</label></th>
					<td><input type="text" class="updateForm" name="imageType2" id="imageType2"></td>
				</tr>
				<tr> 
					<th class="td_left"><label for="">작품사진2</label></th>
					<td class="td_right"><pre class="brush:html">
						<input type="file" class="updateForm" name="file3" id="profile_pt3" accept="image/*" onchange="previewImage3(this,'View_area3')">
						<div id='View_area3' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div>
					</td>
				</tr>
				<tr>
					<th class="td_left"><label for="">작품사진2-이름</label></th>
					<td><input type="text" class="updateForm" name="imageName3" id="imageName3"></td>
				</tr>
				<tr>
					<th class="td_left"><label for="">작품사진2-설명</label></th>
					<td><input type="text" class="updateForm" name="imageType3" id="imageType3"></td>
				</tr>				
				<tr> 
					<th class="td_left"><label for="">작품사진3</label></th>
					<td class="td_right"><pre class="brush:html">
						<input type="file" class="updateForm" name="file4" id="profile_pt4" accept="image/*" onchange="previewImage4(this,'View_area4')">
						<div id='View_area4' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div>
					</td>
				</tr>
				<tr>
					<th class="td_left"><label for="">작품사진3-이름</label></th>
					<td><input type="text" class="updateForm" name="imageName4" id="imageName4"></td>
				</tr>	
				<tr>
					<th class="td_left"><label for="">작품사진3-설명</label></th>
					<td><input type="text" class="updateForm" name="imageType4" id="imageType4"></td>
				</tr>								
			  	<tr>
                    <td colspan="2" align="center">
                        <!-- <input style="width:150px; height:60px; margin:10px;" type="submit" value="전시회등록" >   -->
                        <!-- <button type="button" class="btn btn-primary"
								onclick="exhRegisterCheckForm(this.form)">전시회등록</button> -->
						<!--  <button type="button" id="btn"	style="width:150px; height:60px; margin:10px;"
								>전시회등록</button>	-->	
						<button type="button" style="width:150px; height:60px; margin:10px;"
								onclick="exhRegisterCheckForm(this.form)">전시회등록</button>
                    </td>
                </tr>                            
  				</tbody>
            </table> 
        </form>
    </div>
</c:if>
<c:if test="${empty sessionScope.member}">
<jsp:include page="../auth/askLogIn.jsp"></jsp:include>
</c:if>         
<!-- <script>  -->
<!--$(function() {
	$("#btnLogin").click(function() {
		alert("abcd");	
	
		var id 		= $("#id").val();	//태그의 value 속성값. 즉, 태그에 입력한 값
		var passwd 	= $("#passwd").val();

		if(id == "") {
			alert("아이디를 입력하십시오.");
			$("#id").focus();	//입력 포커스 이동
			return; //함수 종료
		}
		if(passwd == "") {
			alert("비밀번호를 입력하십시오.");
			$("#passwd").focus();
			return;
		}
		//폼 데이터를 서버로 제출
		alert(document.exhRegisterForm.method);
		alert(document.exhRegisterForm.enctype);
		document.exhRegisterForm.action = "add.do";
		document.exhRegisterForm.submit();
	});
});  -->
<!-- </script> -->
<jsp:include page="/module/3body_last.html" />
<script>   
$("input:checkbox").click(function() {
	var bol = $("input:checkbox:checked").length >= 3;     
	$("input:checkbox").not(":checked").attr("disabled",bol);
	});


function sample6_execDaumPostcode_1() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                //document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                //document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            //document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("exhPlaceAddr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            //document.getElementById("exhGubun4").focus();
        }
    }).open();
}
</script>

</body>
</html>