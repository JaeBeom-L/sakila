<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script>
$(document).ready(function(){
	console.log("document ready!");
	$('#btn').click(function(){
		console.log("btn click!");
		// 폼 유효성 검사
		
		$('#modifyForm').submit();
	})
})
</script>
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/nav.jsp"/>
    <h1>modifyBoard</h1>
    <form action="${pageContext.request.contextPath }/modifyBoard" method="post" id="modifyForm">
	     <table class="table">
	         <tbody>
	            <tr>
	                <td>boardId :</td>
	                <td><input type="text" id="boardId" name="boardId" value="${boardMap.boardId}" readonly="readonly" class="form-control"></td>
	            </tr>
	            <tr>
	                <td>boardTitle :</td>
	                <td><input type="text" id="boardTitle" name="boardTitle" value="${boardMap.boardTitle}" class="form-control"></td>
	            </tr>
	            <tr>
	                <td>boardPw :</td>
	                <td><input type="password" id="boardPw" name="boardPw" class="form-control"></td>
	            </tr>
	            <tr>
	                <td>boardContent :</td>
	                <td><textarea rows="5" id="boardContent" name="boardContent" cols="80" class="form-control">${boardMap.boardContent}</textarea></td>
	            </tr>
	            <tr>
	                <td>username :</td>
	                <td>${boardMap.username}</td>
	            </tr>
	            <tr>
	                <td>insertDate :</td>
	                <td>${boardMap.insertDate}</td>
	            </tr>
	        </tbody>
	    </table>
	    <button id="btn" type="button" class="btn btn-default">수정</button>
    </form>
</div>
</body>
</html>