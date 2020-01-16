<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>㈜ 전시회 - 전시회 등록 신청서</title>
<style>
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
 %>
    <div class="container">
        <h3 style ="width:100%; text-align:center">(주) 전시회</h3>
        <h2 style ="width:100%; text-align:center">전시회 등록 신청서</h2>
        <!-- <form action="/exhibition/add.do" method="post" enctype="multipart/form-data" name="ExRegisterform">  -->
        <form action="add.do" method="get" name="ExRegisterform">
            <table border = "1">
                <tr>
                    <th>신청과정</th>
                    <td>
                        <select name="exhGubun1">
                            <option value="">전시회 분류를 선택하세요</option>
                            <option value="1">개인전</option>
                            <option value="2">단체전</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>
                        <lable for="">*신청자</lable>
                    </th>
                    <td><input type="text" name="memberID" id="#" placeholder="필수입력사항"></td>
                </tr>
                <tr>
                    <th>
                        <lable for="">*장르</lable>
                    </th>
                    <td>          
                        <select name="exhGubun2">
                            <option value="">장르를 선택하세요</option>
                            <option value="1">서양화</option>
                            <option value="2">동양화</option>
                            <option value="3">유화</option>
                            <option value="4">조각</option>
                            <option value="5">설치미술</option>
                            <option value="6">미디어아트</option>
                            <option value="7">사진</option>
                            <option value="8">디자인</option>
                            <option value="9">공예</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <th><lable for="">*태그</lable></th>
                    <td>
                    	#데이트<input name="exhGubun3" type="checkbox" value="1">
                    	#인생샷<input name="exhGubun3" type="checkbox" value="2">
                    	#친구와함께<input name="exhGubun3" type="checkbox" value="3">
                    	#나혼자문화생활<input name="exhGubun3" type="checkbox" value="4">
                    	#부모님과함께<input name="exhGubun3" type="checkbox" value="5">
                    	#아이와함께<input name="exhGubun3" type="checkbox" value="6">
                    	#교육전시<input name="exhGubun3" type="checkbox" value="7">
                    </td>	
                </tr>
                <tr>
                    <th><label for="">*전시회명</label></th>
                    <td><input type="text" name="exhName" id="#" placeholder="필수입력사항"></td>
                </tr>
                <tr>
                    <th><label for="">작가정보</label></th>
                    <td><textarea name="artistInfo" id="#" cols="40" rows="15"></textarea></td>
                </tr>
                <tr>
                	<th><label for="">전시내용</label></th>
                    <td><textarea name="exhContent" id="#" cols="40" rows="15"></textarea></td>
                </tr>
                <tr>
                	<!--  전시관 주소 등록 기능 To be required -->
                	<th>*전시관</th>
                	<td>
                		<input type="text" name="exhPlace" id="#" placeholder="필수입력사항">
                	</td>
                </tr>
                                <tr>
                    <th>
                        <lable for="">*장르</lable>
                    </th>
                    <td>          
                        <select name="exhGubun4">
                            <option value="">전시관지역를 선택하세요</option>
                            <option value="1">서울</option>
                            <option value="2">인천/경기</option>
                            <option value="3">대전/충청</option>
                            <option value="4">광주/전라</option>
                            <option value="5">부산/경상</option>
                            <option value="6">강원</option>
                            <option value="7">제주</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th><label for="">전시회 홈페이지 주소</label></th>
                    <td><input type="text" name="exhUrl" id="#"></td>
                </tr>
                <tr>
                	<th>*전시일정</th>
                	<td>
                		<input type="date" name="exhStartDate">부터 
                		<input type="date" name="exhEndDate">까지
                	</td>
                </tr>
                <tr>
                    <th><label for="">*전시운영시간</label></th>
                    <td><input type="text" name="opTime" id="#"></td>
                </tr>    
                <tr>
                    <th><label for="">*이메일</label></th>
                    <td><input type="text" name="email1" id="#">
                    	<select class="form-control" name="email2">
							<option value="">선택하세요</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
                    </td>
                </tr>                
                <tr>
             	<tr>   
					<th><label class="control-label col-sm-2">휴대번호</label></th>
					<td>
						<select class="form-control" name="tel1">
							<option value="">선택하세요</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						<input type="text" class="form-control col-sm-1" name="tel2" 
							maxlength="4" placeholder="Tel">
						<input type="text" class="form-control col-sm-1" name="tel3" 
							maxlength="4" placeholder="Tel">
					</td>		
				</tr>                
                <tr>
                    <th><label for="">*입장료</label></th>
                    <td> 	유료<input type="radio" name="admFee" id="#" value="유료">
                    	   	무료<input type="radio" name="admFee id="#" value="무료">
                    </td>
                </tr>                
                <tr>  
                <tr>
					<th class="td_left"><label for="">포스터</label></th>
					<td class="td_right"><input type="file" name="#" id="#"></td>
				</tr>                              
               <tr>
					<th class="td_left"><label for="">작품사진</label></th>
					<td class="td_right"><input type="file" name="# "id="#"></td>
				</tr>  
				<tr>
                    <td colspan="2" align="center">
                        <input style="width:150px; height:60px; margin:10px;" type="submit" value="전시회등록하기" />
                    </td>
                </tr>                            
  
            </table>
        </form>
    </div>
</body>
</html>