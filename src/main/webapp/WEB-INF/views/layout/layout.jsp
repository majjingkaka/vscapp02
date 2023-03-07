<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">

		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="subject" content="솔트코딩">
		<meta name="description" content="스크래치 로봇 블록코딩 초등코딩">
		<meta name="copyright" content="솔트코딩">
		<meta name="title" content="솔트코딩">
		<meta name="apple-mobile-web-app-title" content="솔트코딩">
		<meta name="application-name" content="솔트코딩">

		<meta name="_csrf" content="${_csrf.token}"/>
		<meta name="_csrf_header" content="${_csrf.headerName}"/>
		
		<link rel="icon" href="${pageContext.request.contextPath}/images/home/SaltCodingLogo.png" type="image/x-icon" sizes="16x16">
		<link rel="icon" href="${pageContext.request.contextPath}/images/home/SaltCodingLogo.png" type="image/x-icon" sizes="32x32">
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/home/SaltCodingLogo.png" type="image/x-icon" />
		<link rel="canonical" href="http://saltcoding.com">

		<meta property="og:type" content="website">
		<meta property="og:url" content="http://saltcoding.com">
		<meta property="og:title" content="솔트코딩">
		<meta property="og:image" content="${pageContext.request.contextPath}/images/home/kids-1093758_1920.jpg">
		<meta property="og:description" content="스크래치 로봇 블록코딩 초등코딩">
		<meta property="og:site_name" content="솔트코딩" />
		<meta property="og:image:width" content="1200">
		<meta property="og:image:height" content="630">
		<meta name="naver-site-verification" content="eecb87d08c971207921a7be31cd118307c894393" />
		<meta name="google-site-verification" content="Nt1GVEx23BW0LRxglzDZre9CPqjxFBxAKRoeR95CPY0" />
		
		<meta name="twitter:card" content="summary">
		<meta name="twitter:title" content="솔트코딩">
		<meta name="twitter:site" content="솔트코딩">
		<meta name="twitter:description" content="스크래치 로봇 블록코딩 초등코딩">
		<meta name="twitter:image" content="${pageContext.request.contextPath}/images/home/kids-1093758_1920.jpg">
		<meta name="twitter:domain" content="사이트 명">

		<title>솔트코딩 <t:getAsString name="title" /></title>
	  
		<!-- Google Font: Source Sans Pro -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
		<!-- Font Awesome -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/fontawesome-free/css/all.min.css">
		<!-- Ionicons -->
		<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<!-- Tempusdominus Bootstrap 4 -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
		<!-- iCheck -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
		<!-- JQVMap -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jqvmap/jqvmap.min.css">
		<!-- Theme style -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/adminlte.min.css">
		<!-- overlayScrollbars -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
		<!-- Daterange picker -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
		<!-- summernote -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/summernote/summernote-bs4.min.css">

		<!-- jQuery -->
		<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.min.js"></script>
		<!-- jQuery UI 1.11.4 -->
		<script src="${pageContext.request.contextPath}/plugins/jquery-ui/jquery-ui.min.js"></script>
		<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
		
		<script>
		$.widget.bridge('uibutton', $.ui.button)
		</script>
		<!-- Bootstrap 4 -->
		<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- ChartJS -->
		<script src="${pageContext.request.contextPath}/plugins/chart.js/Chart.min.js"></script>
		<!-- Sparkline -->
		<script src="${pageContext.request.contextPath}/plugins/sparklines/sparkline.js"></script>
		<!-- JQVMap -->
		<script src="${pageContext.request.contextPath}/plugins/jqvmap/jquery.vmap.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
		<!-- jQuery Knob Chart -->
		<script src="${pageContext.request.contextPath}/plugins/jquery-knob/jquery.knob.min.js"></script>
		<!-- daterangepicker -->
		<script src="${pageContext.request.contextPath}/plugins/moment/moment.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
		<!-- Tempusdominus Bootstrap 4 -->
		<script src="${pageContext.request.contextPath}/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
		<!-- Summernote -->
		<script src="${pageContext.request.contextPath}/plugins/summernote/summernote-bs4.min.js"></script>
		<!-- overlayScrollbars -->
		<script src="${pageContext.request.contextPath}/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
		<!-- AdminLTE App -->
		<script src="${pageContext.request.contextPath}/dist/js/adminlte.js"></script>
		<!-- AdminLTE for demo purposes -->
		<!-- <script src="${pageContext.request.contextPath}/dist/js/demo.js"></script> -->
		<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
		<!-- <script src="${pageContext.request.contextPath}/dist/js/pages/dashboard.js"></script> -->
		<script src="${pageContext.request.contextPath}/plugins/jquery-validation/jquery.validate.min.js"></script>

		<script src="${pageContext.request.contextPath}/js/dateTime.js"></script>
	</head>
		

		
		
		<body class="hold-transition sidebar-mini layout-fixed">
			
			<section class="content">
				<div id="wrapper" class="wrapper">
				
					<!-- Preloader -->
					<!-- <div class="preloader flex-column justify-content-center align-items-center">
						<img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
					</div> -->
					
					<div id="layout-header" >
						<t:insertAttribute name="header" />
					</div>
					
					<div id="layout-menu" >
						<t:insertAttribute name="menu" />
					</div>
	
					<div id="layout-content" class="content-wrapper">
						<t:insertAttribute name="content" />
					</div>
					
					<div id="layout-footer" >
						<t:insertAttribute name="footer" />
					</div>
					
	
					 <!-- Control Sidebar -->
					<aside class="control-sidebar control-sidebar-dark">
						<!-- Control sidebar content goes here -->
					</aside>
					<!-- /.control-sidebar -->
				</div>
			</section>
			
			<script>
				$(function () {
					var token = $("meta[name='_csrf']").attr("content");
					var header = $("meta[name='_csrf_header']").attr("content");
					var pageName = "${pageName}";
					console.log('pageName:'+pageName);
					var desc = "스크래치 로봇 블록코딩 초등코딩 "+pageName;
					$("meta[name=description]").attr("content", desc);

					$(document).ajaxSend(function(e, xhr, options) {
						//console.log('ajaxSend');
						xhr.setRequestHeader(header, token);
					});
				});
	
				$(document).ready(function(){
					//
					printClock(); //타임작동하기
				});

				
				


			</script>
		</body>
</html>