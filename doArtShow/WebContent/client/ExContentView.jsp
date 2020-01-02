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
							<h2>${listOne.exhName}</h2>
							<h5>${listOne.artistName}</h5>
						</div>
						<div>
							<table border="1">
								<tr>
									<td rowspan="7">
										<img src="/doArtShow/sampleImages/${listOne.imageFile1}" style="height: 450px; width: 330px;"/>
									</td>
									<td>기간 : ${listOne.exhStartDate}&nbsp;~&nbsp;${listOne.exhEndDate}</td>
								</tr>
								<tr>
									<td>전시관 : ${listOne.exhPlace}</td>
								</tr>
								<tr>
									<td>주소 : ${listOne.exhPlaceAddr1}</td>
								</tr>
								<tr>
									<td>시간 : ${listOne.opTime}</td>
								</tr>
								<tr>
									<td>입장료 : ${listOne.admFee}</td>
								</tr>
								<tr>
									<td>문의 : ${listOne.tel}</td>
								</tr>
								<tr>
									<td>사이트 : ${listOne.exhUrl}</td>
								</tr>
							</table>
						</div>
						<div>
							<button>가고싶어요</button>
							<button>갔다왔어요</button>
							<button type="button" data-toggle="modal" data-target="#revWriteModal">리뷰쓰기</button>
							<button>공유하기</button>
						</div>
						<div>${listOne.exhContent}</div>
						<div>리뷰 슬라이드</div>
					</div>
		        </div>
		        
		        <!-- Modal footer -->
		  <!--  <div class="modal-footer">
		        	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        </div>
		        
    		</div>
	   	</div>
	</div> -->

	<jsp:include page="../module/3body_last.html"></jsp:include>

</body>
</html>