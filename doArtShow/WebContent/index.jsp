<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>

<s:setDataSource
	dataSource="jdbc/artshowdb"
    var= "artshow"
    scope="page"/>

<s:query sql=" SELECT ExhID, ExhName , ExhPlace, ImageFile1 FROM artshow ORDER BY RegisterDate DESC LIMIT 9  " var="rs1" dataSource="${artshow}" />
<s:query sql=" SELECT ExhID, ExhName , ExhPlace, ImageFile1 FROM artshow ORDER BY exhreadcount DESC LIMIT 9  " var="rs2" dataSource="${artshow}" />





<jsp:include page="/module/1doctype_head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/doArtShow/libs/swiper/css/swiper.css" />
<link rel="stylesheet" type="text/css" href="/doArtShow/css/indexStyle.css" />
<!-- <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'> -->
<!-- font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif'; -->

<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet"> 
<!-- font-family: 'Jua', sans-serif; -->
<style>

</style>
<body>

<jsp:include page="/module/2body_first.jsp"></jsp:include>

<div style="margin-bottom: 580px;"></div>


<div class="rotating">
<div class="rotating-text">
  <p>전시:해에서 </p>
  <p>
    <span class="word alizarin">지도로  찾아요.</span>
    <span class="word wisteria">내 전시를 알려요.</span>
    <span class="word peter-river">#태그로 둘러봐요.</span>
    <span class="word emerald">최신 전시를 만나요.</span>
    <span class="word sun-flower">영감을 얻어요.</span>
  </p>
</div>
</div>



<div class="mainwall" style="position: absolute; top: 0;">
			<div class="wallpaper">
				<div>
					<div>
						<img id="wallPaper" src="/doArtShow/resourcesImages/mainwall0.jpg" width="100%" height="550px;"/>
					</div>
				</div>
				
			</div>
