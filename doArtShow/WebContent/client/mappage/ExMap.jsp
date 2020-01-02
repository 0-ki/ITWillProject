<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/module/1doctype_head.jsp"></jsp:include>
<body>
<jsp:include page="/module/2body_first.jsp"></jsp:include>

<div class="container">
<div id="map" style="width:100%;height:84vh;"></div>
</div>

<jsp:include page="/module/3body_last.html" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3f954d79af6a536ec76db999e7f2ba5b&libraries=clusterer"></script>


<script>
var lists='<c:forEach var="lists" items="${mapLists}" ><c:out value="${lists.exhPlaceAddr1}" /></c:forEach>';
console.log(lists);
</script>


<script>
/* {
  "positions": [
    {
      "lat": 37.27943075229118,
      "lng": 127.01763998406159
    }
  ]
}
*/
</script>



<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
    level: 12 // 지도의 확대 레벨
};  
var map = new kakao.maps.Map(mapContainer, mapOption);


// 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 10 // 클러스터 할 최소 지도 레벨 
});


// 데이터를 가져오기 위해 jQuery를 사용합니다
// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
$.get("clien/mappage/chicken.json", function(data) {
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    var markers = $(data.positions).map(function(i, position) {
        return new kakao.maps.Marker({
            position : new kakao.maps.LatLng(position.lat, position.lng)
        });
    });

    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(markers);
});












	</script>
</body>
</html>