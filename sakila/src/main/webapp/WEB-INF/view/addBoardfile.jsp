<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addBoardfile</title>
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
		$('#btn').click(function(){
			$('#addFileForm').submit();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/nav.jsp"/>
		<h1>addBoardfile</h1>
		<form action="${pageContext.request.contextPath}/admin/addBoardfile" method="post" enctype="multipart/form-data" id="addFileForm">
			<div>
				boardId : 
				<input type="hidden" id="boardId" name="boardId" value="${boardId}" readonly="readonly">
				<br>		
				<input type="file" id="multipartFile" name="multipartFile">
			</div>
			<div>
				<br>
				<button type="button" id="btn">파일 추가</button>
			</div>
		</form>
	</div>
</body>
</html>