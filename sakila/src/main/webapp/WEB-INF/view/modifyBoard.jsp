<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" type="image/x-icon">
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
    <form action="${pageContext.request.contextPath }/admin/modifyBoard" method="post" id="modifyForm">
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
	<script src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>