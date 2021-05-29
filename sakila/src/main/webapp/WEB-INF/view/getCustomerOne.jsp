<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getCustomerOne</title>
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
		    <h1>CustomerOne</h1>
		     <table class="table table-hover">
		         <tbody>
		           	<tr>
		                <td>customerId :</td>
		                <td>${getCustomerOne.customerId}</td>
		            </tr>
		            <tr>
		                <td>storeId :</td>
		                <td>${getCustomerOne.storeId}</td>
		            </tr>
		            <tr>
		                <td>name :</td>
		                <td>${getCustomerOne.name}</td>
		            </tr>
		            <tr>
		                <td>sumAmount :</td>
		                <td>${getCustomerOne.sumAmount}</td>
		            </tr>
		            <tr>
		                <td>country :</td>
		                <td>${getCustomerOne.country}</td>
		            </tr>
		            <tr>
		                <td>city :</td>
		                <td>${getCustomerOne.city}</td>
		            </tr>
		            <tr>
		                <td>address :</td>
		                <td>${getCustomerOne.address}</td>
		            </tr>
		            <tr>
		                <td>phone :</td>
		                <td>${getCustomerOne.phone}</td>
		            </tr>
		            <tr>
		                <td>active :</td>
		                <td>${getCustomerOne.active}</td>
		            </tr>		        	       
		        </tbody>
		    </table>
		    
		    <h1>RentalList</h1>
		    	<table class="table table-hover">
					<tr style="font-size : 15px" class="thead">
		        		<td>rentalId</td>
		        		<td>inventoryId</td>
		              	<td>title</td>
		              	<td>rentalDate</td>
		              	<td>returnDate</td>
		              	<td>overdueDate</td>
		           	</tr>
		           <c:forEach var="r" items="${getRentalListByCustomerId}">
						<c:if test="${r.overdue == 'T'}">
				            <tr style="color: red">
				               <td>${r.rentalId}</td>
				               <td>${r.inventoryId}</td>
				               <td>
				                  <a href="${pageContext.request.contextPath}/admin/getFilmOne?FID=${r.filmId}" style="color: red">
				                  	${r.title}
				                  </a>
				               </td>
				               <td>${r.rentalDate}</td>
				               <td>${r.returnDate}</td>
				               <td>${r.overdueDate}</td>
				            </tr>
		              	</c:if>
		              	<c:if test="${r.overdue == '' }">
		              		<tr>
				               <td>${r.rentalId}</td>
				               <td>${r.inventoryId}</td>
				               <td>
				                  <a href="${pageContext.request.contextPath}/admin/getFilmOne?FID=${r.filmId}">
				                  	${r.title}
				                  </a>
				               </td>
				               <td>${r.rentalDate}</td>
				               <td>${r.returnDate}</td>
				               <td></td>
				            </tr>
				        </c:if>
		           </c:forEach>
        		</table>
		   </div>
	   </div>
</body>
</html>