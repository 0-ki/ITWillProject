<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
	
<body>
 	<jsp:include page="../../module/2body_first.jsp"></jsp:include>
	
	<div class="container">
		<div id="ctgBox">
			<ul id="ctgList">
				<li><b>태그로 찾을래요</b></li>
				<li><a href="#데이트" id="ctg">#데이트</a></li>
				<li><a href="#인생샷" id="ctg">#인생샷</a></li>
				<li><a href="#친구와함께" id="ctg">#친구와함께</a></li>
				<li><a href="#나혼자문화생활" id="ctg">#나혼자문화생활</a></li>
				<li><a href="#부모님과함께" id="ctg">#부모님과함께</a></li>
				<li><a href="#아이와함께" id="ctg">#아이와함께</a></li>
				<li><a href="#교육전시" id="ctg">#교육전시</a></li>
			</ul>
			<ul id="ctgList">
				<li><b>위치로 찾을래요</b></li>
				<li><a href="#서울" id="ctg">서울</a></li>
				<li><a href="#인천경기" id="ctg">인천/경기</a></li>
				<li><a href="#대전충청" id="ctg">대전/충청</a></li>
				<li><a href="#광주전라" id="ctg">광주/전라</a></li>
				<li><a href="#부산경상" id="ctg">부산/경상</a></li>
				<li><a href="#강원" id="ctg">강원</a></li>
				<li><a href="#제주" id="ctg">제주</a></li>
			</ul>
			<ul id="ctgList">
				<li><b>장르로 찾을래요</b></li>
				<li><a href="#서양화" id="ctg">서양화</a></li>
				<li><a href="#동양화" id="ctg">동양화</a></li>
				<li><a href="#유화" id="ctg">유화</a></li>
				<li><a href="#조각" id="ctg">조각</a></li>
				<li><a href="#설치미술" id="ctg">설치미술</a></li>
				<li><a href="#미디어아트" id="ctg">미디어아트</a></li>
				<li><a href="#사진" id="ctg">사진</a></li>
				<li><a href="#디자인" id="ctg">디자인</a></li>
				<li><a href="#공예" id="ctg">공예</a></li>
			</ul>
			<div align="right">
        		<select name="sort_index">
        			<option value="">최신 전시</option>
        			<option value="">인기 전시</option>
        			<option value="">곧 끝나는 전시</option>
        		</select>
        	</div>
		</div>	
	</div>
    <br>
    <div id="content_div" class="container">
	    <div id="content_list">  
	    	<c:forEach var="list" items="${lists}">
		    <div id="content_list_div">
		        <a href="<%=request.getContextPath()%>/client/exhibition/ExContentView.do?exhID=${list.exhID}&exhName=${list.exhName}" id="ExContentView" data-toggle="modal"><!-- 아무데나 눌러도 상세페이지로 넘어가게 -->
		        	<img src="/doArtShow/exhibitionImages/${list.imageFile1}" style="height: 370px; width: 275px;"/><br>
		            ${list.exhName}<br>
		            ${list.exhPlace}<br>
		            ${list.exhStartDate}&nbsp;~&nbsp;${list.exhEndDate}
		       	 </a>
		    </div>
		    </c:forEach>
		</div>
		<div id="moreBtn_div" align="center">
			<button type="button" id="more_btn">더보기</button>
		</div>
	</div>
	
	
	<!-- <script>
		$(document).ready(function(){
			$("#ctg").click(function(){
				$.ajax({
					url: "/ExListView.do?exhID=",
					type: "get",
					cashe: false,
					dataType: "json",
					success: function(data){
						$("#list").html(data);
					},
					error : function error(){
						alert("error");
					}
				});
			});
		});
		
	</script> -->
	
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
		
		
		/* ExContentView(모달로 변경) 띄우는 함수 */
		/* $(document).ready(function(){
			$("#ExContentView").click(function(){
				$("#ExcontentModal").modal({
					backdrop: true
				});	
			});
		}); */
		
	</script>

	<jsp:include page="../../module/3body_last.html"></jsp:include>
	
</body>
</html>