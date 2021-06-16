<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
	$('#amountBtn').click(function(){
		if($('#inventoryId').val() == ''){
			alert('inventoryId 입력');
		}else{
			$.ajax({
				type:'get',
				url:'/amount',
				data:{inventoryId : $('#inventoryId').val()},
				success: function(jsonData) {
					$(jsonData).each(function(index, item) {
						if(item.rating == 'NC-17'){
							alert('연령 확인이 필요합니다.');
						}
						$('#inventoryId').attr('readonly','readonly');
						$('#rentalDuration').append('<input type="text" name="rentalDuration" value="'+item.rentalDuration+'" readonly="readonly" class="form-control">');
						$('#amount').append('<input type="text" name="amount" value="'+item.amount+'" readonly="readonly" class="form-control">');	
						$('#rentalBtn').append('<button id="btn" class="btn btn-secondary">대여</button>');
						$('#amountBtn').remove();
					});					
				}	
			});			
		}		
	});
	
	$('#btn').click(function(){
		$('#addForm').submit();
	});
	
	
});
</script>
<title>addRental</title>
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
                <h3>add Rental</h3>
            </div>
            <div class="page-content">
            	<section class="row">
            		<div class="card">
            			<br>
						<form method="post" action="${pageContext.request.contextPath}/admin/addRental" id="addForm">
							<input type="hidden" name="customerId" value="${customerId}">
							<input type="hidden" name="staffId" value="${staffId}">
							<table class="table table-hover">
								<tr>
									<td>staff</td>
									<td>
										<input type="text" value="${username}" readonly="readonly" class="form-control">
									</td>
								</tr>
								<tr>
									<td>inventoryId</td>
									<td>
										<input type="text" name="inventoryId" id="inventoryId" class="form-control">
									</td>
								</tr>
								<tr>
									<td>rentalDuration</td>
									<td>
										<span id="rentalDuration"></span>
									</td>
								</tr>
								<tr>
									<td>amount</td>
									<td>
										<span id="amount"></span>
									</td>
								</tr>
							</table>		
							<button id="amountBtn" class="btn btn-secondary" type="button">계산</button>
							<span id="rentalBtn"></span>
						</form>
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