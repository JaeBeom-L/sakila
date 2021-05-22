<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	console.log('ready');
	$('#btn').click(function(){
		console.log('btn click');
		$('#loginForm').submit();
		console.log('submit');
	});
});
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/nav.jsp"/>
		<h1>Home</h1>
	
		<!-- 로그 오프 시 -->
		<c:if test="${loginStaff == null}">
			<form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
				<div>email : </div>
				<div><input type="text" id="email" name="email"></div>
				<div>password : </div>
				<div><input type="password" id="password" name="password"></div>
				<div>
					<button type="button" id="btn" class="btn btn-secondary">로그인</button>
				</div>
			</form>
		</c:if>
		
		<!-- 로그 인 시 -->
		<c:if test="${loginStaff != null}">
			<a href="${pageContext.request.contextPath}/admin/logout">로그아웃</a>
		</c:if>
	</div>
</body>
</html>