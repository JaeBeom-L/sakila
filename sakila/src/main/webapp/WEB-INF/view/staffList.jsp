<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>staffList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" type="image/x-icon">
</head>
<body>
<div class="app">
	<jsp:include page="/WEB-INF/view/nav.jsp"/>
	<div id="main">
	    	<header class="mb-3">
	        	<a href="#" class="burger-btn d-block d-xl-none">
	      			<i class="bi bi-justify fs-3"></i>
	            </a>
	        </header>
	        <div class="page-heading">
                <h3>staffList</h3>
            </div>
            <div class="page-content">
            	<section class="row">
            		<div class="card">
            			<br>
					    <div class="row">
					    	<form action="${pageContext.request.contextPath}/admin/staffList" class="form-inline">
						    	<div class="col-1">
							    	<select name="staffSID" class="custom-select" id="staffSID">
							    		<option value="" ${staffSID == '' ? 'selected="selected"' : '' }>전체</option>
							    		<option value="1" ${staffSID == '1' ? 'selected="selected"' : '' }>1</option>
							    		<option value="2" ${staffSID == '2' ? 'selected="selected"' : '' }>2</option>
							    	</select>
						    	</div>
						    	<div class="col-1">
					    			<button class="btn btn-secondary">보기</button>
					    		</div>
					    	</form>
					    </div>
					    <br>
					    <table class="table table-hover">
					        <thead class="thead-light">
					            <tr>
					                <th>ID</th>
					                <th>name</th>
					                <th>address</th>
					                <th>ZIP CODE</th>
					                <th>phone</th>
					                <th>city</th>
					                <th>country</th>
					                <th>SID</th>
					            </tr>
					        </thead>
					        <tbody>
					        	<c:forEach var="b" items="${staffList}">
					                <tr>
						            	<td>${b.ID}</td>
						            	<td>${b.name}</td>
						            	<td>${b.address}</td>
						            	<td>${b.zipcode}</td>
						            	<td>${b.phone}</td>
						            	<td>${b.city}</td>
						            	<td>${b.country}</td>
						            	<td>${b.SID}</td>
					                </tr>
					          	</c:forEach>
					        </tbody>
					    </table>
					    <div>
					    	<a href="${pageContext.request.contextPath}/admin/addStaff" class="btn btn-outline-dark">add staff</a>
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