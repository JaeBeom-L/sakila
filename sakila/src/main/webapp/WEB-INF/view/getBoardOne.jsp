<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getBoardOne</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" type="image/x-icon">
<script>
$(document).ready(function(){
	console.log("document ready!");
	$('#addCommentBtn').click(function(){
		console.log("addCommentBtn click!");
		// 폼 유효성 검사	
		$('#addCommentForm').submit();
	})
})
</script>
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
	            <tr>
	            	<td>boardfile :</td>
	            	<td>
	            		<a class="session" href="${pageContext.request.contextPath}/admin/addBoardfile?boardId=${boardMap.boardId}"><button class="btn btn-default">파일추가</button></a>
	            		<!-- 보드파일을 출력하는 반복문 코드 구현 -->
	            		<c:forEach var="f" items="${boardfileList}">
	            			<div>
	            				<a href="${pageContext.request.contextPath}/resource/${f.boardfileName}">${f.boardfileName}</a>
	            				<a class="session" href="${pageContext.request.contextPath}/admin/removeBoardfile?boardfileId=${f.boardfileId}&boardId=${f.boardId}&boardfileName=${f.boardfileName}&username=${boardMap.username}">
	            					<button class="btn btn-default">X</button>
	            				</a>            				
	            			</div>
	            		</c:forEach>
	            	</td>
	            </tr>
	        </tbody>
	    </table>
	    <hr>
	    
	    <div>
		    <a class="session" href="${pageContext.request.contextPath}/admin/modifyBoard?boardId=${boardMap.boardId}"><button class="btn btn-default">수정</button></a>
		    <a class="session" href="${pageContext.request.contextPath}/admin/removeBoard?boardId=${boardMap.boardId}"><button class="btn btn-default">삭제</button></a>	
	    </div>
	</div>
	<br><br><br><hr>
	<!-- 댓글 입력 폼 -->
	<form action="${pageContext.request.contextPath}/admin/addComment" method="post" id="addCommentForm">
		<input type="hidden" name="boardId" value="${boardMap.boardId}">
		<div class="row">
			<div class="col-sm-1"><label>댓글 입력 : </label></div>
			<div class="col-sm-10"><input type="text" name="commentContent" class="form-control"></div>
			<div class="col-sm-1"><button type="button" id="addCommentBtn" class="btn btn-default">댓글추가</button></div>
		</div>
	</form>
	<br><hr>
	
	<!-- 댓글 출력 -->
	<div>
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
						<td>
							<c:if test="${username == c.username}">
								<a href="${pageContext.request.contextPath}/admin/removeComment?commentId=${c.commentId}&boardId=${c.boardId}&username=${username}" class="btn btn-default">삭제</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</div>
</body>
</html>