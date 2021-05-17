<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getBoardOne</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/nav.jsp"/>
    <div>
	    <h1>BoardOne</h1>
	     <table class="table">
	         <tbody>
	             <tr>
	                <td>boardId :</td>
	                <td>${boardMap.boardId}</td>
	               </tr>
	            <tr>
	                   <td>boardTitle :</td>
	                   <td>${boardMap.boardTitle}</td>
	            </tr>
	            <tr>
	                   <td>boardContent :</td>
	                   <td>${boardMap.boardContent}</td>
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
	    <a class="btn btn-default" href="${pageContext.request.contextPath}/modifyBoard?boardId=${boardMap.boardId}">수정</a>
	    <a class="btn btn-default" href="${pageContext.request.contextPath}/removeBoard?boardId=${boardMap.boardId}">삭제</a>
	    <a class="btn btn-default" href="${pageContext.request.contextPath}/getBoardList">글목록</a>	
	</div>
	<br><br><br>
	<!-- 댓글 -->
	<div>
		<div><a href="" class="btn btn-default">댓글추가</a></div>
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th>commentContent</th>
					<th>userName</th>
					<th>insertDate</th>
					<th>삭제</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="c" items="${commentList}">
					<tr>
						<td>${c.commentContent}</td>
						<td>${c.username}</td>
						<td>${c.insertDate}</td>
						<td><a href="" class="btn btn-default">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>