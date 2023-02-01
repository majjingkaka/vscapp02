<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

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
			<h1>login test...</h1>
		</div>

		<div class="col-sm-12 col-xs-12 mg-sm-b50 mg-xs-b20">
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
	</div>
</div>



<sf:form name="logoutForm" method="post" action="/logout">
    <!-- <input type="hidden" name="${_csrf.parameterName}" 	value="${_csrf.token}" /> -->
</sf:form>


<security:authorize access="hasRole('MEMBER')">
	<div class="m_login hidden-lg hidden-md">
		<a href="#" onclick="javascript:document.logoutForm.submit();">로그아웃</a>
	</div>
</security:authorize>

<security:authorize access="hasRole('ADMIN')">
aaa
</security:authorize>
<security:authorize access="hasRole('MEMBER')">
bbb
</security:authorize>
<security:authorize access="isAnonymous()">
ccc
</security:authorize>

<security:authorize access="isAuthenticated()">
1111111111
</security:authorize>


