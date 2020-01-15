<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
	
<body>

 	<jsp:include page="../../module/2body_first.jsp"></jsp:include>
	
	<div class="container" id="mainContainer">
		<div id="sortBox" style="display: inline-flex;">
			<button type="button" class="artSort" id="sortBtn1">진행중전시</button>
			<button type="button" class="artSort" id="sortBtn2">인기전시</button>
			<button type="button" class="artSort" id="sortBtn3">종료임박전시</button>
			<button type="button" class="artSort" id="sortBtn4">종료전시</button>
		</div>
		<div id="ctgBox">
			<ul id="ctgList">
				<li><b>태그로 찾을래요</b></li>
				<li id="tagCtg" class="ctg" name="데이트">#데이트</li>
				<li id="tagCtg" class="ctg" name="인생샷">#인생샷</li>
				<li id="tagCtg" class="ctg" name="친구와함께">#친구와함께</li>
				<li id="tagCtg" class="ctg" name="나혼자문화생활">#나혼자문화생활</li>
				<li id="tagCtg" class="ctg" name="부모님과함께">#부모님과함께</li>
				<li id="tagCtg" class="ctg" name="아이와함께">#아이와함께</li>
				<li id="tagCtg" class="ctg" name="교육전시">#교육전시</li>
			</ul>
			<ul id="ctgList">
				<li><b>위치로 찾을래요</b></li>
				<li id="locCtg" class="ctg" name="서울">서울</li>
				<li id="locCtg" class="ctg" name="인천/경기">인천/경기</li>
				<li id="locCtg" class="ctg" name="대전/충청">대전/충청</li>
				<li id="locCtg" class="ctg" name="광주/전라">광주/전라</li>
				<li id="locCtg" class="ctg" name="부산/경상">부산/경상</li>
				<li id="locCtg" class="ctg" name="강원">강원</li>
				<li id="locCtg" class="ctg" name="제주">제주</li>
			</ul>
			<ul id="ctgList">
				<li><b>장르로 찾을래요</b></li>
				<li id="genCtg" class="ctg" name="서양화">서양화</li>
				<li id="genCtg" class="ctg" name="동양화">동양화</li>
				<li id="genCtg" class="ctg" name="유화">유화</li>
				<li id="genCtg" class="ctg" name="조각">조각</li>
				<li id="genCtg" class="ctg" name="설치미술">설치미술</li>
				<li id="genCtg" class="ctg" name="미디어아트">미디어아트</li>
				<li id="genCtg" class="ctg" name="사진">사진</li>
				<li id="genCtg" class="ctg" name="디자인">디자인</li>
				<li id="genCtg" class="ctg" name="공예">공예</li>
			</ul>
		</div>
		<br>
		<div id="content_div">
		    <c:choose>
			    <c:when test="listCnt eq 0">
			    	<div>
						<div id="pDiv">
							<center>진행중인 전시가 없습니다!</center><br>
							<div align="center">
							   <a class="btn" href="<%=request.getContextPath()%>/index.jsp">메인으로 돌아가기</a>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div id="content_list">  
				    	<c:forEach var="list" items="${lists}">
						    <div id="content_list_div">
						        <a href="<%=request.getContextPath()%>/client/exhibition/ExContentView.do?exhID=${list.exhID}" id="ExContentView" style="width: 290px; height: 470px;"><!-- 아무데나 눌러도 상세페이지로 넘어가게 -->
						        	<img src="/doArtShow/exhibitionImages/${list.imageFile1}" style="height: 370px; width: 275px;"/><br>
						            <b>${list.exhName}</b><br>
						            ${list.exhPlace}<br>
						            ${list.exhStartDate}&nbsp;~&nbsp;${list.exhEndDate}
						       	</a>
						    </div>
					    </c:forEach>
					</div>
					<div id="moreBtn_div" align="center">
						<button type="button" id="more_btn">더보기</button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>



	<jsp:include page="../../module/3body_last.html"></jsp:include>
	
	<script>
		/* list정렬을 위한 함수 */
		$('.artSort').click(function(){
			var sortBtn = $(this).attr("id");
			console.log(sortBtn);
			
			$.ajax({
				url : "artListSort.do",
				type : "GET",
				dataType : "JSON",
				data : {
					"sortBtn" : sortBtn
				},
				success : function(data){
					if(data.listCnt == 0){
						console.log("게시물 없음");
						/* 게시물 없으면 #pDiv로 가서 그안에 html실행 */
					}else if(data.listCnt != 0){
						console.log("게시물 있음");
						/* 게시물 있으면 #content_list로 가서 리스트 뿌려줌 */
					}	
				},
				error : function(request, status, error){
					var msg = "ERROR : <br>"
						msg += request.status +"<br>"+ request.responseText +"<br>"+ error;
					console.log(msg);
				}
			});
		});
			
		
		/* 태그별로 정렬하기 위한 함수 */
		$('.ctg').click(function(){
			var ctgBtn = $(this).attr("id");
			console.log(ctgBtn);
			var ctgName = $(this).attr("name");
			console.log(ctgName);
			
			$.ajax({
				url : "artTagSort.do",
				type : "GET",
				dataType : "JSON",
				data : {
					"ctgBtn" : ctgBtn,
					"ctgName" : ctgName
				},
				success : function(data){
					if(data.listCnt == 0){
						console.log("게시물 없음");
						/* 게시물 없으면 #pDiv로 가서 그안에 html실행 */
					}else if(data.listCnt != 0){
						console.log("게시물 있음");
						/* 게시물 있으면 #content_list로 가서 리스트 뿌려줌 */
					}	
				},
				error : function(request, status, error){
					var msg = "ERROR : <br>"
						msg += request.status +"<br>"+ request.responseText +"<br>"+ error;
					console.log(msg);
				}
			});
		});
	</script>
	
	
</body>
</html>