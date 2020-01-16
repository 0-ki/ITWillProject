<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/module/1doctype_head.jsp"></jsp:include>
<body>
<jsp:include page="/module/2body_first.jsp"></jsp:include>

<style>

    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -138px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {text-align:center;font-family: 'Noto Sans KR', sans-serif; overflow: hidden; text-overflow:ellipsis; padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {font-family: 'Noto Sans KR', sans-serif; font-size: 1.3em; overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-family: 'Noto Sans KR', sans-serif; font-size: 1.2em;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}

</style>

<div class="container">
<div id="map" style="width:100%;height:72vh; margin-bottom: 200px;"></div>
</div>



<jsp:include page="/module/3body_last.html" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3f954d79af6a536ec76db999e7f2ba5b&libraries=services,clusterer,drawing" ></script>


<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(37.2683, 127.6358), // 지도의 중심좌표
    level: 11 // 지도의 확대 레벨
};  
var map = new kakao.maps.Map(mapContainer, mapOption);

/* //일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); */

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


<c:forEach var="lists" items="${mapLists}" varStatus="vs">


// 주소-좌표 변환 객체를 생성합니다
var geocoder<c:out value="${vs.index}"/> = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder<c:out value="${vs.index}"/>.addressSearch('<c:out value="${lists.exhPlaceAddr1}"/>',function(result, status) {

	
    imageSize = new kakao.maps.Size(34, 39), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(12, 39)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage('/doArtShow/resourcesImages/mapmarker.png', imageSize, imageOption);
	
	
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords,
            image: markerImage
        });
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        /* map.setCenter(coords); */
         var content = document.createElement('div');
         /* <div class="close" id="closer" title="닫기"></div> */
        
        content.innerHTML = 
'<div class="wrap">' + 
'    <div class="info">' + 
'        <div class="title" id="title">' + 
'            <c:out value="${lists.exhName}"/>' + 
'            <div class="" onclick="closeOverlay()" title="닫기"></div>' + 
'        </div>' + 
'        <div class="body">' + 
'            <div class="img">' +
'                <img src="/doArtShow/exhibitionImages/${lists.imageFile1}" width="73" height="70">' +
'           </div>' + 
'            <div class="desc">' + 
'                <div class="ellipsis">${lists.artistName}</div>' + 
'                <div class="jibun ellipsis">${lists.exhPlace}</div>' + 
'                <div><a href="<%=request.getContextPath()%>/client/exhibition/ExContentView.do?exhID=${lists.exhID}" target="_blank" class="link">상세보기</a></div>' + 
'            </div>' + 
'        </div>' + 
'    </div>' +    
'</div>';

var closeBtn = document.createElement('div');
closeBtn.appendChild(document.createTextNode('X'));
closeBtn.className+='close';
closeBtn.style.position='absolute';
closeBtn.style.marginTop='-76px';
closeBtn.style.right='-140px';
closeBtn.onclick = function() { overlay.setMap(null); console.log(closeBtn.className)};
content.appendChild(closeBtn);


		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			overlay.setMap(map);
		});
    
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var overlay = new kakao.maps.CustomOverlay({
			content: content,
		 	position: marker.getPosition()
		});

     } 
    
});    

</c:forEach>















 

/* 
// 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 10 // 클러스터 할 최소 지도 레벨 
});
*/


</script>



</body>
</html>