<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="managerId" value="${managerId}" />
<c:choose>
	<c:when test="${managerId == null || managerId eq ''}">
		<% response.sendRedirect("manager.do"); %>
	</c:when>
	<c:otherwise>
		<!DOCTYPE html>
		<html lang="en">
		
		<head>
		
		  <meta charset="utf-8">
		  <meta http-equiv="X-UA-Compatible" content="IE=edge">
		  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		  <meta name="description" content="">
		  <meta name="author" content="">
		<link rel="shortcut icon" href="/doArtShow/resourcesImages/artshowtitle_Zn8_icon.ico" type="image/x-icon" />
		  <title>전시:해 - 관리자 페이지</title>
		
		  <jsp:include page="/module/manager_ExhList_Header.html"></jsp:include>
		
		</head>
		
		<body id="page-top">
		
		  <jsp:include page="/module/manager_TopNav.jsp"></jsp:include>
		  
		  <div id="wrapper">
		
		    <!-- Sidebar -->
		    <jsp:include page="/module/manager_Sidebar.html"></jsp:include>
		
		    <div id="content-wrapper">
		
		      <div class="container-fluid">
		
		        <!-- Breadcrumbs-->
		        <ol class="breadcrumb">
		          <li class="breadcrumb-item">
		            <a href="manager.do">Home</a>
		          </li>
		          <li class="breadcrumb-item active">Overview</li>
		        </ol>
		
		        <!-- Icon Cards-->
		        <div class="row">
		          <div class="col-xl-3 col-sm-6 mb-3">
		            <div class="card text-white bg-primary o-hidden h-100">
		              <div class="card-body">
		                <div class="card-body-icon">
		                  <i class="fas fa-fw fa-file-alt"></i>
		                </div>
		                <div class="mr-5"><span class="count">${newExhListCnt}</span> 새로운 게시물 요청</div>
		              </div>
		              <a class="card-footer text-white clearfix small z-1" href="newExhList.do">
		                <span class="float-left">자세히 보기</span>
		                <span class="float-right">
		                  <i class="fas fa-angle-right"></i>
		                </span>
		              </a>
		            </div>
		          </div>
		          <div class="col-xl-3 col-sm-6 mb-3">
		            <div class="card text-white bg-warning o-hidden h-100">
		              <div class="card-body">
		                <div class="card-body-icon">
		                  <i class="fas fa-fw fa-bell"></i>
		                </div>
		                <div class="mr-5"><span class="count">${todayVisitCnt}</span> 오늘 방문자 수</div>
		              </div>
		              <a class="card-footer text-white clearfix small z-1" href="charts.jsp">
		                <span class="float-left">자세히 보기</span>
		                <span class="float-right">
		                  <i class="fas fa-angle-right"></i>
		                </span>
		              </a>
		            </div>
		          </div>
		          <div class="col-xl-3 col-sm-6 mb-3">
		            <div class="card text-white bg-success o-hidden h-100">
		              <div class="card-body">
		                <div class="card-body-icon">
		                  <i class="fas fa-fw fa-shopping-cart"></i>
		                </div>
		                <div class="mr-5"><span class="count"></span> 1:1 문의 요청</div>
		              </div>
		              <a class="card-footer text-white clearfix small z-1" href="#">
		                <span class="float-left">자세히 보기</span>
		                <span class="float-right">
		                  <i class="fas fa-angle-right"></i>
		                </span>
		              </a>
		            </div>
		          </div>
		          <div class="col-xl-3 col-sm-6 mb-3">
		            <div class="card text-white bg-danger o-hidden h-100">
		              <div class="card-body">
		                <div class="card-body-icon">
		                  <i class="fas fa-fw fa-users"></i>
		                </div>
		                <div class="mr-5"><span class="count">${memberCnt}</span> 전체 회원 수</div>
		              </div>
		              <a class="card-footer text-white clearfix small z-1" href="memberList.do">
		                <span class="float-left">자세히 보기</span>
		                <span class="float-right">
		                  <i class="fas fa-angle-right"></i>
		                </span>
		              </a>
		            </div>
		          </div>
		        </div>
		
		        <!-- Area Chart Example-->
		        <div class="card mb-3">
		          <div class="card-header">
		            <i class="fas fa-chart-area"></i>
		            <span id="title_week"></span>
		          </div>
		          <div class="card-body">
		            <canvas id="myAreaChart" width="100%" height="30"></canvas>
		          </div>
		          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
		        </div>
		
		    
		
		      </div>
		      <!-- /.container-fluid -->
		
		      <!-- Sticky Footer -->
		      <footer class="sticky-footer">
		        <div class="container my-auto">
		          <div class="copyright text-center my-auto">
		            <span>Copyright © Your Website 2019</span>
		          </div>
		        </div>
		      </footer>
		
		    </div>
		    <!-- /.content-wrapper -->
		
		  </div>
		  <!-- /#wrapper -->
		
		  <!-- Scroll to Top Button-->
		  <a class="scroll-to-top rounded" href="#page-top">
		    <i class="fas fa-angle-up"></i>
		  </a>
		
		  <!-- Logout Modal-->
		  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog" role="document">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
		          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		            <span aria-hidden="true">×</span>
		          </button>
		        </div>
		        <div class="modal-body">정말로?</div>
		        <div class="modal-footer">
		          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
		          <a class="btn btn-primary" href="managerLogout.do">Logout</a>
		        </div>
		      </div>
		    </div>
		  </div>
		
		  <!-- Bootstrap core JavaScript-->
		  <script src="vendor/jquery/jquery.min.js"></script>
		  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		  <!-- Core plugin JavaScript-->
		  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
		
		  <!-- Page level plugin JavaScript-->
		  <script src="vendor/chart.js/Chart.min.js"></script>
		  <script src="vendor/datatables/jquery.dataTables.js"></script>
		  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
		
		  <!-- Custom scripts for all pages-->
		  <script src="js/sb-admin.js"></script>
		
		  <!-- Demo scripts for this page-->
		  <script src="js/demo/chart-area-demo.js"></script>
		
		</body>
		
		</html>
		
	</c:otherwise>
</c:choose>