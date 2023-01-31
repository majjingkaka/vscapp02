<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<style>
	#loginForm{
		width: 500px;
		margin: 0 auto;
	}

	@media (max-width: 768px) {
		#loginForm{
			width: 100%;
		}
	}
</style>

<div class="np fff col-sm-12 col-xs-12 mg-lg-t20" >
	<div class="col-sm-10 col-sm-offset-1 col-xs-12 ">
		<div class="page-header page-header-b">
			<h1>관리자 로그인</h1>
		</div>

		<div class="col-sm-12 col-xs-12 mg-sm-b50 mg-xs-b20">
			<%--<blockquote class="mg-sm-t30"><strong>관리자 로그인</strong></blockquote>--%>

			<div class="col-sm-12 col-xs-12 mg-sm-t30 mg-xs-t30">
				<sf:form class="form-horizontal" action="/loginProcess" method="post" id="loginForm">
					<div class="form-group">
						<label class="control-label col-sm-3" for="username">UserName : </label>
						<input type="text" class="form-control col-sm-9" id="username" placeholder="UserName" name="username">
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="password">Password : </label>
						<input type="password" class="form-control col-sm-9" id="password" placeholder="Password" name="password">
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="password"></label>
						<div class="np col-sm-9">
							<button type="submit" class="btn btn-default pull-right btn-gr">로그인</button>
						</div>
					</div>
				</sf:form>
			</div>

		</div>

		<!-- <div class="col-sm-12 col-xs-12 mg-sm-b50 mg-xs-b20">
			<hr class="col-sm-12 mg-sm-t70 mg-sm-b70 mg-xs-t70 mg-xs-b70">
		</div> -->

	</div>
</div>

<%--
<security:authorize access="hasRole('ADMIN')">
aaa
</security:authorize>
<security:authorize access="isAnonymous()">
bbb
</security:authorize>
--%>
