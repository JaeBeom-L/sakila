<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeBoard</title>
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
$(document).ready(function() {
	$('#btn').click(function(){
		$('#removeForm').submit();
	})
})
</script>
</head>
<body class="app">
	<jsp:include page="/WEB-INF/view/nav.jsp"/>
	<div id="main">
    	<header class="mb-3">
        	<a href="#" class="burger-btn d-block d-xl-none">
      			<i class="bi bi-justify fs-3"></i>
            </a>
        </header>
        <div class="page-heading">
               <h3>removeBoard</h3>
           </div>
           <div class="page-content">
           	<section class="row">
           		<div class="card">
           			<br>
					<form action="${pageContext.request.contextPath}/admin/removeBoard" method="post" id="removeForm">
						<input type="hidden" name="boardId" value="${boardId}">
						<div class="row">
							<div class="col-sm-2"><label>boardPw :</label></div>
							<div class="col-sm-5"><input type="password" id="boardPw" name="boardPw" class="form-control"></div>
							<div class="col-sm-3"><button type="button" id="btn" class="btn btn-light">삭제</button></div>		
						</div>
					</form>
					<br>
				</div>
			</section>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>