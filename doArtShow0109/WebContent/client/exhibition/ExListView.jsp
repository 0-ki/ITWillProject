<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<jsp:include page="/module/1doctype_head.jsp"></jsp:include>
	
<body>
	
 	<jsp:include page="/module/2body_first.jsp"></jsp:include>

<style>
	/* 정렬 */
	*:before,
	*:after {
	  box-sizing: border-box;
	  transition: 0.3s ease-in-out;
	  z-index: -1;
	}
	
 	#sortBox {
	  display: inline-flex;
      justify-content: center;
	} 
	.selected{
	  background-color: aqua;
	}
	
/* 	.artSort {
	  text-decoration: none;
	  line-height: 80px;
	  color: black;
	  text-align: center;
	  font-size: 18px;
	  margin-bottom: 20px;
      margin-left: auto;
      margin-right: auto;
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
	  color: #ad3da1;
	}
	
	.artSort::before, 
	.artSort::after {
	  content: '';
	  position: absolute;
	  top: 0;
	  right: 0;
	  bottom: 0;
	  left: 0;
	}
	.artSort::before {
	  right: -50px;
	  border-right: 50px solid transparent;
	  border-bottom: 80px solid #8e1882; 
	  -webkit-transform: translateX(-100%);
	          transform: translateX(-100%);
	}
	.artSort::after {
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
	.artSort:hover::before {
	  -webkit-transform: translateX(-49%);
	          transform: translateX(-49%);
	}
	.artSort:hover::after {
	  -webkit-transform: translateX(49%);
	          transform: translateX(49%);
	}
 */
	/* 태그 */	
	#ctgList li {
	  display: inline-flex;
	  list-style-type: none;
	  margin-left: 10px;
	  color: #f7f7f7;
	  font-family: 'Noto Sans KR', sans-serif !important;
	  font-size: 15px;
	}
	
	#ctgList{
	  padding-left: 5em;
      padding-right: 2em;
	}
	
	li b {
	  padding-right: 80px;
	}
	
	#gradient {
	  background: linear-gradient(135deg, #c71eae 0%, #db8344 31%, #c73653 71%, #6e38a8 100%);
	  font-family: 'Noto Sans KR', sans-serif !important;
	  justify-content: center;
	  align-items: center;
	  align-content: center;
	  padding: 20px;
	  padding-right: 50px;
	  padding-left: 50px;
	  border-radius: 10px;
	  margin-left: 70px;
      margin-right: 70px;
	}
/* 	
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
	  letter-spacing: 1px;
	  
	  transition-property: all;
	  transition-duration: .6s;
	  transition-timing-function: ease;	
	}
	
	.ctg::after{
	  content: "";
	  display: block;
	  position: absolute;
	}
	.ctg::before{
	  content: "";
	  display: block;
	  position: absolute;
	}
	
	.ctg:hover,
	.ctg:active {
	  letter-spacing: 5px;
	  cursor: pointer;
	}
	
	.ctg::after {
	  left: 50%;
  	  bottom: -0.5rem;
  	  width: 0%;
  	  height: 0.2rem;
  	  background-color: #f7f7f7;
  	  transform: translateX(-50%);
  	  transition: all 0.3s;
	}
	.ctg:hover::after{
	  width: 100%;
	} */
	
	/* 출력되는 div 게시물 */
	#content_div {
    	text-align: center;
    	padding-left: 5%;
    	padding-right: 5%;
    	padding-top: 5em;
    }
    
    
	#content_list{
		display: -webkit-inline-box;
    	flex-wrap: wrap;
    	-webkit-box-pack: center;
    	width: 100%;
	}
	
	#content_list_div{ 
		margin-left: 15px;
	    margin-right: 15px;
	    margis-top: 20px;
	    margin-bottom: 20px;
	    width: 275px;
	    height: 450px;
	    text-align: left;
	    border-radius: 20px;
	}
	
	#content_list_div img{ 
		border-radius: 20px;
	}
	
	#content_list_div a{ 
		color: #474747;
		text-decoration: none;
	}
	
	#content_list_div:hover{ 
		-moz-box-shadow: 0px 12px 20px rgba(54, 24, 79, 0.5);
		-webkit-box-shadow: 0px 12px 20px rgba(54, 24, 79, 0.5);
		box-shadow: 0px 12px 20px rgba(54, 24, 79, 0.5);
		transition: all .3s;
	}
	
	#content_list_div a:hover{ 
		color: #8a8a8a;
		text-decoration: none;
	}
	
	#moreBtn_div{
		padding: 30px;
	}
