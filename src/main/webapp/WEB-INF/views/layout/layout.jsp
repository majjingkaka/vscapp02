<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="ko">
		<%@ include file="head.jsp" %>
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
</html>