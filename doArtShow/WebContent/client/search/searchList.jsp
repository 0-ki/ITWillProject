<jsp:include page="/module/1doctype_head.jsp"></jsp:include>
<body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>

<jsp:include page="/module/2body_first.jsp"></jsp:include>

<hr>
    start
<c:forEach var="list" items="${searchResult}" >
	<h1> ${list.exhName}</h1>
	<h1> ${list.exhID}</h1>
</c:forEach>
end
<hr>

    
<jsp:include page="/module/3body_last.html"></jsp:include>
</body>
</html>