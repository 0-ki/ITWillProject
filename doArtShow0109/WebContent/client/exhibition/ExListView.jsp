<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<jsp:include page="/module/1doctype_head.jsp"></jsp:include>
	
<body>
	
 	<jsp:include page="/module/2body_first.jsp"></jsp:include>

<style>
	/* 정렬 */
	.selected{
	  	border-bottom: 2px solid #23AD21 !important;
		transition: all 0.3s;
		background-color: white;
	}
	
	#sortBox{
		display: inline-flex;
		margin: 20px;
		margin-right: 70px;
		margin-left: 70px;
		width: 90%
	}
	
	#sortBox > div{
		border: 0;
	    font-size: 20pt;
	    transition: all 0.3s;
	    margin: 0 auto; /* div를 가운데 정렬하는애 */
	    padding-right: 5px;
    	padding-left: 5px;
	    text-align: -webkit-center;
	}
	#tagList .ctg{
		border: 0;
		margin-bottom: 10px;
    	margin-top: 10px;
    	margin-right: 20px;
	    font-size: 13pt;
	    transition: all 0.3s;
	}
	#locList .ctg{
		border: 0;
		margin-bottom: 10px;
    	margin-top: 10px;
    	margin-right: 20px;
	    font-size: 13pt;
	    transition: all 0.3s;
	}
	#genList .ctg{
		border: 0;
		margin-bottom: 10px;
    	margin-top: 10px;
    	margin-right: 20px;
	    font-size: 13pt;
	    transition: all 0.3s;
	}
	
	#sortBox > div:hover{
		border-bottom: 2px solid #23AD21 !important;
		transition: all 0.3s;
		cursor: pointer;
	}
	#tagList .ctg:hover{
		border-bottom: 2px solid #23AD21 !important;
		transition: all 0.3s;
		cursor: pointer;
	}
	#locList .ctg:hover{
		border-bottom: 2px solid #23AD21 !important;
		transition: all 0.3s;
		cursor: pointer;
	}
	#genList .ctg:hover{
		border-bottom: 2px solid #23AD21 !important;
		transition: all 0.3s;
		cursor: pointer;
	}

	/* 태그 */	
	.ctgList li {
	  display: inline-flex;
	  list-style-type: none;
	  margin-left: 10px;
	  margin-right: 10px;
	  color: #1a1a1a;
	  font-family: 'Noto Sans KR', sans-serif !important;
	  font-size: 15px;
	}
	
	.ctgList{
	  padding-left: 5em;
      padding-right: 2em;
	}
	
	li b {
	  padding-right: 80px;
	}
	
	#ctgBox {
      margin-left: 70px;
      margin-right: 70px; 
      padding: 30px;
	  padding-right: 50px;
	  padding-left: 50px;
	  border-radius: 100px;
	  box-shadow: 0px 0px 15px 0px #994d00;
	}
	
	/* 출력되는 div 게시물 */
	#content_div {
    	text-align: center;
    	padding-left: 3%;
    	padding-right: 3%;
    	padding-top: 5em;
    }
    
    
	#content_list{
		display: -webkit-inline-box;
    	flex-wrap: wrap;
    	-webkit-box-pack: center;
    	width: 100%;
	}
	
	.content_list_div{ 
		margin-left: 15px;
	    margin-right: 15px;
	    margis-top: 20px;
	    margin-bottom: 20px;
	    width: 275px;
	    /* height: auto; */
	    height: 540px;
	    text-align: left;
	    border-radius: 20px;
	    padding-bottom: 10px;
	}
	
	.content_list_div img{ 
		width: 100%;
		border-radius: 20px;
		display: flex;
	    overflow: hidden;
	}
	
	.content_list_div a{ 
		color: #474747;
		text-decoration: none;
	}
	
	.content_list_div:hover{ 
		/* -moz-box-shadow: 0px 12px 20px rgba(54, 24, 79, 0.5);
		-webkit-box-shadow: 0px 12px 20px rgba(54, 24, 79, 0.5);
		box-shadow: 0px 12px 20px rgba(54, 24, 79, 0.5); */
		opacity: 0.4;
		transition: all .3s;
		border-radius: 20px;
	}
	
	.#content_list_div a:hover{ 
		color: #8a8a8a;
		text-decoration: none;
		border-radius: 20px;
	}
	
	#moreBtn_div{
		padding: 30px;
	}
