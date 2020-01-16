<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set scope="page" value="${sessionScope.member}" var="member" />

<jsp:include page="/module/1doctype_head.jsp"></jsp:include>

<body>    
<jsp:include page="/module/2body_first.jsp"></jsp:include>

<!-- FAQ -->
   <section id="contact" class="">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="section-title">
                        <h2>F  A  Q</h2>
                        <p>자주 여쭤보시는 질문에 대한 답변입니다</p>
                    </div>
                </div>
            </div>
            <div class="row">




<div class="container-faq"><!-- Test begin -->

<style>
.faq-choose1{
text-align: center;
}

.faq-choose1 button{
	border: 0;
    font-size: 20pt;
}

</style>









	<div class="faq-choose1">
	  <button class="" onclick="changeFaq('category')">분류별로 보기</button>
	  <button class="" onclick="changeFaq('keyword')">키워드로 검색</button>
	</div>
	
	
		<div id="category" class="faq" >
		
		  <button class="" onclick="changeCate('category1')">회원</button>
		  <button class="" onclick="changeCate('category2')">전시</button>
		  <button class="" onclick="changeCate('category3')">등록</button>
		  <button class="" onclick="changeCate('category4')">기타</button>
		
			<div id="category1" class="cateDetail">
			표1 질문내용 1<br>회원
			표2 질문내용 2<br>
			표3 질문내용 3<br>
			표4 질문내용 4
			</div>
			<div id="category2" class="cateDetail" style="display:none">
			표1 질문내용 1<br>
			표2 질문내용 2<br>전시
			표3 질문내용 3<br>
			표4 질문내용 4
			</div>
			<div id="category3" class="cateDetail" style="display:none">
			표1 질문내용 1<br>
			표2 질문내용 2<br>
			표3 질문내용 3<br>등록
			표4 질문내용 4
			</div>
			<div id="category4" class="cateDetail" style="display:none">
			표1 질문내용 1<br>
			표2 질문내용 2<br>@@기타
			표3 질문내용 3<br>
			표4 질문내용 4
			</div>
		
		</div>
		
		
		
		
		<div id="keyword" class="faq" style="display:none">
		
		
		</div>
	
	
	
	<script>
	function changeFaq(cityName) {
		  var i;
		  var x = document.getElementsByClassName("faq");
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";
		  }
		  document.getElementById(cityName).style.display = "block";
		}
	function changeCate(cityName) {
		  var i;
		  var x = document.getElementsByClassName("cateDetail");
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";
		  }
		  document.getElementById(cityName).style.display = "block";
		}
	</script>


</div><!-- Test end -->

            
            </div>
        </div>
    </section>
    
    
    
    
    
<!--  -->
<br><br>
<!-- 문의사항 -->
    <section id="contact" class="dark-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="section-title">
                        <h2>1:1 문의하기</h2>
                        <p>질문을 등록해주시면 최대한 빠르게 답변드리겠습니다<br></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="section-text">
                        <h4>Our Business Office</h4>
                        <p>서울 강남구 테헤란로 123, 15층</p>
                        <p><i class="fa fa-phone"></i> +82 10 - 2979 - 0710</p>
                        <p><i class="fa fa-envelope"></i> artshowsupport@doartshow.com</p>
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


<jsp:include page="/module/3body_last.html" />
</body>
</html>