<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="ko">
		<%@ include file="head.jsp" %>
		<title><t:getAsString name="title" /></title>
		
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
			
		 </body>
		 <%@ include file="plugin_js.jsp" %>

		 <script>
			$(function () {
				var token = $("meta[name='_csrf']").attr("content");
				var header = $("meta[name='_csrf_header']").attr("content");

				$(document).ajaxSend(function(e, xhr, options) {
					//console.log('ajaxSend');
					xhr.setRequestHeader(header, token);
				});
			});

			$(document).ready(function(){
				//
			});
		 </script>
</html>