</style>
	
      <input type="text" hidden id="sort_num" value="0"/> <!-- 기본값 0 : 전체전시 -->
      <input type="text" hidden id="tag_num" value="0"/> <!-- 0일경우 선택 안되있는 것 -->
      <input type="text" hidden id="loc_num" value="0"/> <!-- 0일경우 선택 안되있는 것 -->
      <input type="text" hidden id="gen_num" value="0"/> <!-- 0일경우 선택 안되있는 것 -->
      <input type="text" hidden id="page_num" value="0"/> <!-- 처음 출력되는 페이지 : 0 -->
      
	<div class="container" id="mainContainer" style="width:90%;">
		<div id="sortBox">
			<div class="ctg artSort selected" id="0"><b>전체 전시 보기</b></div>
			<div class="ctg artSort" id="1"><b>진행중인 전시 보기</b></div>
			<div class="ctg artSort" id="2"><b>인기 전시 보기</b></div>
			<div class="ctg artSort" id="3"><b>곧 종료하는 전시 보기</b></div>
			<div class="ctg artSort" id="4"><b>종료 된 전시 보기</b></div>
		</div>
		<div id="ctgBox">
			<ul class="ctgList" id="tagList"><!-- 미선택시 0, 선택시 1번부터~ -->
				<li><i class="fa fa-slack"></i>&nbsp;<b>태그로 찾을래요</b></li>
				<li id="1" class="ctg tag" name="데이트">#데이트</li>
				<li id="2" class="ctg tag" name="인생샷">#인생샷</li>
				<li id="3" class="ctg tag" name="친구와함께">#친구와함께</li>
				<li id="4" class="ctg tag" name="나혼자문화생활">#나혼자문화생활</li>
				<li id="5" class="ctg tag" name="부모님과함께">#부모님과함께</li>
				<li id="6" class="ctg tag" name="아이와함께">#아이와함께</li>
				<li id="7" class="ctg tag" name="교육전시">#교육전시</li>
			</ul>
			<ul class="ctgList" id="locList">
				<li><i class="fa fa-map"></i>&nbsp;<b>위치로 찾을래요</b></li>
				<li id="1" class="ctg loc" name="서울">서울</li>
				<li id="2" class="ctg loc" name="인천/경기">인천/경기</li>
				<li id="3" class="ctg loc" name="대전/충청">대전/충청</li>
				<li id="4" class="ctg loc" name="광주/전라">광주/전라</li>
				<li id="5" class="ctg loc" name="부산/경상">부산/경상</li>
				<li id="6" class="ctg loc" name="강원">강원</li>
				<li id="7" class="ctg loc" name="제주">제주</li>
			</ul>
			<ul class="ctgList" id="genList">
				<li><i class="fa fa-image"></i>&nbsp;<b>장르로 찾을래요</b></li>
				<li id="1" class="ctg gen" name="서양화">서양화</li>
				<li id="2" class="ctg gen" name="동양화">동양화</li>
				<li id="3" class="ctg gen" name="유화">유화</li>
				<li id="4" class="ctg gen" name="조각">조각</li>
				<li id="5" class="ctg gen" name="설치미술">설치미술</li>
				<li id="6" class="ctg gen" name="미디어아트">미디어아트</li>
				<li id="7" class="ctg gen" name="사진">사진</li>
				<li id="8" class="ctg gen" name="디자인">디자인</li>
				<li id="9" class="ctg gen" name="공예">공예</li>
			</ul>
		</div>
		<br>
		<div id="content_div">
		    <c:choose>
			    <c:when test="listCnt eq 0">
			    	<div id="listCnt_0_div">
						<div id="pDiv">
							<center>진행중인 전시가 없습니다!</center><br>
							<div style="text-align: center;">
							   <a class="btn" href="<%=request.getContextPath()%>/index.jsp">메인으로 돌아가기</a>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div id="content_list">  
				    	<c:forEach var="list" items="${lists}" begin="0" end="14">
						   <!-- <div class="list_div" style="height: 540px;">  -->
						   	<div class="content_list_div">
						    	<a href="<%=request.getContextPath()%>/client/exhibition/ExContentView.do?exhID=${list.exhID}" id="ExContentView"><!-- 아무데나 눌러도 상세페이지로 넘어가게 -->
						        	<img src="/doArtShow/exhibitionImages/${list.imageFile1}"/><br>
							        <div style="padding: 10px;">
								        <b style="font-size:12pt;">${list.exhName}</b><br>
								        ${list.exhPlace}<br>
								        ${list.exhStartDate}&nbsp;~&nbsp;${list.exhEndDate}
							        </div>
						       	</a>
						     </div>
						    <!-- </div> -->
					    </c:forEach>
					</div>
					<div id="moreBtn_div" align="center">
						<button type="button" id="more_btn" class="btn">더보기</button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>



	<jsp:include page="/module/3body_last.html"></jsp:include>
	
	<script>	
		/* 정렬하기 위한 함수 */
		$('.ctg').click(function(){
			var className = $(this).attr('class');			
			var thisId = $(this).attr('id');
			var inputSort = $('#sort_num');
			var inputTag = $('#tag_num');
			var inputLoc = $('#loc_num');
			var inputGen = $('#gen_num');
			var inputPage = $('#page_num');
			
			inputPage.val('0'); 
			
			$("#moreBtn_div").show();
			
			// 클릭된 항목으로 input에 값을 셋팅하고, .selected 클래스를 적용시켜줌.
			switch (className) {
			case 'ctg artSort':inputSort.val(parseInt(thisId));
				$('.ctg.artSort').removeClass("selected");
				$(this).addClass("selected");
				break;

			case 'ctg tag':inputTag.val(parseInt(thisId));
				$('.ctg.tag').removeClass("selected");
				$(this).addClass("selected");
				break;

			case 'ctg loc':inputLoc.val(parseInt(thisId));
				$('.ctg.loc').removeClass("selected");
				$(this).addClass("selected");
				break;

			case 'ctg gen':inputGen.val(parseInt(thisId));
				$('.ctg.gen').removeClass("selected");
				$(this).addClass("selected");
				break;
			default:
				break;
			}
			
			console.log(
				'sortVal==>'+inputSort.val()+
				'\ntagVal==>'+inputTag.val()+
				'\nlocVal==>'+inputLoc.val()+
				'\ngenVal==>'+inputGen.val()+
				'\npageVal==>'+inputPage.val()
			);
			
			/* AJAX 시작 */
			$.ajax({
				url : "artListSort.do",
				type : "GET",
				dataType : "JSON",
				data : {
					"inputSort" : inputSort.val(),
					"inputTag" : inputTag.val(),
					"inputLoc" : inputLoc.val(),
					"inputGen" : inputGen.val(),
					"inputPage" : inputPage.val(),
				},
				success : function(data){
					var html = "";
					var listCnt = 0;
					
					for(i=0;i<data.length;i++){
						listCnt = data[i].listCnt;
					}
					
					console.log(listCnt);
					
					if(listCnt > 0){
						for(i=0;i<listCnt;i++){
							/* html += "<div class='list_div' style='height: 540px;'>"; */
							html += "<div class='content_list_div'>";
							html += "<a href='/doArtShow/client/exhibition/ExContentView.do?exhID=" + data[i].exhID + "' id='ExContentView'>";
							html += "<img src='/doArtShow/exhibitionImages/" + data[i].imageFile1 + "'/><br>";
							html += "<div style='padding: 10px;'>";
							html += "<b style='font-size:12pt;'>" + data[i].exhName + "</b><br>";
							html += data[i].exhPlace + "<br>";
							html += data[i].exhStartDate + "&nbsp;~&nbsp;" + data[i].exhEndDate + "</a>";
							html += "</div>";
							/* html += "</div>"; */
						}
						
						var pagingNum = parseInt(inputPage.val() + 1);
						
						if(listCnt < 15){
							console.log("listCnt < 15");
							$("#moreBtn_div").hide();
						}else {
							console.log("listCnt > 15");
							console.log("pagingNum : " + pagingNum);
							$("#page_num").val(pagingNum);
							console.log("inputpage : " + inputPage.val());
						}
					}else{
						html += "<div id='pDiv'>";
						html += "<center>진행중인 전시가 없습니다!</center><br>";
						html += "<div align='center'>";
						html += "<a class='btn' href='location.replace('/doArtShow')'>메인으로 돌아가기</a>";
						html += "</div>";
						html += "</div>"
						
						$("#moreBtn_div").hide(); 
					}
					
					$("#content_list").html(html);
				},
				error : function(request, status, error){
					var msg = "ERROR : <br>"
						msg += request.status +"<br>"+ request.responseText +"<br>"+ error;
					console.log(msg);
				}
			});
		});
		
		
		/* 더보기버튼 */
		$("#more_btn").click(function(){
			var className = $(this).attr('class');			
			var thisId = $(this).attr('id');
			var inputSort = $('#sort_num');
			var inputTag = $('#tag_num');
			var inputLoc = $('#loc_num');
			var inputGen = $('#gen_num');
			var inputPage = $('#page_num');
			
			switch (className) {
			case 'ctg artSort':inputSort.val(parseInt(thisId));
				$('.ctg.artSort').removeClass("selected");
				$(this).addClass("selected");
				break;

			case 'ctg tag':inputTag.val(parseInt(thisId));
				$('.ctg.tag').removeClass("selected");
				$(this).addClass("selected");
				break;

			case 'ctg loc':inputLoc.val(parseInt(thisId));
				$('.ctg.loc').removeClass("selected");
				$(this).addClass("selected");
				break;

			case 'ctg gen':inputGen.val(parseInt(thisId));
				$('.ctg.gen').removeClass("selected");
				$(this).addClass("selected");
				break;
			default:
				break;
			}
			
			console.log(
				'sortVal==>'+inputSort.val()+
				'\ntagVal==>'+inputTag.val()+
				'\nlocVal==>'+inputLoc.val()+
				'\ngenVal==>'+inputGen.val()+
				'\npageVal==>'+inputPage.val()
			);
			
			/* AJAX 시작 */
			$.ajax({
				url : "artListSort.do",
				type : "GET",
				dataType : "JSON",
				data : {
					"inputSort" : inputSort.val(),
					"inputTag" : inputTag.val(),
					"inputLoc" : inputLoc.val(),
					"inputGen" : inputGen.val(),
					"inputPage" : inputPage.val(),
				},
				success : function(data){
					var html = "";
					var listCnt = 0;
					
					for(i=0;i<data.length;i++){
						listCnt = data[i].listCnt;
					}
					
					for(i=0;i<listCnt;i++){
						/* html += "<div class='list_div'  style='height: 540px;'>"; */
						html += "<div class='content_list_div'>";
						html += "<a href='/doArtShow/client/exhibition/ExContentView.do?exhID=" + data[i].exhID + "' id='ExContentView'>";
						html += "<img src='/doArtShow/exhibitionImages/" + data[i].imageFile1 + "'/><br>";
						html += "<div style='padding: 10px;'>";
						html += "<b style='font-size:12pt;'>" + data[i].exhName + "</b><br>";
						html += data[i].exhPlace + "<br>";
						html += data[i].exhStartDate + "&nbsp;~&nbsp;" + data[i].exhEndDate + "</a>";
						html += "</div>";
						/* html += "</div>"; */
					}
						
					var pagingNum = parseInt(inputPage.val() + 1);
					
					if(listCnt < 15){
						console.log("listCnt < 15");
						$("#moreBtn_div").hide(); 
					}else {
						console.log("listCnt > 15");
						console.log("pagingNum : " + pagingNum);
						$("#page_num").val(pagingNum);
						console.log("inputpage : " + inputPage.val());
					}
					
					$(html).appendTo("#content_list").children().last();
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