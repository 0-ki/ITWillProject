<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="나만의 전시를 만들어가자! 전시 등록과 가장 인기 있는 전시를 한 눈에">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title> 전시:해 </title>
    <!-- Bootstrap 4 가져오기 -->
    <link href="/doArtShow/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <!-- 직접 작성한 css 및 폰트 CDN 방식 -begin -->
    <link href="/doArtShow/css/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/doArtShow/libs/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="/doArtShow/libs/slick/slick-theme.css" />
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <!--font-family: 'Noto Sans KR', sans-serif;-->
    <!-- 직접 작성한 css 및 폰트 CDN 방식 -end -->

    <!-- 직접 작성한 css 및 폰트 CDN 방식 by Hojeong -begin -->
   <link rel="stylesheet" href="/doArtShow/css/HJStyle.css" type="text/css">
    <!-- 직접 작성한 css 및 폰트 CDN 방식 by Hojeong -end -->
    
    <!-- javascript used by Hojeong : begin -->
    <script src="/doArtShow/js/exhFunction.js"></script>
     <!--<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>--><!-- sample5_execDaumPostcode() -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>  <!-- sample6_execDaumPostcode() -->
    <!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->  <!-- exeDaumPostcode()-->
	<script src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=c5326277ad64b2569191adafedd5fbbc&libraries=services"></script>
	<script src="../js/jquery-3.4.1.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<!-- javascript used by Hojeong : end -->

    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!--     	<script>
	Kakao.init('3f954d79af6a536ec76db999e7f2ba5b');
    function loginWithKakao() {
      console.log('login카카오 호출됨!');
    	// 로그인 창을 띄웁니다.
      Kakao.Auth.loginForm({
    	  success: function(authObj) {
              alert(JSON.stringify(authObj));
            },
            fail: function(err) {
              alert(JSON.stringify(err));
        }
      });
    };
	</script> -->
    
    
</head>