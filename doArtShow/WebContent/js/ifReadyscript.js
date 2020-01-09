$(document).ready(function() {
	$('.intro-heading').slick({
		infinite : true,
		slidesToShow : 3,
		slidesToScroll : 3,
		adaptiveHeight : true
	});
	/*autoplay : true,
	arrows : true,
		autoplaySpeed : 2000,*/
	/*pauseOnHover : false,*/
	
	// 페이지를 최상단으로 부드럽게 이동
	$('#backtop').click(function(){
		$('html, body').animate({scrollTop:0}, 'slow');
	    return false;
	  });
		  
	
	// 로그인 모달 활성화	
	$("#myBtn").click(function() {
		$("#myModal").modal({
			backdrop : true
		});
	});
	
}); /* end of ready script */

