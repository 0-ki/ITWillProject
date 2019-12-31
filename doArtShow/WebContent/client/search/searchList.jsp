<jsp:include page="/module/1doctype_head.jsp"></jsp:include>
<body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>

<jsp:include page="/module/2body_first.jsp"></jsp:include>



<div class="container" style="margin-top:30px">
  <div class="row">
<div class="wrapper">
<div class="text-center">
  <h1><input type="text" value="${search }" style="border:3px solid grey; text-align:center; border-radius: 50%;width:50%;"></h1>
  <p> 총  <c:out value="${searchResult.size() }" /> 건이 검색되었습니다.</p> 
</div>

    <div id="content_div" class="container">
	    <div id="content_list">  
	    	<c:forEach var="list" items="${searchResult}">
		    <div id="content_list_div">
		        <a href="ExContentView.do?exhID=${list.exhID}"><!-- 아무데나 눌러도 상세페이지로 넘어가게 -->
		        	<img src="/doArtShow/sampleImages/${list.imageFile1}" style="height: 370px; width: 275px;"/><br>
		            ${list.exhName}<br>
		            ${list.exhPlace}<br>
		            ${list.exhStartDate}&nbsp;~&nbsp;${list.exhEndDate}
		       	 </a>
		    </div>
		    </c:forEach>
		</div>
		<div id="moreBtn_div" align="center">
			<button type="button" id="more_btn">더보기</button>
		</div>
	</div>
</div>
  
<%--       start
<c:forEach var="list" items="${searchResult}" >
	<h1> ${list.exhName}</h1>
	<h1> ${list.exhID}</h1>
</c:forEach>
end --%>
  </div>
</div>


    
<jsp:include page="/module/3body_last.html"></jsp:include>
</body>
</html>