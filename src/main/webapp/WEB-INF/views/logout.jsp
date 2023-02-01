<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container">

	<h2>관리자 로그인</h2>

	<sf:form class="form-horizontal" action="/loginProcess" method="post">

		<div class="form-group">
			<label class="control-label col-sm-2" for="username">UserName:</label>
			<input type="text" class="form-control col-sm-5" id="username" placeholder="UserName" name="username">
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="password">Password:</label>
			<input type="password" class="form-control col-sm-5" id="password" placeholder="Password" name="password">
		</div>


		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default btn-gr">로그인</button>
			</div>
		</div>

	</sf:form>

</div>





<%--
<security:authorize access="hasRole('ADMIN')">
aaa
</security:authorize>
<security:authorize access="isAnonymous()">
bbb
</security:authorize>
--%>







