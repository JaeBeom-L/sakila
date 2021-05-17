<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeBoard</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
$(document).ready(function() {
	$('#btn').click(function(){
		$('#removeForm').submit();
	})
})
</script>
</head>
<body class="container">
	<jsp:include page="/WEB-INF/view/nav.jsp"/>
	<h1>removeBoard</h1>
	<form action="${pageContext.request.contextPath}/removeBoard" method="post" id="removeForm">
		<input type="hidden" name="boardId" value="${boardId}">
		<div class="row">
			<div class="col-sm-2"><label>boardPw :</label></div>
			<div class="col-sm-5"><input type="password" id="boardPw" name="boardPw" class="form-control"></div>
			<div class="col-sm-3"><button type="button" id="btn" class="btn btn-light">삭제</button></div>		
		</div>
	</form>
</body>
</html>