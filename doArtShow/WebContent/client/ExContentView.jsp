<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<jsp:include page="../module/1doctype_head.jsp"></jsp:include>
	
<body>
 	
 	<jsp:include page="../module/2body_first.jsp"></jsp:include>

	<!-- 모달로 변경 예정 -->
	<!-- <div class="modal" id="ExcontentModal">
    	<div class="modal-dialog modal-xl modal-dialog-scrollable">
    		<div class="modal-content">
      
	        	Modal Header
	        	<div class="modal-header">
	        		<h4 class="modal-title">Modal Heading</h4>
	          		<button type="button" class="close" data-dismiss="modal">x</button>
	        	</div> -->
	        
		        <!-- Modal body -->
		        <div class="modal-body">
		        	<div class="container">
						<div>
							<h2><b>${listOne.exhName}</b></h2>
							<h4>${listOne.artistName}</h4>
							<hr>
						</div>
						<div>
							<table border="1">
								<tr>
									<td rowspan="7">
										<img src="/doArtShow/sampleImages/${listOne.imageFile1}" style="height: 450px; width: 330px;"/>
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
							</table>
						</div>
						<br>
						<div>
							<div id="myHist">
								<a id="wishBtn1">
									<i class="fa far fa-heart"></i><br>
									<label>가고싶어요</label>
								</a>
								<a id="wishBtn2"><!-- 아이콘만 변경되게 바꿀것 -->
									<i class="fa fas fa-heart"></i><br>
									<label>가고싶어요</label>
								</a>
								<a id="visitBtn">
									<i class="fa fas fa-check"></i><br>
									<label>다녀왔어요</label>
								</a>
								<a id="reviewBtn">
									<i class="fa fas fa-pencil-alt"></i><br>
									<label>리뷰작성</label>
								</a>
								<a>
									<i class="fa fas fa-share-alt"></i><br>
									<label>공유</label>
								</a>
							</div>
							<!-- <button type="button" id="wishBtn1" value="wishArt"><i class="fa far fa-heart"></i></button>누르기 전
							<button type="button" id="wishBtn2" value="wishArt"><i class="fa fas fa-heart"></i></button>누른 후
							
							<button type="button" id="visitBtn" value="visitArt"><i class="fa fas fa-check"></i></button>누르기 전							
							<button type="button" id="reviewBtn" data-toggle="modal" data-target="#revWriteModal" style="display: hidden;"><i class="fa fas fa-pencil-alt"></i></button>누른 후(hidden으로 숨겨놨다가 클릭하면 보여자게)
							
							<button type="button" class="btn btn-default"><i class="fa fas fa-share-alt"></i></button> -->
						</div>
						<br>
						<div style="width: 100%; height: 1500px;">${listOne.exhContent}</div>
						<br>
						<!-- 리뷰 보여지는 부분 -->
						
					</div>
		        </div>
		        
		        <!-- Modal footer -->
		  <!--  <div class="modal-footer">
		        	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        </div>
		        
    		</div>
	   	</div>
	</div> -->
	
	
	<script>
		$(function(){
			$("#wishBtn1").click(function(){
				
			})
		});
		
		$(function(){
			$("#visitBtn").click(function(){
				$("#reviewBtn").show();
			})
		})
	</script>

	<jsp:include page="../module/3body_last.html"></jsp:include>

</body>
</html>