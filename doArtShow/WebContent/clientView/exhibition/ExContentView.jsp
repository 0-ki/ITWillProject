<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
	
<body>
 	
 	<jsp:include page="../../module/2body_first.jsp"></jsp:include>
 		
	<div class="container">
		<div>
			<h2 id="exhTitle"><b>${listOne.exhName}</b></h2>
			<h4>${listOne.artistName}</h4>
		</div>
		<div>
			<table class="table nanum">
				<tr>
					<td rowspan="7">
						<img src="/doArtShow/ExbitionImages/${listOne.imageFile1}" id="exhImage" style="height: 450px; width: 330px;"/>
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
							<a href="javascript:" id="wishBtn" style="color: #3d3d3d;"> <!-- wishArt_func(); -->
								<i class="fa fa-heart-o fa-2x"></i><br>
								<label>가고싶어요</label>
							</a>
								<!-- 
								가고싶어요 클릭하면 채워진 하트 이모티콘으로 변경
								<i class="fa fa-heart fa-2x"></i>
								-->
							<a href="javascript:" id="visitBtn" style="color: #3d3d3d;"> <!-- visitArt_func(); -->
								<i class="fa fa-check fa-2x"></i><br>
								<label>다녀왔어요</label>
							</a>
							<a href="javascript:" id="reviewBtn" style="color: #3d3d3d; visibility: hidden;"> <!-- 평소에 숨겨져있다가 다녀왔어요 클릭하면 리뷰작성버튼 show로 변경 -->
								<i class="fa fa-pencil fa-2x"></i><br> 
								<label>리뷰작성</label>
							</a>
						</div>
						<div class="dropdown dropright" style="display:inline-flex;">
							<a href="#shareModal" id="shareBtn" class="dropdown-toggle" data-toggle="dropdown" style="color: #3d3d3d;">
								<i class="fa fa-share-alt fa-2x"></i><br>
								<label>공유</label>
							</a>
							<div class="dropdown-menu">
	                    		<a class="dropdown-item" href="javascript:sendLinkFaceBook()" title="페이스북으로 공유하기"><img src="/doArtShow/resourcesImages/sns_face.png" width="36" alt="FaceBook"></a>
	                    		<a class="dropdown-item" href="javascript:sendLinkTwitter()" title="트위터로 공유하기"><img src="/doArtShow/resourcesImages/sns_tw.png" width="36" alt="Twitter"></a>
	                    		<a class="dropdown-item" href="javascript:sendLinkNaver()" title="네이버로 공유하기"><img src="/doArtShow/resourcesImages/sns_naver.png" width="36" alt="Naver"></a>
	                    		<a class="dropdown-item" href="javascript:sendLinkKakao()" id="kakao-link-btn" title="카카오톡으로 공유하기"><img src="/doArtShow/resourcesImages/sns_ka.png" width="36" alt="KakaoTalk"></a>  	 
	                    	</div>
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
			
		
		function sendLinkFaceBook(){
		    var facebook_share_url = "https://www.facebook.com/sharer/sharer.php?u=" + encodeURI(document.location.href) + "&t=" + encodeURI('${listOne.exhName} 보러갈래?');
		    window.open(facebook_share_url,
		                'Share on Facebook',
		                'scrollbars=no, width=500, height=500');
		}
		function sendLinkTwitter(){
		    var twitter_share_text = encodeURI('${listOne.exhName} 보러갈래?');
		    var twitter_share_url = encodeURI(document.location.href);
		    window.open("https://twitter.com/share?text=" + twitter_share_text + "&url=" + twitter_share_url,
		                'Share on Twitter',
		                'scrollbars=no, width=500, height=500');
		}
		function sendLinkNaver(){
		    var raw_url = document.location.href;
		    var raw_title = '${listOne.exhName} 보러갈래?';
		    var naver_root_url = "http://share.naver.com/web/shareView.nhn?url="
		    var naver_share_url = naver_root_url + encodeURIComponent(raw_url) + "&title=" + encodeURIComponent(raw_title);
		    window.open(naver_share_url,
		                'Share on Naver',
		                'scrollbars=no, width=500, height=500');    
		}
		/* Kakao.init('3f954d79af6a536ec76db999e7f2ba5b'); */ 
		function sendLinkKakao(){
		console.log('안녕?');
			Kakao.Link.sendDefault({
				objectType: 'feed',
				content: {
					title: '${listOne.exhName} 보러갈래?',
					description: '나만의 인생전시 찾아서, 전시:해',
					imageUrl: 'https://blogfiles.pstatic.net/MjAyMDAxMDJfMTgg/MDAxNTc3OTUzMDM0NTg0.mUQhLuECjSx5lvE4HxOz8je68sHTSsz5NgDtmw47cfkg.sDN5cQYDWuQVLKI9IU_s7qXwlDgwNS_dxCdXbfaMrrwg.PNG.rladudrl286/%EC%A0%84%EC%8B%9C%ED%95%B43.png',
					link: {
						mobileWebUrl: document.location.href,
						webUrl: document.location.href
					}
				},
				buttons: [
					{
						title: '링크열기',
						link: {
							mobileWebUrl: document.location.href,
							webUrl: document.location.href
						}
					}
				]
			});
		}
	</script>

	<jsp:include page="../../module/3body_last.html"></jsp:include>
	
</body>
</html>
