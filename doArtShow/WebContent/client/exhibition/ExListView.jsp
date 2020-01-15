<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
	
<body>

<style>
	/* 정렬 */
	@import url(https://fonts.googleapis.com/css?family=Open+Sans:400|Raleway:300);
	*:before,
	*:after {
	  box-sizing: border-box;
	  transition: 0.5s ease-in-out;
	  z-index: -1;
	}
	
	.artSort {
	  text-decoration: none;
	  line-height: 80px;
	  color: black;
	  text-align: center;
	  font-size: 18px;
	}
	
	@media (min-width: 600px) {
	  #sortBox {
	    width: 100%;
	  }
	}
	.artSort {
	  position: relative;
	  display: block;
	  overflow: hidden;
	  width: 100%;
	  height: 80px;
	  max-width: 200px;
	  margin: 1rem auto;
	  text-transform: uppercase;
	  text-align: center;
	  border: 1px solid currentColor;
	}
	
	.artSort {
	  color: #ad3da1;
	}
	.artSort:before, .artSort:after {
	  content: '';
	  position: absolute;
	  top: 0;
	  right: 0;
	  bottom: 0;
	  left: 0;
	}
	.artSort:before {
	  right: -50px;
	  border-right: 50px solid transparent;
	  border-bottom: 80px solid #8e1882; 
	  -webkit-transform: translateX(-100%);
	          transform: translateX(-100%);
	}
	.artSort:after {
	  left: -50px;
	  border-left: 50px solid transparent;
	  border-top: 80px solid #8e1882;
	  -webkit-transform: translateX(100%);
	          transform: translateX(100%);
	}
	.artSort:hover {
	  color: #f5e8f4;
	  cursor: pointer;
	}
	.artSort:hover:before {
	  -webkit-transform: translateX(-49%);
	          transform: translateX(-49%);
	}
	.artSort:hover:after {
	  -webkit-transform: translateX(49%);
	          transform: translateX(49%);
	}

	/* 태그 */
	#ctgList li {
	  display: inline-flex;
	  list-style-type: none;
	  margin-left: 10px;
	  color: #f7f7f7;
	  font-family: 'Noto Sans KR', sans-serif !important;
	  font-size: 15px;
	}
	
	li b {
	  padding-right: 20px;
	}
	
	#ctgBox {
	  background: linear-gradient(135deg, #c71eae 0%, #db8344 31%, #c73653 71%, #6e38a8 100%);
	  font-family: 'Noto Sans KR', sans-serif !important;
	  justify-content: center;
	  align-items: center;
	  align-content: center;
	  padding: 20px;
	  padding-right: 50px;
	  padding-left: 50px;
	  border-radius: 10px;
	}
	
	.ctg {
	  flex: 1 1 auto;
	  padding-top: 15px;
	  padding-bottom: 15px;
	  padding-left: 20px;
	  padding-right: 20px;
	  text-align: center;
	  text-transform: uppercase;
	  position: relative;
	  overflow: hidden;
	  transition: .3s;
	}

	.ctg:hover {
	  cursor: pointer;
	}
	
</style>

 	<jsp:include page="../../module/2body_first.jsp"></jsp:include>
	
	<div class="container" id="mainContainer">
		<div id="sortBox" style="display: inline-flex;">
			<div class="artSort" id="sortBtn1"><b>진행중전시</b></div>
			<div class="artSort" id="sortBtn2"><b>인기전시</b></div>
			<div class="artSort" id="sortBtn3"><b>종료임박전시</b></div>
			<div class="artSort" id="sortBtn4"><b>종료전시</b></div>
		</div>
		<div id="ctgBox">
			<ul id="ctgList">
				<li><i class="fa fa-tags fa-1.5x"></i>&nbsp;<b>태그로 찾을래요</b></li>
				<li id="tagCtg" class="ctg" name="데이트">#데이트</li>
				<li id="tagCtg" class="ctg" name="인생샷">#인생샷</li>
				<li id="tagCtg" class="ctg" name="친구와함께">#친구와함께</li>
				<li id="tagCtg" class="ctg" name="나혼자문화생활">#나혼자문화생활</li>
				<li id="tagCtg" class="ctg" name="부모님과함께">#부모님과함께</li>
				<li id="tagCtg" class="ctg" name="아이와함께">#아이와함께</li>
				<li id="tagCtg" class="ctg" name="교육전시">#교육전시</li>
			</ul>
			<ul id="ctgList">
				<li><i class="fa fa-map fa-1.5x"></i>&nbsp;<b>위치로 찾을래요</b></li>
				<li id="locCtg" class="ctg" name="서울">서울</li>
				<li id="locCtg" class="ctg" name="인천/경기">인천/경기</li>
				<li id="locCtg" class="ctg" name="대전/충청">대전/충청</li>
				<li id="locCtg" class="ctg" name="광주/전라">광주/전라</li>
				<li id="locCtg" class="ctg" name="부산/경상">부산/경상</li>
				<li id="locCtg" class="ctg" name="강원">강원</li>
				<li id="locCtg" class="ctg" name="제주">제주</li>
			</ul>
			<ul id="ctgList">
				<li><i class="fa fa-image fa-1.5x"></i>&nbsp;<b>장르로 찾을래요</b></li>
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
			
			/* 다른 버튼을 클릭할때 이전의 버튼의 css를 초기화해줌 */
			$(".artSort").css({
			     "border": "",
			     "background-color":"",
			     "color":""
			})
			  
			if(sortBtn == "sortBtn1"){
			  $("#sortBtn1").css({
			    "border":"solid 1px #8e1882",
			    "background-color":"#8e1882",
			    "color":"#f5e8f4"
			  });
			}else if(sortBtn == "sortBtn2"){
			  $("#sortBtn2").css({
			    "border":"solid 1px #8e1882",
			    "background-color":"#8e1882",
			    "color":"#f5e8f4"
			  });
			}else if(sortBtn == "sortBtn3"){
			  $("#sortBtn3").css({
			    "border":"solid 1px #8e1882",
			    "background-color":"#8e1882",
			    "color":"#f5e8f4"
			  });
			}else if(sortBtn == "sortBtn4"){
			  $("#sortBtn4").css({
			    "border":"solid 1px #8e1882",
			    "background-color":"#8e1882",
			    "color":"#f5e8f4"
			  });
			}
			
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