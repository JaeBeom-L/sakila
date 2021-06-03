<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getFilmList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
</body>
</html>