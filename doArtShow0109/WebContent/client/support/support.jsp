<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set scope="page" value="${sessionScope.member}" var="member" />

<jsp:include page="/module/1doctype_head.jsp"></jsp:include>

<style>
/*  선택된 버튼 효과  */
.btn-checked{
	background-color: #cccaca;
	color: red;
	transition: all 0.3s;
}

/*  */

.faq-choose1{
	text-align: center;
	margin: 15px 10px;
}

.faq-choose1 button{
	border: 0;
    font-size: 20pt;
    transition: all 0.3s;
}
.faq button{
	border: 0;
    font-size: 20pt;
    transition: all 0.3s;
}

.faq{
	min-width: 900px;
	min-height: 400px;
	margin: 0 auto;
	background-color: aqua;
}

/* 아코디언 */
.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  /* padding: 18px; */
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active, .accordion:hover {
  background-color: #ccc;
}

.accordion:after {
  content: '\002B';
  color: #777;
  font-weight: bold;
  float: right;
  margin-left: 5px;
}

.active:after {
  content: "\2212";
}

.panel1 {
  padding: 0 18px;
  background-color: white;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
}

</style>


<body>    
<jsp:include page="/module/2body_first.jsp"></jsp:include>




    <section id="contact" class="dark-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="section-title">
                        <h2>공 지 사 항</h2>
                        <p>정책 변경 및 기타 전달사항입니다<br></p>
                    </div>
                </div>
            </div>
            <div class="row">
            
            			<div id="" class="noticeDetail">
	
<button class="accordion">Section 1</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">Section 2</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">Section 3</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">Section 4</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">Section 5</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

			</div>
            
            
            
            </div>
        </div>
    </section>




<!-- FAQ -->
   <section id="contact" class="">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="section-title">
                        <h2>F  A  Q</h2>
                        <p style="margin: 0;">자주 여쭤보시는 질문에 대한 답변입니다</p>
                    </div>
                    

<div class="container-faq"><!-- Test begin -->

	<div class="faq-choose1">
	  <button class="btnCheck1 btn-checked" onclick="changeFaq(event, 'category')">분류별로 보기</button>
	  <button class="btnCheck1 " onclick="changeFaq(event, 'keyword')">키워드로 검색</button>
	</div>
	
	
		<div id="category" class="faq" >
		
		  <button class="btnCheck2 btn-checked" onclick="changeCate(event, 'category1')">회원</button>
		  <button class="btnCheck2 " onclick="changeCate(event, 'category2')">전시</button>
		  <button class="btnCheck2 " onclick="changeCate(event, 'category3')">등록</button>
		  <button class="btnCheck2 " onclick="changeCate(event, 'category4')">기타</button>
		
			<div id="category1" class="cateDetail">
	
<button class="accordion">Section 1</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">Section 2</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">Section 3</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">Section 4</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">Section 5</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

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
		
		
		
<!-- 검색해서 찾기 -->		
		<div id="keyword" class="faq" style="display:none">
			<input id="myInput" type="text" placeholder="검색어를 입력해주세요">
			<!-- 질문이 담겨있는 영역 -->
			<div id="myDIV">


<button class="accordion">Section 2</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">Section 3</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">Section 4</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">만약 질문을 한글로 하면 어떻게 검색이 되나요?</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">개인적으로는 아래쪽으로는 점점 흐려지는 식으로 하면 어떨까 하는데</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">스크롤 처리를 할까 말까 던질까 말까</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">필터로 검색해서 짠 </button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

<button class="accordion">이 많은 글들을 직접 채워야 한다니 어휴.. 정말 아득해요</button>
<div class="panel1">
  <p>Lorem ipsum dolor sit amet, consectetur 사과, 바나나, 애플, 1234 sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>

			</div>		
		</div>
	
	<script>
	// 검색-카테고리 선택
	function changeFaq(evt, cityName) {
		  var i, x, btnchk;
		  x = document.getElementsByClassName("faq");
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";
		  }
		  btnchk = document.getElementsByClassName("btnCheck1");
		  for (i = 0; i < x.length; i++) {
			  btnchk[i].className = btnchk[i].className.replace(" btn-checked", "");
			}
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " btn-checked";
		}
	// 카테고리 - 상세 선택
	function changeCate(evt, cityName) {
		  var i, x, btnchk;
		  x = document.getElementsByClassName("cateDetail");
		  for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";
		  }
		  btnchk = document.getElementsByClassName("btnCheck2");
		  for (i = 0; i < x.length; i++) {
			  btnchk[i].className = btnchk[i].className.replace(" btn-checked", "");
			}
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " btn-checked";
		}
	// 카테고리 - 상세 선택
	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
	  acc[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var panel = this.nextElementSibling;
	    if (panel.style.maxHeight) {
	      panel.style.maxHeight = null;
	    } else {
	      panel.style.maxHeight = panel.scrollHeight + "px";
	    } 
	  });
	}
	</script>


</div><!-- Test end -->
                    
                </div>
            </div>
            <div class="row">
            </div>
        </div>
    </section>
    
    
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

<script>
$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#myDIV button").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
</script>


</body>
</html>