</style>
	
      <input type="text" hidden id="sort_num" value="0"/>
      <input type="text" hidden id="tag_num" value="0"/>
      <input type="text" hidden id="loc_num" value="0"/>
      <input type="text" hidden id="gen_num" value="0"/>
      <input type="text" hidden id="page_num" value="0"/>
      
	<div class="container" id="mainContainer">
		<div id="sortBox" style="display: inline-flex;"><!-- 전체전시보기는 0이며 처음부터 선택 돼 있음. -->
			<div class="ctg artSort" id="0"><b>전체 전시 보기</b></div>
			<div class="ctg artSort" id="1"><b>진행중인 전시 보기</b></div>
			<div class="ctg artSort" id="2"><b>인기 전시 보기</b></div>
			<div class="ctg artSort" id="3"><b>곧 종료하는 전시 보기</b></div>
			<div class="ctg artSort" id="4"><b>종료 된 전시 보기</b></div>
		</div>
		<div id="gradient">
			<ul id="ctgList"><!-- 미선택시 0, 선택시 1번부터~ -->
				<li><i class="fa fa-slack"></i>&nbsp;<b>태그로 찾을래요</b></li>
				<li id="1" class="ctg tag" name="데이트">#데이트</li>
				<li id="2" class="ctg tag" name="인생샷">#인생샷</li>
				<li id="3" class="ctg tag" name="친구와함께">#친구와함께</li>
				<li id="4" class="ctg tag" name="나혼자문화생활">#나혼자문화생활</li>
				<li id="5" class="ctg tag" name="부모님과함께">#부모님과함께</li>
				<li id="6" class="ctg tag" name="아이와함께">#아이와함께</li>
				<li id="7" class="ctg tag" name="교육전시">#교육전시</li>
			</ul>
			<ul id="ctgList">
				<li><i class="fa fa-map"></i>&nbsp;<b>위치로 찾을래요</b></li>
				<li id="1" class="ctg loc" name="서울">서울</li>
				<li id="2" class="ctg loc" name="인천/경기">인천/경기</li>
				<li id="3" class="ctg loc" name="대전/충청">대전/충청</li>
				<li id="4" class="ctg loc" name="광주/전라">광주/전라</li>
				<li id="5" class="ctg loc" name="부산/경상">부산/경상</li>
				<li id="6" class="ctg loc" name="강원">강원</li>
				<li id="7" class="ctg loc" name="제주">제주</li>
			</ul>
			<ul id="ctgList">
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
							html += "<div id='content_list_div'>";
							html += "<a href='/doArtShow/client/exhibition/ExContentView.do?exhID=" + data[i].exhID + "' id='ExContentView' style='width: 290px; height: 470px;'>";
							html += "<img src='/doArtShow/exhibitionImages/" + data[i].imageFile1 + "' style='height: 370px; width: 275px;'/><br>";
							html += "<b>" + data[i].exhName + "</b><br>";
							html += data[i].exhPlace + "<br>";
							html += data[i].exhStartDate + "&nbsp;~&nbsp;" + data[i].exhEndDate + "</a>";
							html += "</div>";
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
						html += "<a class='btn' href='/index.jsp'>메인으로 돌아가기</a>";
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
						html += "<div id='content_list_div'>";
						html += "<a href='/doArtShow/client/exhibition/ExContentView.do?exhID=" + data[i].exhID + "' id='ExContentView' style='width: 290px; height: 470px;'>";
						html += "<img src='/doArtShow/exhibitionImages/" + data[i].imageFile1 + "' style='height: 370px; width: 275px;'/><br>";
						html += "<b>" + data[i].exhName + "</b><br>";
						html += data[i].exhPlace + "<br>";
						html += data[i].exhStartDate + "&nbsp;~&nbsp;" + data[i].exhEndDate + "</a>";
						html += "</div>";
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
		
		
		/* Box의 그라디언트 색상 */
		var colors = new Array(
		  [62,35,255],
		  [60,255,60],
		  [255,35,98],
		  [45,175,230],
		  [255,0,255],
		  [255,128,0]);

		var step = 0;
		//color table indices for: 
		// current color left
		// next color left
		// current color right
		// next color right
		var colorIndices = [0,1,2,3];

		//transition speed
		var gradientSpeed = 0.002;

		function updateGradient()
		{
		  
		  if ( $===undefined ) return;
		  
		var c0_0 = colors[colorIndices[0]];
		var c0_1 = colors[colorIndices[1]];
		var c1_0 = colors[colorIndices[2]];
		var c1_1 = colors[colorIndices[3]];

		var istep = 1 - step;
		var r1 = Math.round(istep * c0_0[0] + step * c0_1[0]);
		var g1 = Math.round(istep * c0_0[1] + step * c0_1[1]);
		var b1 = Math.round(istep * c0_0[2] + step * c0_1[2]);
		var color1 = "rgb("+r1+","+g1+","+b1+")";

		var r2 = Math.round(istep * c1_0[0] + step * c1_1[0]);
		var g2 = Math.round(istep * c1_0[1] + step * c1_1[1]);
		var b2 = Math.round(istep * c1_0[2] + step * c1_1[2]);
		var color2 = "rgb("+r2+","+g2+","+b2+")";

		 $('#gradient').css({
		   background: "-webkit-gradient(linear, left top, right top, from("+color1+"), to("+color2+"))"}).css({
		    background: "-moz-linear-gradient(left, "+color1+" 0%, "+color2+" 100%)"});
		  
		  step += gradientSpeed;
		  if ( step >= 1 )
		  {
		    step %= 1;
		    colorIndices[0] = colorIndices[1];
		    colorIndices[2] = colorIndices[3];
		    
		    //pick two new target color indices
		    //do not pick the same as the current one
		    colorIndices[1] = ( colorIndices[1] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;
		    colorIndices[3] = ( colorIndices[3] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;
		    
		  }
		}

		setInterval(updateGradient,10);
		
		/* 눌른 버튼에 대해 css 적용 및 hidden input에 기록 */
		

		
	</script>
	
	
</body>
</html>