</div>
<div style="height:80px;">
</div>

		<div class="slider-container">
			<div class="slider-head"><h1 class="slider-h">최근 등록된 전시</h1> <a href="<%=request.getContextPath()%>/client/exhibition/ExListView.do?" class="slider-more">&nbsp;더보기&nbsp;></a></div>
			<div class="swiper-container">
				<div class="swiper-wrapper">
					
			 <c:forEach  var="i" items="${rs1.rows}" varStatus="vs1" >
					<div class="swiper-slide">
						<a href="client/exhibition/ExContentView.do?exhID=${i.ExhID}">
							<div class="slide-content">
							<p class="slide-exhName">${i.ExhName }</p>
							<p class="slide-exhPlace">${i.ExhPlace }</p>
							</div>
							<img src="/doArtShow/exhibitionImages/${i.ImageFile1 }"/>
						</a>
					</div>
				</c:forEach>
 				    
				</div>
				<!-- 스크롤 바  -->
				<div class="swiper-scrollbar" style="width:283px;left:37%;"></div>
				<!-- 좌우 화살표 추가 -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>

			</div>
		</div>
		
		
		
		<div class="slider-container">
		<div class="slider-head"><h1 class="slider-h">지금 주목받는 전시</h1> <a href="<%=request.getContextPath()%>/client/exhibition/ExListView.do?" class="slider-more">&nbsp;더보기&nbsp;></a></div>
			<div class="swiper-container">
				<div class="swiper-wrapper">
					
			 <c:forEach  var="i" items="${rs2.rows}" varStatus="vs1" >
					<div class="swiper-slide">
						<a href="client/exhibition/ExContentView.do?exhID=${i.ExhID}">
							<div class="slide-content">
							<p class="slide-exhName">${i.ExhName }</p>
							<p class="slide-exhPlace">${i.ExhPlace }</p>
							</div>
							<img src="/doArtShow/exhibitionImages/${i.ImageFile1 }"/>
						</a>
					</div>
				</c:forEach>
 				    
				</div>
				<!-- 스크롤 바  -->
				<div class="swiper-scrollbar" style="width:283px;left:37%;"></div>
				<!-- 좌우 화살표 추가 -->
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>

			</div>
		</div>



   <!--  <section id="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="section-title">
                        <h2>클릭하면 modal로 볼 게시물</h2>
                        <p>Our portfolio is the best way to show our work, you can see here a big range of our work. Check them all and you will find what you are looking for.</p>
                    </div>
                </div>
            </div>
            <div class="row row-0-gutter">
                start portfolio item
                <div class="col-md-4 col-0-gutter">
                    <div class="ot-portfolio-item">
                        <figure class="effect-bubba">

                            <figcaption>
                                <h2>Dean & Letter</h2>
                                <p>Branding, Design</p>
                                <a href="#" data-toggle="modal" data-target="#Modal-1">View more</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                end portfolio item
                start portfolio item
                <div class="col-md-4 col-0-gutter">
                    <div class="ot-portfolio-item">
                        <figure class="effect-bubba">
                            <img src="" alt="img02" class="img-responsive" />
                            <figcaption>
                                <h2>Startup Framework</h2>
                                <p>Branding, Web Design</p>
                                <a href="#" data-toggle="modal" data-target="#Modal-2">View more</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                end portfolio item
                start portfolio item
                <div class="col-md-4 col-0-gutter">
                    <div class="ot-portfolio-item">
                        <figure class="effect-bubba">
                            <img src="" alt="img02" class="img-responsive" />
                            <figcaption>
                                <h2>Lamp & Velvet</h2>
                                <p>Branding, Web Design</p>
                                <a href="#" data-toggle="modal" data-target="#Modal-3">View more</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                end portfolio item
            </div>
            <div class="row row-0-gutter">
                start portfolio item
                <div class="col-md-4 col-0-gutter">
                    <div class="ot-portfolio-item">
                        <figure class="effect-bubba">
                            <img src="" alt="img02" class="img-responsive" />
                            <figcaption>
                                <h2>Smart Name</h2>
                                <p>Branding, Design</p>
                                <a href="#" data-toggle="modal" data-target="#Modal-4">View more</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                end portfolio item
                start portfolio item
                <div class="col-md-4 col-0-gutter">
                    <div class="ot-portfolio-item">
                        <figure class="effect-bubba">
                            <img src="" alt="img02" class="img-responsive" />
                            <figcaption>
                                <h2>Fast People</h2>
                                <p>Branding, Web Design</p>
                                <a href="#" data-toggle="modal" data-target="#Modal-5">View more</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                end portfolio item
                start portfolio item
                <div class="col-md-4 col-0-gutter">
                    <div class="ot-portfolio-item">
                        <figure class="effect-bubba">
                            <img src="" alt="img02" class="img-responsive" />
                            <figcaption>
                                <h2>Kites & Stars</h2>
                                <p>Branding, Web Design</p>
                                <a href="#" data-toggle="modal" data-target="#Modal-2">View more</a>
                            </figcaption>
                        </figure>
                    </div>
                </div>
                end portfolio item
            </div>
        </div>end container
    </section> -->


    <section>

        <!--언제 쓸 지 몰라서 ..-->

    </section>

    <section id="contact" class="dark-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="section-title">
                        <h2>문의사항</h2>
                        <p>문의사항을 남겨주세용<br>키키키</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="section-text">
                        <h4>Our Business Office</h4>
                        <p>3422 Street, Barcelona 432, Spain, New Building North, 15th Floor</p>
                        <p><i class="fa fa-phone"></i> +101 377 655 22125</p>
                        <p><i class="fa fa-envelope"></i> mail@yourcompany.com</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="section-text">
                        <h4>Business Hours</h4>
                        <p><i class="fa fa-clock-o"></i> <span class="day">Weekdays:</span><span>9am to 8pm</span></p>
                        <p><i class="fa fa-clock-o"></i> <span class="day">Saturday:</span><span>9am to 2pm</span></p>
                        <p><i class="fa fa-clock-o"></i> <span class="day">Sunday:</span><span>Closed</span></p>
                    </div>
                </div>
                <div class="col-md-6">
                    <form name="sentMessage" id="contactForm" novalidate="">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Name *" id="name" required="" data-validation-required-message="Please enter your name.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Your Email *" id="email" required="" data-validation-required-message="Please enter your email address.">
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Your Message *" id="message" required="" data-validation-required-message="Please enter a message."></textarea>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <button type="submit" class="btn">Send Message</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>



    <!-- Modal for portfolio item 1 -->
    <div class="modal fade" id="Modal-1" tabindex="-1" role="dialog" aria-labelledby="Modal-label-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="Modal-label-1">Dean & Letter</h4>
                </div>
                <div class="modal-body">
                    <img src="" alt="img01" class="img-responsive" />
                    <div class="modal-works"><span>Branding</span><span>Web Design</span></div>
                    <p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for portfolio item 2 -->
    <div class="modal fade" id="Modal-2" tabindex="-1" role="dialog" aria-labelledby="Modal-label-2">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="Modal-label-2">Startup Framework</h4>
                </div>
                <div class="modal-body">
                    <img src="" alt="img01" class="img-responsive" />
                    <div class="modal-works"><span>Branding</span><span>Web Design</span></div>
                    <p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for portfolio item 3 -->
    <div class="modal fade" id="Modal-3" tabindex="-1" role="dialog" aria-labelledby="Modal-label-3">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="Modal-label-3">Lamp & Velvet</h4>
                </div>
                <div class="modal-body">
                    <img src="" alt="img01" class="img-responsive" />
                    <div class="modal-works"><span>Branding</span><span>Web Design</span></div>
                    <p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for portfolio item 4 -->
    <div class="modal fade" id="Modal-4" tabindex="-1" role="dialog" aria-labelledby="Modal-label-4">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="Modal-label-4">Smart Name</h4>
                </div>
                <div class="modal-body">
                    <img src="" alt="img01" class="img-responsive" />
                    <div class="modal-works"><span>Branding</span><span>Web Design</span></div>
                    <p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for portfolio item 5 -->
    <div class="modal fade" id="Modal-5" tabindex="-1" role="dialog" aria-labelledby="Modal-label-5">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="Modal-label-5">Fast People</h4>
                </div>
                <div class="modal-body">
                    <img src="" alt="img01" class="img-responsive" />
                    <div class="modal-works"><span>Branding</span><span>Web Design</span></div>
                    <p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


