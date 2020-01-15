<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ======================= profileDiv ================================= -->
    <div class="col-md-4 container p-1" id="profileDiv">
        <div id="profileImg" style="margin: 20px;">
          <img src="../../memberProfileImages/default.jpg" class="rounded-circle" 
          alt="default.jpg" width="170" height="170">
        </div>
        <div id="profile">
          <div style="font-size: 25pt; margin-left: 20px; margin-bottom: 20px;">
          	${member.name}
          </div>
          <div style="float: left; width: 100%; margin-bottom: 60px;">
            <div  class="iconDiv">
              <a class="nav-link" href="<%=request.getContextPath()%>/client/auth/reviewList.do">
              <i class="fa fa-pencil"></i><br>
              <label>나의 리뷰</label></a></div>
            <div class="iconDiv">
              <a class="nav-link" href="<%=request.getContextPath()%>/client/auth/wishList.do">
              <i class="fa fa-heart"></i><br>
              <label>가고싶어요</label></a></div>
            <div  class="iconDiv">
              <a class="nav-link" href="<%=request.getContextPath()%>/client/auth/memberDetail.do">
              <i class="fa fa-cog"></i><br>
              <label>설정</label></a></div>
          </div>
        </div>
    </div>
<!-- ====================================================================== -->
    