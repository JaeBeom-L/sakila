<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getCustomerOne</title>
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
	<div id="main">
	    	<header class="mb-3">
	        	<a href="#" class="burger-btn d-block d-xl-none">
	      			<i class="bi bi-justify fs-3"></i>
	            </a>
	        </header>
	        <div class="page-heading">
                <h3>CustomerOne</h3>
            </div>
            <div class="page-content">
            	<section class="row">
            		<div class="card">
            			<br>
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
					</div>
					
					<div class="page-heading">
               			<h3>RentalList</h3>
            		</div>
					
					<div class="card">
						<br>
				    	<table class="table table-hover">
							<tr style="font-size : 15px" class="thead">
				        		<td>rentalId</td>
				        		<td>storeId</td>
				        		<td>inventoryId</td>
				              	<td>title</td>
				              	<td>rentalDate</td>
				              	<td>returnDate</td>
				              	<td>overdue</td>
				           	</tr>
				           <c:forEach var="r" items="${getRentalListByCustomerId}">
								<c:if test="${r.overdue == 'T'}">
						            <tr style="color: red">
						               <td>${r.rentalId}</td>
						               <td>${r.storeId}</td>
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
						               <td>${r.storeId}</td>
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
		        		<div class="row">
			        		<div class="col-10"></div>
			        		<div class="col-2">
						        <c:if test="${currentPage > 1}">
						            <a href="${pageContext.request.contextPath}/admin/getCustomerOne?currentPage=${currentPage-1}&customerId=${customerId}" class="btn btn-light rounded-pill">이전</a>
						        </c:if>
						        <c:if test="${currentPage < lastPage}">
						            <a href="${pageContext.request.contextPath}/admin/getCustomerOne?currentPage=${currentPage+1}&customerId=${customerId}" class="btn btn-light rounded-pill">다음</a>
						        </c:if>
						    </div>
					    </div>
					    <br>
			   		</div>
			   	</section>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>