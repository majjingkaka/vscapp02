<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<title name="title">솔트코딩 login</title>
<meta name="description" content="스크래치 로봇 블록코딩 초등코딩 솔트코딩 login">

<style>
	/* #loginForm{
		width: 500px;
		margin: 0 auto;
	}

	@media (max-width: 768px) {
		#loginForm{
			width: 100%;
		}
	} */
</style>

<style>
  .blockquote{
      background-color: #fff;
      border-left: .7rem solid #fff;
      margin: 1.5em .7rem;
      padding: .5em .7rem;
  }
</style>

<div class="container-fluid p-3" >
	<div class="card">
		<div class="card-body">
			<h2>login</h2>
		</div>
	  </div>
	<!-- <div class="page-header page-header-b">
		<h1>login</h1>
	</div> -->

	<security:authorize access="isAnonymous()">
		<sf:form class="form-horizontal needs-validation" action="/loginProcess" method="post" id="loginForm">
			<div class="form-group">
				<label class="control-label" for="username">UserName : </label>
				<input type="text" class="form-control col-sm-5" id="username" placeholder="UserName" name="username" aria-describedby="username" required>
				<small id="username" class="form-text text-muted">We'll never share your ID with anyone else.</small>
			</div>
			<div class="form-group">
				<label class="control-label" for="password">Password : </label>
				<input type="password" class="form-control col-sm-5" id="password" placeholder="Password" name="password" required>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-default pull-right btn-gr">로그인</button>
			</div>
		</sf:form>
	</security:authorize>
	
	<security:authorize access="isAuthenticated()">
			<div class="btn btn-default pull-right btn-gr">
				<a href="#" onclick="javascript:document.logoutForm.submit();">로그아웃</a>
			</div>
	</security:authorize>
	
	<br>
	<security:authorize access="hasRole('ADMIN')">
		관리자 등급입니다.
	</security:authorize>
	<br>
	<security:authorize access="hasRole('MEMBER')">
		멤버 등급입니다.
	</security:authorize>
	<br>
	<security:authorize access="isAnonymous()">
		로그오프입니다.
	</security:authorize>
	<br>
	<security:authorize access="isAuthenticated()">
		로그인상태입니다.
	</security:authorize>


	
</div>


<sf:form name="logoutForm" method="post" action="/logout">
    <!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
</sf:form>







