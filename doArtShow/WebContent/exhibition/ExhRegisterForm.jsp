<%@page import="java.text.SimpleDateFormat" %> 
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String id="";
/*
try {
	managerId=(String)session.getAttribute("id");
	//세션값이 없으면 정상적으로 로그인을 하지 않은 경우이므로 쫓아낸다. 
	if(managerId==null || managerId.equals("")) {
		response.sendRedirect("../logon/memberLoginForm.jsp");
	}else{
		//정상적으로 로그인하고 들어온경우는 페이지를 보여준다. 
	}
*/	
%></%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<style>
	/*
	table {
		-webkit-tap-highlight-color: rgba(0,0,0,0);
		font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
		font-size: 14px;
		line-height: 1.42857143;
		color: #333;
		box-sizing: border-box;
		border-spacing: 0;
		background-color: transparent;
		border: 1px solid gray;
		border-collapse: collapse;
		width: 100%;
	}*/
		select { 
		width:100%; /* 원하는 너비설정 */
		padding: .8em .5em; /* 여백으로 높이 설정 */ 
		font-family: inherit; /* 폰트 상속 */ 
		background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
		border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; appearance: none;
	}
	input {
		padding: .8em .5em; /* 여백으로 높이 설정 */ 
		width:100%; /* 원하는 너비설정 */
	}
</style>
</head>
<body>
<%	Date nowTime = new Date();
	//SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
	SimpleDateFormat sf = new SimpleDateFormat("yyMMdd");
	SimpleDateFormat year = new SimpleDateFormat("yyyy");
	SimpleDateFormat month = new SimpleDateFormat("MM");
	SimpleDateFormat day = new SimpleDateFormat("dd");
   %></%> 
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
                    <th>전시회 등록</th>
                    <td>
                        <select name="exhGubun1" required>
                            <option value="">전시회 분류를 선택하세요</option>
                            <option value="개인전">개인전</option>
                            <option value="단체전">단체전</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>
                        <lable for="">*신청자</lable>
                    </th>
                    <td><input type="text" name="memberID" id="#7" placeholder="필수입력사항" readOnly></td>
                </tr>
                <tr>
                    <th>
                        <lable for="">*장르</lable>
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
                    <th><lable for="">*태그</lable></th>
                    <td>
                    	#데이트				<input name="exhGubun3" type="checkbox" value="데이트" >
                    	#인생샷				<input name="exhGubun3" type="checkbox" value="인생샷" >
                    	#친구와함께		<input name="exhGubun3" type="checkbox" value="친구와함께" >
                    	#나혼자문화생활	<input name="exhGubun3" type="checkbox" value="나혼자문화생활" >
                    	#부모님과함께		<input name="exhGubun3" type="checkbox" value="부모님과함께" >
                    	#아이와함께		<input name="exhGubun3" type="checkbox" value="아이와함께" >
                    	#교육전시			<input name="exhGubun3" type="checkbox" value="교육전시" >
                    </td>	
                </tr>
                <tr>
                    <th><label for="">*전시회명</label></th>
                    <td><input type="text" name="exhName" id="#6" placeholder="필수입력사항"></td>
                </tr>
                <tr>
                    <th>	<label for="">작가정보</label>
                    		<p style="font-size:14px; line-height:22px; letter-spacing:-0.6px; font-weight:300;">작가 정보<br/>(전시,수상이력 등)를<br/>입력해주세요</p>
                    </th>
                    <td><textarea name="artistInfo" id="#5" cols="40" rows="15" style="width:100%; height:250px;"></textarea></td>
                </tr>
                <tr>
                	<th>	<label for="">전시내용</label>
                			<p style="font-size:14px; line-height:22px; letter-spacing:-0.6px; font-weight:300;">텍스트, 평론</p>	
                	</th>
                    <td><textarea name="exhContent" id="#4" cols="40" rows="15" style="width:100%; height:250px;"></textarea></td>
                </tr>
                <tr>
                	<!--  전시관 주소 등록 기능 To be required -->
                	<th>*전시관</th>
                	<td>
                		<input type="text" name="exhPlace" id="exhPlace" placeholder="필수입력사항">
                	</td>
                </tr>
                <tr>
                        <th>*전시관 주소</th>
                        <td>
               			<input type="text" id="ExhPlaceAddr1" name="ExhPlaceAddr1" placeholder="주소" style="width:90%;"> 
                		<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" style="width:9%;"><br> 
						<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
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
                        <lable for="">*전시관지역</lable>
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
                    <td><input type="text" name="exhUrl" id="exhUrl"></td>
                </tr>
                <tr>
                	<th>*전시일정</th>
                	<td>
                		<input type="date" name="exhStartDate" style="width:30%;">부터 
                		<input type="date" name="exhEndDate" style="width:30%;">까지
                	</td>
                </tr>
                <tr>
                    <th><label for="">*전시운영시간</label></th>
                    <td><input type="text" name="opTime" id="#3"></td>
                </tr>    
             	<tr>   
					<th><label>전화번호</label></th>
					<td>
						<select name="tel1" style="width:20%;">
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
						</select>
						-
						<input type="text" name="tel2" 
							maxlength="4" style="width:20%;">
						<input type="text" name="tel3" 
							maxlength="4" placeholder="Tel" style="width:20%;">
					</td>		
				</tr>                
                <tr>
                    <th><label for="">*입장료</label></th>
                    <td> 	유료<input type="radio" name="admFee" id="#1" value="유료" style="width:5%;" required>
                    	   	무료<input type="radio" name="admFee" id="#2" value="무료" style="width:5%;" required>
                    </td>
                </tr>                
                <tr>
					<th class="td_left"><label for="">포스터</label></th>
					<td class="td_right"><pre class="brush:html">
						<input type="file" name="file1" id="profile_pt1" onchange="previewImage(this,'View_area1')">
						<div id='View_area1' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div>
					</pre>							
					</td>
				</tr>
				<tr> 
				<th class="td_left"><label for="">작품사진</label></th>
					<td class="td_right"><pre class="brush:html">
						<input type="file" name="file2" id="profile_pt2" onchange="previewImage2(this,'View_area2')">
						<div id='View_area2' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div>
					</pre>							
					</td>
				</tr>

			  	<tr>
                    <td colspan="2" align="center">
                        <!-- <input style="width:150px; height:60px; margin:10px;" type="submit" value="전시회등록" /> -->
                        <button type="button" class="btn btn-primary"
								onclick="exhRegisterCheckForm(this.form)">전시회등록</button>
                    </td>
                </tr>                            
  				</tbody>
            </table> 
        </form>
    </div> 
</body>
</html>