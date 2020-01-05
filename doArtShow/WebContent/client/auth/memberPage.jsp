<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
    .box a:link , .iconDiv a:link { color: gray; text-decoration: none; }
    .box a:visited, .iconDiv a:visited { color: gray; text-decoration: none; }
    .box a:hover , .iconDiv a:hover { color: gray; text-decoration: underline; }

    #iconBox{
        float: left;
    }
    .box{
        height: 300px;
        margin-bottom: 50px;
    }
    .box a{
      vertical-align: middle;
      line-height: 250px;
    }

    .iconDiv{
      text-align: center;
      display: inline-block;
      width: 115px;
    }
    .iconDiv label{
      color: gray;
    }

    .iconDiv label{
      font-size: 11pt;
    }
    
    .seeAll{
      font-size: 10pt;
      float: right;
      padding-top: 5px;
    }

    @media (max-width: 1020px) {
      #profile{
        float: left;
        padding-top: 40px;
        margin-left: 30px;
      }
      #profileImg{
        float: left;
      }
    }
    #mainBox{
    	padding-top:20px;
    }

  </style>
</head>
<jsp:include page="../../module/1doctype_head.jsp"></jsp:include>
<body>
<jsp:include page="../../module/2body_first.jsp"></jsp:include>
<c:if test="${!empty sessionScope.member}">
<div class="container">
  <div class="row">
    <div class="col-md-4 container p-1">
        <div id="profileImg" style="margin: 20px;">
          <img src="../../memberProfileImages/default.jpg" class="rounded-circle" alt="default.jpg" width="170" height="170">
        </div>
        <div id="profile">
          <div style="font-size: 25pt; margin-left: 20px; margin-bottom: 20px;">길정미</div>
          <div style="float: left; width: 100%; margin-bottom: 50px;">
            <div class="iconDiv">
              <a class="nav-link" href="<%=request.getContextPath()%>/client/auth/wishList.do"><i class="fa fa-heart"></i><br>
              <label>가고싶어요</label></a></div>
            <div  class="iconDiv">
              <a class="nav-link" href="<%=request.getContextPath()%>/client/auth/visitList.do"><i class="fa fa-pencil"></i><br>
              <label>나의 리뷰</label></a></div>
            <div  class="iconDiv">
              <a class="nav-link" href="<%=request.getContextPath()%>/client/auth/memberDetail.do"><i class="fa fa-cog"></i><br>
              <label>설정</label></a></div>
          </div>
        </div>
    </div>
    <div class="col-sm-12 col-md-8" id="mainBox">
      <label style="font-size:15pt;">다녀왔어요&nbsp;<span style="color: skyblue;">0</span></label>
      <a class="seeAll" style="color: skyblue;">전체보기</a></p>
      <div class="container p-3 my-3 border box">
          <center><a href="">+ 내가 가본 전시를 찾아보세요</a></center>
      </div>
      <br>
      <label style="font-size: 15pt;">가고 싶어요&nbsp;<span style="color: skyblue;">0</span></label>
      <a class="seeAll" style="color: skyblue;">전체보기</a></p>
      <div class="container p-3 my-3 border box">
        <center><a href="">+ 내가 가고 싶은 전시를 찾아보세요</a></center>
      </div>
      <br>
      <label style="font-size: 15pt;">등록한 전시&nbsp;<span style="color: skyblue;">0</span></label>
      <a class="seeAll" style="color: skyblue;">전체보기</a></p>
      <div class="container p-3 my-3 border box">
        <center><a href="">+ 전시를 등록해보세요</a></center>
      </div>
    </div>
  </div>
</div>
</c:if>
<c:if test="${empty sessionScope.member}">
<div class="container p-3" style="padding-top:50px; text-align: center; height:700px;">
        <h3>로그인이 필요한 페이지 입니다. 로그인해주세요</h3>
        <br>
        <a href="javascript:addFormLogin();">로그인 하러 가기</a>
</div>
</c:if>
<jsp:include page="../../module/3body_last.html"></jsp:include>
</body>
</html>