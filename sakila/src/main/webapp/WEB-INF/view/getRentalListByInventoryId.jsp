<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getFilmList</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" type="image/x-icon">
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/nav.jsp"/>
	   	<div>
	    	<h1>&nbsp;rentalList&nbsp;</h1>
	    	<h5>inventoryId : ${inventoryId}</h5>
	    	<h5>title : ${title}</h5>
	    </div>
	    	 <table class="table table-hover">
		        <thead class="thead-light">
		            <tr>
		            	<th>rentalId</th>
		            	<th>rentalDate</th>
		                <th>returnDate</th>		                
		                <th>name</th>
		                <th>staffId</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="r" items="${rentalList}">
		                <tr>
		                	<td>${r.rentalId}</td>
		                	<td>${r.rentalDate}</td>
			            	<td>${r.returnDate}</td>			            	
			            	<td>${r.name}</td>
			            	<td>${r.staffId}</td>
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
</body>
</html>