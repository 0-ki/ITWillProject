<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
	
<body>

 	<jsp:include page="../../module/2body_first.jsp"></jsp:include>
	
	<div class="container" id="mainContainer">
		<div id="sortBox" style="display: inline-flex;">
			<div class="artSort"><h3>전체전시</h3></div>
			<div class="artSort"><h3>최신전시</h3></div>
			<div class="artSort"><h3>인기전시</h3></div>
			<div class="artSort"><h3>종료전시</h3></div>
		</div>
		<div id="ctgBox">
			<ul id="ctgList">
				<li><b>태그로 찾을래요</b></li>
				<li><a href="#데이트" class="ctg">#데이트</a></li>
				<li><a href="#인생샷" class="ctg">#인생샷</a></li>
				<li><a href="#친구와함께" class="ctg">#친구와함께</a></li>
				<li><a href="#나혼자문화생활" class="ctg">#나혼자문화생활</a></li>
				<li><a href="#부모님과함께" class="ctg">#부모님과함께</a></li>
				<li><a href="#아이와함께" class="ctg">#아이와함께</a></li>
				<li><a href="#교육전시" class="ctg">#교육전시</a></li>
			</ul>
			<ul id="ctgList">
				<li><b>위치로 찾을래요</b></li>
				<li><a href="#서울" class="ctg">서울</a></li>
				<li><a href="#인천경기" class="ctg">인천/경기</a></li>
				<li><a href="#대전충청" class="ctg">대전/충청</a></li>
				<li><a href="#광주전라" class="ctg">광주/전라</a></li>
				<li><a href="#부산경상" class="ctg">부산/경상</a></li>
				<li><a href="#강원" class="ctg">강원</a></li>
				<li><a href="#제주" class="ctg">제주</a></li>
			</ul>
			<ul id="ctgList">
				<li><b>장르로 찾을래요</b></li>
				<li><a href="#서양화" class="ctg">서양화</a></li>
				<li><a href="#동양화" class="ctg">동양화</a></li>
				<li><a href="#유화" class="ctg">유화</a></li>
				<li><a href="#조각" class="ctg">조각</a></li>
				<li><a href="#설치미술" class="ctg">설치미술</a></li>
				<li><a href="#미디어아트" class="ctg">미디어아트</a></li>
				<li><a href="#사진" class="ctg">사진</a></li>
				<li><a href="#디자인" class="ctg">디자인</a></li>
				<li><a href="#공예" class="ctg">공예</a></li>
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
  
    
	
	<script>
		/* 더보기 버튼 */
		/* var maxlength = ;
		var start_number = 0;
		
		$("#more_btn").on("click", function(){
			start_number = start_number+1;
			if(start_number > maxlength){
				return false;
			}
			
			$("#moreBtn_div").fadeOut("fast");
			$.ajax({
				url: "/moreList.do",
				type: "post",
				data: ,
				success: function(data){
					$("#content_list").append(data);
					if(start_number >= maxlength){
						$("#moreBtn_div").fadeOut("fast");
						return false;
					}
					$("#moreBtn_div").fadeIn("fast");
				},
				error: function(error){
					
				}
			});
		}); */
		
	</script>

	<jsp:include page="../../module/3body_last.html"></jsp:include>
	
</body>
</html>