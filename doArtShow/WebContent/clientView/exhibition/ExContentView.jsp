<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
	
<body>
 	
 	<jsp:include page="../../module/2body_first.jsp"></jsp:include>
 		
	<div class="container">
		<div>
			<h2><b>${listOne.exhName}</b></h2>
			<h4>${listOne.artistName}</h4>
		</div>
		<div>
			<table class="table nanum table-hover">
				<tr>
					<td rowspan="7">
						<img src="/doArtShow/ExbitionImages/${listOne.imageFile1}" style="height: 450px; width: 330px;"/>
					</td>
					<td>&nbsp;기간 : ${listOne.exhStartDate}&nbsp;~&nbsp;${listOne.exhEndDate}</td>
				</tr>
				<tr>
					<td style="width: 80%">&nbsp;전시관 : ${listOne.exhPlace}</td>
				</tr>
				<tr>
					<td>&nbsp;주소 : ${listOne.exhPlaceAddr1}</td>
				</tr>
				<tr>
					<td>&nbsp;시간 : ${listOne.opTime}</td>
				</tr>
				<tr>
					<td>&nbsp;입장료 : ${listOne.admFee}</td>
				</tr>
				<tr>
					<td>&nbsp;문의 : ${listOne.tel}</td>
				</tr>
				<tr>
					<td>&nbsp;사이트 : ${listOne.exhUrl}</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="myHist">
							<a href="javascript:" id="wishBtn1" style="color: #3d3d3d;"> <!-- wishArt_func(); -->
								<i class="fa fa-heart-o fa-2x"></i><br>
								<label>가고싶어요</label>
							</a>
								<!-- 
								가고싶어요 클릭하면 채워진 하트 이모티콘으로 변경
								<i class="fa fa-heart fa-2x"></i>
								-->
							<a href="" id="visitBtn" style="color: #3d3d3d;"> <!-- visitArt_func(); -->
								<i class="fa fa-check fa-2x"></i><br>
								<label>다녀왔어요</label>
							</a>
							<a href="" id="reviewBtn" style="color: #3d3d3d; visibility: hidden;"> <!-- 평소에 숨겨져있다가 다녀왔어요 클릭하면 리뷰작성버튼 show로 변경 -->
								<i class="fa fa-pencil fa-2x"></i><br> 
								<label>리뷰작성</label>
							</a>
							<a href="shareBtn" id="shareBtn" data-toggle="modal" style="color: #3d3d3d;">
								<i class="fa fa-share-alt fa-2x" aria-hidden="true"></i><br>
							</a>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="height: 1500px;">${listOne.exhContent}</td>
				</tr>
			</table>
		</div>
		<br>
		<!-- 리뷰 보여지는 부분 (Bootstrap 4 Carousel 기능으로!) -->
	</div>
		        
	
	<script>
		/* 가고싶어요 버튼 눌렀을때 적용하는 함수 */
		$(document).ready(function(){
				
		});
		
		/* 갔다왔어요 버튼 눌렀을때 적용하는 함수 */
		$(document).ready(function(){
				
		});
			
		/* 리뷰작성 버튼 눌렀을때 리뷰작성모달 불러오는 함수 */
		$(document).ready(function(){
			$("#reviewBtn").click(function(){
				$("#revWriteModal").modal({
					backdrop: true
				});
			});
		});
			
		/* 공유버튼 모달 불러오는 함수 */
		$(document).ready(function(){
			$("#shareBtn").click(function(){
				$("#shareModal").modal({
					backdrop: true
				});	
			});
		});
	</script>

	<jsp:include page="../../module/3body_last.html"></jsp:include>
	
</body>
</html>