<jsp:include page="/module/3body_last.html" />
<script src="/doArtShow/libs/swiper/js/swiper.js"></script>
<!-- Initialize Swiper Library Begin - Younggi -->
  <script>
  
/*   function dudrl(){
	  $.ajax({
	      url : "indexContent.do",
	      type : "GET",
	      dataType : "JSON", 
	      success : function(data){
	    	  console.log('안녕 영기들?');
	    	  console.log(data);
	    	  
	    	  if(data. == 0){
	            $("#wishBtn").attr("checked", "checked");
	            alert("가고싶은 전시로 등록되었습니다.\n나의 가고싶은 전시는 마이페이지에서도 확인 가능합니다!")
	         }else if(data.checkWish == 1){
	            $("#wishBtn").removeAttr("checked");
	            alert("가고싶은 전시가 취소되었습니다.");
	         }
	      },
	      error : function(request, status, error){
	    	  console.log('에러났다영기들');
	    	  console.log(error);
	      }
	   });
  }
*/
   
  
  
  var mySwiper = new Swiper ('.swiper-container', {
    // Optional parameters
    direction: 'horizontal',
    spaceBetween: 55,
    slidesPerView: 3,
    slidesPerGroup: 3,
    // 네비 화살표 처리
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    // 스크롤바 처리
     scrollbar: {
      el: '.swiper-scrollbar',
      hide: false,
    },
  });
  
  </script>
<!-- Swiper Library End - Younggi -->




<script>
//최상단 배경이미지 슬라이드 전환 효과
$(function(){

    var imgArray = new Array();
    imgArray[0] = "/doArtShow/resourcesImages/mainwall1.jpg";
    imgArray[1] = "/doArtShow/resourcesImages/mainwall2.jpg";
    imgArray[2] = "/doArtShow/resourcesImages/mainwall3.jpg";
    imgArray[3] = "/doArtShow/resourcesImages/mainwall4.jpg";
    imgArray[4] = "/doArtShow/resourcesImages/mainwall5.jpg";
    var cnt = 0;

    setInterval(function() {
        $('#wallPaper').fadeOut(400,function(){
        $('#wallPaper').attr("src", imgArray[cnt]);
        }).fadeIn(400);
        
        cnt++;
        if (cnt == 5) {
            cnt = 0;
        }
    }, 4000);
});


/////////////////////////////
/* 글자 회전 이펙트  */

var words = document.querySelectorAll(".word");
words.forEach(function (word) {
  var letters = word.textContent.split("");
  word.textContent = "";
  letters.forEach(function (letter) {
    var span = document.createElement("span");
    span.textContent = letter;
    span.className = "letter";
    word.append(span);
  });
});
var currentWordIndex = 0;
var maxWordIndex = words.length - 1;
words[currentWordIndex].style.opacity = "1";
var rotateText = function () {
  var currentWord = words[currentWordIndex];
  var nextWord = currentWordIndex === maxWordIndex ? words[0] : words[currentWordIndex + 1];
  // rotate out letters of current word
  Array.from(currentWord.children).forEach(function (letter, i) {
    setTimeout(function () {
      letter.className = "letter out";
    }, i * 80);
  });
  // reveal and rotate in letters of next word
  nextWord.style.opacity = "1";
  Array.from(nextWord.children).forEach(function (letter, i) {
    letter.className = "letter behind";
    setTimeout(function () {
      letter.className = "letter in";
    }, 340 + i * 80);
  });
  currentWordIndex =
  currentWordIndex === maxWordIndex ? 0 : currentWordIndex + 1;
};
rotateText();
setInterval(rotateText, 4000);
//////////////////////////////////////


</script>




</body>
</html>













